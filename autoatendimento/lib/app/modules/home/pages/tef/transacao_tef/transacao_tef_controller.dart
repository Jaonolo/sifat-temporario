// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/tef/cancelamento_tef/cancelamento_tef_controller.dart';
import 'package:autoatendimento/app/modules/home/repositories/printer_repository.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:autoatendimento/app/utils/dialog_auto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:models/model/sitef_protocolo_socket.dart';
import 'package:utils/utils/date_time_utils.dart';
import 'package:web_socket_channel/html.dart';

part 'transacao_tef_controller.g.dart';

class TransacaoTefController = TransacaoTefBase with _$TransacaoTefController;

abstract class TransacaoTefBase with Store {
  VendaController vendaController = Modular.get();
  AppController appController = Modular.get();
  HomeController homeController = Modular.get();
  CancelamentoTefController cancelamentoTefController = Modular.get();
  String viaCliente = "";
  String? xml;
  late HtmlWebSocketChannel channel;
  SitefProtocoloSocket sitefProtocoloSocket = SitefProtocoloSocket();

  @observable
  String? bufferSitef;

  @observable
  bool permiteCancelar = true;

  bool isCancelamento = false;

  bool isReimpressao = false;

  TransacaoCartao? transacaoCancelamentoOrigem;

  TransacaoCartao? transacaoCartaoFinal;

  @action
  atualizaBuffer(String value) {
    bufferSitef = value;
  }

  @action
  atualizaPermiteCancelar(bool value) {
    permiteCancelar = value;
  }

  //Chamadas via socket para a DLL do Clisitef

  @action
  Future<void> comunicaWebSocket(BuildContext context) async {
    viaCliente = "";
    xml = "";

    channel = HtmlWebSocketChannel.connect("ws://localhost:12345");
    channel.stream.listen((message) {
      print('--> $message');

      //Processo Buffer (Durante a transação)
      if (message.toString().startsWith('[SitefBuffer]')) {
        if (message.contains('Aguarde, em processamento')) {
          atualizaPermiteCancelar(false);
        }

        atualizaBuffer(_messageSitefTratada(message));
      }

      //Sucesso (Transação OK)
      else if (message.toString().startsWith('[SitefSuccess]')) {
        _tratativasRetornoSucesso(message.substring(14), context);
      }

      //Falha (Transação Falhou)
      else if (message.toString().startsWith('[SitefFail]')) {
        _tratativasRetornoFalha(_messageSitefTratada(message), context);
      }

      //Finalizado (Pendencia da transação Finalizada)
      else if (message.toString().startsWith('[SitefFinished]')) {
        String content = message.substring(15);
        switch (content) {
          case "EFETUADA":
            //Imprimir Cupom Fiscal e Comprovante TEF
            atualizaBuffer("Imprimindo cupom fiscal");
             _printerNFCe(xml ?? "", context);
            break;
          case "CANC_PDV":
            break;
        }
      }
    }).onError((e) {
      atualizaPermiteCancelar(true);
      atualizaBuffer("Problema ao transacionar o cartão: \n$e");
    });
  }

  Future<void> transacionar(BigDecimal valorTotal, String tipoPagamentoTEF,
      int identificadorTransacao) async {
    this.isReimpressao = false;
    this.isCancelamento = false;
    sitefProtocoloSocket = SitefProtocoloSocket();
    sitefProtocoloSocket.funcao = "transacionar";
    sitefProtocoloSocket.param = SitefProtocoloSocketParam();
    sitefProtocoloSocket.param!.valor = valorTotal;
    sitefProtocoloSocket.param!.cupomFiscal = identificadorTransacao;
    sitefProtocoloSocket.param!.tipoPagamentoTEF = tipoPagamentoTEF;

    channel.sink.add(sitefProtocoloSocket.toJson());
  }

  Future<void> cancelarTransacao(TransacaoCartao transacaoCartao, String tipoPagamentoTEF) async {
    this.isReimpressao = false;
    this.isCancelamento = true;
    transacaoCancelamentoOrigem = transacaoCartao;

    sitefProtocoloSocket = SitefProtocoloSocket();
    sitefProtocoloSocket.funcao = "cancelarTransacao";
    sitefProtocoloSocket.param = SitefProtocoloSocketParam();
    sitefProtocoloSocket.param!.confirmaTransacao = false;
    sitefProtocoloSocket.param!.data = DateTimeUtils.format(transacaoCartao.data, DateTimeUtils.dataFormat)?.replaceAll("/", "");
    sitefProtocoloSocket.param!.nsu = transacaoCartao.nsu!.substring(3);
    sitefProtocoloSocket.param!.valor = transacaoCartao.valor!;
    sitefProtocoloSocket.param!.cupomFiscal = transacaoCartao.idTransacaoCancelamento;
    sitefProtocoloSocket.param!.tipoPagamentoTEF = tipoPagamentoTEF;

    channel.sink.add(sitefProtocoloSocket.toJson());
  }

