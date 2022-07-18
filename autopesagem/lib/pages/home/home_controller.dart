import 'dart:async';
import 'package:autopesagem/config/app_config.dart';
import 'package:autopesagem/utils/auto_pesagem_utils.dart';
import 'package:autopesagem/utils/lanca_item_utils.dart';
import 'package:autopesagem/widgets/dialog_info.dart';
import 'package:autopesagem/widgets/dialog_informar_comanda_modulo.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/servico_auto_pesagem_requester.dart';
import 'package:requester/response/response_pws.dart';

part "home_controller.g.dart";

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  BigDecimal peso = BigDecimal.ZERO();

  @observable
  BigDecimal valorTotal = BigDecimal.ZERO();

  @observable
  bool controleBalanca = false;

  late Timer timer;

  Future<void> iniciaTimer(BuildContext context) async {
    timer = Timer.periodic(Duration(seconds: 3), (time) async {
      try {
        await lerPeso(context);
      } catch (e) {}
    });
  }

  void reiniciaTimer(BuildContext context) {
    desligaTimer();
    iniciaTimer(context);
  }

  void desligaTimer() {
    timer.cancel();
  }

  Future<void> lerPeso(BuildContext context) async {
    if (AppConfig.estacaoTrabalho.balanca!.portaSerial == null ||
        AppConfig.estacaoTrabalho.balanca!.portaSerial!.isEmpty ||
        AppConfig.estacaoTrabalho.balanca!.modelo == null ||
        AppConfig.estacaoTrabalho.balanca!.modelo!.isEmpty) {
      return;
    }
    ResponsePws lerPeso = await ServicoAutoPesagemRequester.lerPeso(
      AppConfig.pwsUtils,
      AppConfig.estacaoTrabalho.balanca!.portaSerial!,
      AppConfig.estacaoTrabalho.balanca!.baudrate.toString(),
      AppConfig.estacaoTrabalho.balanca!.modelo!,
    );

    atualizaDados(lerPeso, context);
  }

  @action
  Future<void> atualizaDados(ResponsePws retornoLeitura,
      BuildContext context) async {
    if (retornoLeitura.isSuccess) {
      peso = BigDecimal(retornoLeitura.content.toString());
    } else {
      peso = BigDecimal.ZERO();
    }
    valorTotal = AppConfig.servicoAutoPesagem.gradeEmpresa!.getPrecoVenda
        .multiplicar(peso);
    if (peso.compareTo(BigDecimal.ZERO()) == 0) {
      controleBalanca = false;
    } else {
      if (!controleBalanca) {
        try {
          //Desliga para finalizar essa operacao
          desligaTimer();

          AutoPesagemUtils.showProgress(context);

          Nota nota = Nota();

          Function onfinalizar = () {
            controleBalanca = true;

            //Indepedente do que acontecer ele reinicia o time
            reiniciaTimer(context);
            AutoPesagemUtils.closeProgress(context);
          };

          if (AppConfig.servicoAutoPesagem.lancamentoAutomatico != "NENHUM") {
            nota = await inserirComanda(context, valorTotal, peso);
            //cancelou na dialog de laçamento
            if (nota.consumo!.modulo == null) {
              onfinalizar.call();
              return;
            }
          }

          if (AppConfig.servicoAutoPesagem.imprimirPeso) {
            await imprimir(context, nota);
          }

          onfinalizar.call();
        } catch (e) {
          if (e is PwsException && e.pws != null) {
            dialogInfo(context, e.pws!.description!);
          } else {
            dialogInfo(context, "Ocorreu um erro ao inserir o item");
          }
        }
      }
    }
  }

  Future<Nota> inserirComanda(BuildContext context, BigDecimal total,
      BigDecimal peso) async {
    Map<String, String> mapDados = await showDialog(
        context: context, builder: (_) => DialogInformarComandaModulo());

    Nota nota = Nota();

    if (mapDados["comanda"] != null && mapDados["modulo"] != null) {
      nota = await LancaItemUtils.lancaItem(
          modulo: mapDados["modulo"]!,
          pesoAtual: peso,
          totalAtual: total,
          comanda: int.parse(
            mapDados["comanda"]!,
          ));
    }
    return nota;
  }

  Future<void> imprimir(BuildContext context, Nota nota) async {
    if (AppConfig.impressoraPadrao.impressora == null) {
      dialogInfo(context, "Nenhuma impressora encontrada");
      return;
    }

    TicketImpressaoDTO ticket = TicketImpressaoDTO();
    List<ItemDTO> itens = [];

    ticket.nomeRestaurante = AppConfig.empresa.pessoa!.apelido;
    ticket.equipamentoImpressao = AppConfig.impressoraPadrao.impressora;

    //Se tiver inserido uma nota pegos todos os itens para imprimir somente os inserido no autoPesagem pesados na comanda
    if (nota.id != null) {
      for (NotaItem item in nota.itens) {
        if (item.cancelado) {
          continue;
        }
        if (AppConfig.servicoAutoPesagem.gradeEmpresa!.id == item.idGrade) {
          ItemDTO dto = ItemDTO();
          dto.codigoInterno = AppConfig.servicoAutoPesagem.gradeEmpresa!
              .produtoEmpresa!.produto!.codigoInterno
              .toString();
          dto.produtoDescricao = item.descricao;
          dto.produtoValor = item.precoUnitario;
          dto.quantidade = item.quantidade;
          dto.valor = item.precoTotal;

          itens.add(dto);
        }
      }

      ticket.modulo = nota.consumo!.modulo;
      ticket.comanda = nota.consumo!.comanda.toString();
    } else {
      ItemDTO dto = ItemDTO();
      dto.produtoDescricao = AppConfig
          .servicoAutoPesagem.gradeEmpresa!.produtoEmpresa!.produto!.descricao;
      dto.codigoInterno = AppConfig.servicoAutoPesagem.gradeEmpresa!
          .produtoEmpresa!.produto!.codigoInterno
          .toString();
      dto.produtoValor =
          AppConfig.servicoAutoPesagem.gradeEmpresa!.getPrecoVenda;
      dto.quantidade = peso;
      dto.valor = valorTotal;
      itens.add(dto);
    }

    ticket.itens = itens;

    await ServicoAutoPesagemRequester.imprimir(AppConfig.pwsUtils, ticket);
  }

  Future<void> dialogInfo(BuildContext context, String error) {
    //Indepedente do que acontecer ele reinicia o time
    return showDialog(
        context: context,
        builder: (_) =>
            DialogInfo(
              title: "Aconteceu um erro",
              message: error,
              onCancel: () {
                AutoPesagemUtils.closeProgress(context);
                reiniciaTimer(context);
              },
            ));
  }
}