  Future<void> reimprimirTransacao() async {

    // REIMPRESSÃO NÃO FUNCIONANDO

    this.isCancelamento = false;
    this.isReimpressao = true;
    sitefProtocoloSocket = SitefProtocoloSocket();
    sitefProtocoloSocket.funcao = "reimpressaoTransacao";
    sitefProtocoloSocket.param = SitefProtocoloSocketParam();
    sitefProtocoloSocket.param!.data = "20220829";
    sitefProtocoloSocket.param!.nsu = "000290003";

    channel.sink.add(sitefProtocoloSocket.toJson());
  }

  Future<void> cancelar() async {
    SitefProtocoloSocket sitefProtocoloSocket = SitefProtocoloSocket();
    sitefProtocoloSocket.funcao = "abortar";
    channel.sink.add(sitefProtocoloSocket.toJson());
    recomecar();
  }

  Future<void> recomecar() async {
    atualizaBuffer("Transação cancelada...");
    await Future.delayed(const Duration(seconds: 2));
    if(this.isCancelamento)
      Modular.to.pushNamed("/cancelamento_tef");
     else
      homeController.recomecar();
    //limpando variaveis
    atualizaBuffer("");
  }

  void tentarNovamente() {
    channel.sink.add(sitefProtocoloSocket.toJson());
  }

  void naoTentarNovamente() {

    if(!this.isCancelamento)
      vendaController.descartarNotaFinalizadoras();

    Modular.to.pop();
  }

  Future<void> finalizar(int identificadorTransacao, bool confirma) async {
    print('TransacaoTefBase.finalizar');
    SitefProtocoloSocket sitefProtocoloSocket = SitefProtocoloSocket();
    sitefProtocoloSocket.funcao = "finalizar";
    sitefProtocoloSocket.param = SitefProtocoloSocketParam();
    sitefProtocoloSocket.param!.cupomFiscal = identificadorTransacao;
    sitefProtocoloSocket.param!.confirmaTransacao = confirma;

    channel.sink.add(sitefProtocoloSocket.toJson());
  }

  Future<void> finalizarCancelamento(TransacaoCartao transacaoCartao) async {
    print('TransacaoTefBase.finalizarCancelamento');

    SitefProtocoloSocket sitefProtocoloSocket = SitefProtocoloSocket();
    sitefProtocoloSocket.funcao = "finalizarCancelamento";
    sitefProtocoloSocket.param = SitefProtocoloSocketParam();
    sitefProtocoloSocket.param!.data = DateTimeUtils.format(transacaoCartao.data, DateTimeUtils.dataFormat)?.replaceAll("/", "");
    sitefProtocoloSocket.param!.nsu = transacaoCartao.nsu;
    sitefProtocoloSocket.param!.valor = transacaoCartao.valor!;
    sitefProtocoloSocket.param!.cupomFiscal = transacaoCartao.idTransacaoCancelamento;

    channel.sink.add(sitefProtocoloSocket.toJson());
  }

  //Tratativas retorno

  Future<void> _tratativasRetornoSucesso(String value, BuildContext context) async {

      //Responsabilidade do método:
      //Capturar a transação cartão
      if (value.isNotEmpty) {
        Map<String, dynamic> valueMap = json.decode(value);
        TransacaoCartao transacaoCartao = TransacaoCartao.fromJson(valueMap);
        if(this.isCancelamento){
          _finalizaCancelamento(transacaoCartao,context);
        }else if(this.isReimpressao) {
          _printTefComprovante(transacaoCartao, context);
        } else{
          //Salvar a via do cliente em memória
          viaCliente = transacaoCartao.viaCliente!;
          vendaController.nota.finalizadoras[0].transacaoCartao = transacaoCartao;
          _finalizaVenda(context,transacaoCartao);
        }
      }
    }

  Future<void> _tratativasRetornoFalha(String motivo, BuildContext context) async {
    String motivoTratado = (motivo.isNotEmpty ? 'Motivo: $motivo' : '');

    atualizaPermiteCancelar(false);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => DialogAuto(
              title: isCancelamento ? "Não foi cancelada transação" : "Pagamento não aprovado",
              message: '$motivoTratado \n\n Tentar novamente ?',
              txtConfirmar: "Sim",
              txtCancelar: "Não",
              onConfirm: () => tentarNovamente(),
              onCancel: () => naoTentarNovamente(),
            ));
  }

  //Processos pós transação

  Future<void> _finalizaVenda(BuildContext context, TransacaoCartao transacaoCartao) async {
    atualizaBuffer("Finalizando pedido");
    try {
      //Insere os itens
      await vendaController.insereItensAPI();

      //Receber venda
      await vendaController.receberVendaAPI(context);

      if (appController.estacaoTrabalho.emissorFiscal != null) {
        //Emitir cupom fiscal
        xml = await vendaController.emitirFiscal();
      } else {
        xml = null;
      }

      transacaoCartaoFinal = transacaoCartao;
      //Confirmar transação TEF
      await finalizar(vendaController.nota.id!, true);
    } catch (e) {
      String erro = e.toString();

      if (e.runtimeType == PwsException) {
        e as PwsException;
        if (e.message != null) erro = e.message!;
        if (e.pws != null && e.pws!.description != null)
          erro += "\n" + e.pws!.description!;
      }

      print('[ERRO - tratativasPosTransacao]: ${e.toString()}');

      _tentarNovamentePrinter(
          "Desculpe! \n\n Ocorreu um problema na finalização do pedido:\n\n [$erro] \n\n"
              " Caso queira solicitar cupom fiscal, favor dirigir-se ao caixa.",
              () => _printConsumo(context),
              () => {_avancar()},
          txt: "Continuar",
          showCancelBtn: false,
          context);
    }
  }

  Future<void> _finalizaCancelamento(TransacaoCartao transacaoCartao,BuildContext context) async {
    atualizaBuffer("Finalizando cancelamento");
    try {
      //Confirmar transação TEF
      await finalizarCancelamento(transacaoCartao);

      //Insere a transação de cancelamento no banco
      transacaoCartao.valor = this.transacaoCancelamentoOrigem!.valor;
     await cancelamentoTefController.inserirTransacaoCancelamento(this.transacaoCancelamentoOrigem!, transacaoCartao, context);

      if(appController.servicoAutoAtendimento.impressaoTef
          .equals(ImpressaoVenda.IMPRIME)){
        _printTefComprovante(transacaoCartao, context);
      }else if(appController.servicoAutoAtendimento.impressaoTef
          .equals(ImpressaoVenda.PERGUNTA)){
        _dialogConfirmar("Transação cancelada", context, transacaoCartao);
      }
    } catch (e) {
      String erro = e.toString();

      if (e.runtimeType == PwsException) {
        e as PwsException;
        if (e.message != null) erro = e.message!;
        if (e.pws != null && e.pws!.description != null)
          erro += "\n" + e.pws!.description!;
      }

      print('[ERRO - tratativasPosTransacao]: ${e.toString()}');
    }
  }

  //Impressão

  Future<void> _printerNFCe(String xml, BuildContext context) async {
    try {
      print('xml >> $xml');
      if (xml.isEmpty) {
        List<NotaItem> itens = [];
        for (var ni in vendaController.itensLancados) {
          itens.add(ni.notaItem);
        }
        await PrinterRepository.printerVenda(
            appController.pwsConfigLocal,
            vendaController.nota,
            appController.servicoAutoAtendimento,
            itens,
            appController.getImpressoraVenda().impressora!,
            senha: vendaController.nota.consumo!.comanda.toString(),
            mensagemRodape: "");
      } else {
        await PrinterRepository.printerNFCe(appController.pwsConfigLocal, xml,
            appController.getImpressoraVenda().impressora!,
            senha: vendaController.nota.consumo!.senhaAtendimento ??
                vendaController.nota.consumo!.comanda.toString(),
            mensagemRodape: "");
      }

      if (appController.servicoAutoAtendimento.impressaoTef.equals(ImpressaoVenda.IMPRIME)) {
        _printTefComprovante(transacaoCartaoFinal!, context);
      } else if (appController.servicoAutoAtendimento.impressaoTef .equals(ImpressaoVenda.PERGUNTA)) {
        _dialogConfirmar("Transação efetuada", context, transacaoCartaoFinal!);
      } else if (appController.servicoAutoAtendimento.impressaoVenda.equals(ImpressaoVenda.IMPRIME)) {
        _printConsumo(context);
      } else {
        _avancar();
      }
    } catch (e) {
      _tentarNovamentePrinter(
          "Desculpe, houve um problema na impressão do cupom fiscal",
              () => _printerNFCe(xml, context),
              () => appController.servicoAutoAtendimento.impressaoTef.equals(ImpressaoVenda.IMPRIME)
                  ? _printTefComprovante( transacaoCartaoFinal!, context)
                  : (appController.servicoAutoAtendimento.impressaoTef.equals(ImpressaoVenda.PERGUNTA)
                  ? _dialogConfirmar( "Transação efetuada", context, transacaoCartaoFinal!)
                  : _printConsumo(context)),
          context);
      return;
    }
  }

  Future<void> _printConsumo(BuildContext context) async {
    try {
      if (appController.servicoAutoAtendimento.impressaoVenda
          .equals(ImpressaoVenda.IMPRIME)) {
        List<NotaItem> itens = [];
        for (var ni in vendaController.itensLancados) {
          itens.add(ni.notaItem);
        }
        await PrinterRepository.printerConsumo(
            appController.pwsConfigLocal,
            vendaController.nota,
            appController.servicoAutoAtendimento,
            itens,
            appController.getImpressoraVenda().impressora!,
            senha: vendaController.nota.consumo!.comanda.toString(),
            mensagemRodape: "");
      }
      _avancar();
    } catch (e) {
      _tentarNovamentePrinter(
          "Desculpe, houve um problema na impressão do pedido",
          () => _printConsumo(context),
          () => _avancar(),
          context);
      return;
    }
  }

  Future<void> _printTefComprovante(TransacaoCartao transacaoCartao ,BuildContext context) async {
    try {
        await PrinterRepository.printerTefComprovante(
            appController.pwsConfigLocal,
            transacaoCartao.viaCliente!,
            transacaoCartao.viaCaixa == null ? "" : transacaoCartao.viaCaixa!,
            appController.servicoAutoAtendimento,
            appController.getImpressoraVenda().impressora!,);

        if (appController.servicoAutoAtendimento.impressaoVenda
            .equals(ImpressaoVenda.IMPRIME)) {
          _printConsumo(context);
        } else {
          _avancar();
        }
    } catch (e) {
      _tentarNovamentePrinter(
        this.isCancelamento
            ? "Desculpe, houve um problema na impressão na via de cancelamento"
            : "Desculpe, houve um problema na impressão do comprovante" ,
          () => _printTefComprovante(transacaoCartao,context),
          () => appController.servicoAutoAtendimento.impressaoVenda.equals(ImpressaoVenda.IMPRIME)
              ?  _printConsumo(context)
              : _avancar() ,
          context);
      return;
    }
  }

  void _tentarNovamentePrinter(String title, Function onConfirmar,
      Function onCancelar, BuildContext context , { bool showCancelBtn = true ,  String txt = ""}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (c) => DialogAuto(
          title: title,
          message: "",
          txtConfirmar: "Tentar novamente" ,
          onConfirm: onConfirmar,
          onCancel: onCancelar,
          showCancelButton: showCancelBtn,
        ));
  }

  void _avancar() {
    if(this.isCancelamento) {
      Modular.to.pushNamed("/cancelamento_tef");
    } else if(this.isReimpressao){
      Modular.to.pushNamed("/administrativo_tef");
    }else {
      Modular.to.popUntil(ModalRoute.withName('/home'));
      Modular.to.pushNamed("/finalizado");
    }
  }

  Future<void> _dialogConfirmar(String motivo, BuildContext context,TransacaoCartao transacaoCartao) async {
   await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (c) => DialogAuto(
          title: "$motivo \n",
          message: "Deseja imprimir o comprovante?",
          txtConfirmar: "Sim",
          txtCancelar: "Não",
          onConfirm: () => _printTefComprovante(transacaoCartao, context),
          onCancel: () => _avancar(),
        ));
  }

  String _messageSitefTratada(String message) {
    if (message.contains('Conectando Servidor')) {
      return 'Conectando com servidor do Sitef';
    }

    if (message.contains('Sem conexao Servidor')) {
      return 'Sem conexão com servidor do Sitef';
    }

    if (message.contains('Insira ou passe ou aproxime o cartao na leitora')) {
      return 'Insira, passe ou aproxime o cartão na leitora';
    }

    if (message.toUpperCase().contains('SOLICITE') &&
        message.toUpperCase().contains('SENHA')) {
      return 'Informe a senha na leitora';
    }

    if (message.contains('Transacao Aprov.')) return 'Transação aprovada';

    if(message.contains("Selecione o tipo de cancelamento")){
      return "Aguarde, em processamento";
    }

    if(message.contains("Confirma Cancelamento")){
      return "Confirmando Cancelamento";
    }
    if(message.contains("Cancelamento de Cartao de Debito") ||
        message.contains("Debito") ||
        message.contains("Credito") ||
        message.contains("Carteira Digital") ){
      return "Aguarde, em processamento";
    }

    var split = message.split(']');
    return split[1];
  }
}
