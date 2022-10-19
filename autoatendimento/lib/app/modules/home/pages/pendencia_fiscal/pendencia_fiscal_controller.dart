import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/utils/autoatendimento_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/pendencia_requester.dart';
import 'package:requester/requester/nota_requester.dart';

import '../../../../utils/dialog_auto.dart';
import '../../../venda/repository/nota_repository.dart';
import '../../repositories/printer_repository.dart';

part 'pendencia_fiscal_controller.g.dart';

class PendenciaFiscalController = PendenciaFiscalBase
    with _$PendenciaFiscalController;

abstract class PendenciaFiscalBase with Store {
  static AppController appController = Modular.get();

  List<Pendencia> pendencias = [];

  String totalPedidos = '';

  String lblTotal = "";

  Pendencia? pendencia = new Pendencia();

  Future<void> adicionarPendencias(List<Pendencia> pendencia) async {
    if (pendencia.isNotEmpty) {
      pendencias.addAll(pendencia);
    }
  }

  @action
  Future<List> carregaPendencias() async {
    return await PendenciaRequester.buscar(
            appController.pwsConfig, appController.token, pendencias.length)
        .then((response) {
      if (response.status == 200) {
        adicionarPendencias(response.content);
        print(pendencias.length);
        lblTotal = "TOTAL: ${pendencias.length.toString()} / ${totalPedidos}";
        return pendencias;
      } else if (response.status == 204) {
        print(response.content);
        return [];
      } else {
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      if (e is WaybeException) throw e;
      throw WaybeException('Problema ao buscar Pendencias');
    });
  }

  Future<void> existePendencia() async {
    return await PendenciaRequester.existePendencias(
            appController.pwsConfig, appController.token)
        .then((response) {
      if (response.status == 200) {
        totalPedidos = response.body.toString();
        return totalPedidos;
      } else if (response.status == 204) {
        print(response.content);
        return [];
      } else {
        throw PwsException(response.content);
      }
    });
  }

  //----------FUNÇÃO EMITIR--------------/

  Future<void> carregaNotaParaEmissao(Pendencia p, BuildContext context) async {
    AutoatendimentoUtils.showProgress(context: context);
    pendencia = new Pendencia();
    pendencia = p;
    return await NotaRequester.carregar(appController.pwsConfig,
            appController.token, pendencia!.idEntidade!)
        .then((response) {
      if (response.status == 200) {
        Nota nota = response.content;
        resolvePendencia(nota, context);
      } else {
        AutoatendimentoUtils.closeProgress(context: context);
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      if (e is WaybeException) throw e;
      throw WaybeException('Problema ao carregar nota para emissão');
    });
  }

  Future<void> resolvePendencia(Nota nota, BuildContext context) async {
    EstacaoTrabalho estacaoTrabalho = appController.estacaoTrabalho;
    //REMOVElISTA

    if (pendencia!.tipoPendencia == "EMISSAO_NOTA" &&
        nota.status == "CANCELADA") {
      return await NotaRequester.arquivarPendencia(appController.pwsConfig,
              appController.token, nota.id!, pendencia!.tipoPendencia!)
          .then((response) {
        if (response.status == 200) {
          AutoatendimentoUtils.closeProgress(context: context);
          print('Pendencia arquivada com sucesso');
        } else {
          throw PwsException(response.content);
        }
      }).catchError((e, s) {
        AutoatendimentoUtils.closeProgress(context: context);
        if (e is WaybeException) throw e;
        throw WaybeException('Problema ao arquivar pendencia');
      });
    }

    if (nota.notaFiscal != null) {
      if (nota.notaFiscal!.idEmissorFiscal == null ||
          (estacaoTrabalho.emissorFiscal != null &&
              nota.notaFiscal!.idEmissorFiscal ==
                  estacaoTrabalho.emissorFiscal!.id)) {
        await _emitirFiscal(nota, pendencia!, context);
      } else {
        try {
          await verificaEmissaoNFCe(nota, context);
        } catch (e) {
          print(e);
        }
      }
    } else {
      await _emitirFiscal(nota, pendencia!, context);
    }
  }

  Future _emitirFiscal(
      Nota nota, Pendencia pendencia, BuildContext context) async {
    try {
      await emitirFiscal(nota);
      AutoatendimentoUtils.closeProgress(context: context);

      _tentarNovamentePrinter("Nota Emitida com sucesso", () async {
        pendencias.remove(pendencia);
      }, context, "Confirmar");
    } catch (e) {
      String erro = e.toString();

      if (e.runtimeType == PwsException) {
        e as PwsException;
        if (e.message != null) erro = e.message!;
        if (e.pws != null && e.pws!.description != null)
          erro += "\n" + e.pws!.description!;
      }

      print('[ERRO - tratativasPosTransacao]: ${e.toString()}');
      AutoatendimentoUtils.closeProgress(context: context);
      _tentarNovamentePrinter(
          "Desculpe! \n\n Ocorreu um problema na finalização do pedido:\n\n [$erro]",
          () => carregaNotaParaEmissao(pendencia!, context),
          context,
          "Tentar novamente");
    }
  }


  Future<void> emitirFiscal(Nota nota) async {
    await NotaRepository.emitirFiscal(nota, "NFCE").catchError((e) => throw e);
  }

  Future<void> verificaEmissaoNFCe(Nota nota, BuildContext context) async {
    return await NotaRequester.validarEmissaoNfce(
            appController.pwsConfig, appController.token, nota.id!)
        .then((response) {
      if (response.status == 200) {
        XmlDTO object = response.content;
        _printerNFCe(object.xml!, context, nota);
        print('Pendencia arquivada com sucesso');
      } else if (response.status == 204) {
        removeNotaFiscal(nota, context);
      } else {
        AutoatendimentoUtils.closeProgress(context: context);
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      if (e is WaybeException) throw e;
      throw WaybeException('Problema ao arquivar pendencia');
    });
  }

  Future<void> removeNotaFiscal(Nota nota, BuildContext context) async {
    return await NotaRequester.liberarEmissorFiscal(
            appController.pwsConfig, appController.token, nota.id!)
        .then((response) {
      if (response.status == 200) {
        AutoatendimentoUtils.closeProgress(context: context);
        carregaNotaParaEmissao(pendencia!, context);
      } else {
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      if (e is WaybeException) throw e;
      throw WaybeException('Problema ao carregar nota para emissão');
    });
    ;
  }

  Future<void> _printerNFCe(String xml, BuildContext context, Nota nota) async {
    try {
      print('xml >> $xml');
      if (xml.isEmpty) {
        return;
      } else {
        await PrinterRepository.printerNFCe(appController.pwsConfigLocal, xml,
            appController.getImpressoraVenda().impressora!,
            senha: nota.consumo!.senhaAtendimento ??
                nota.consumo!.comanda.toString(),
            mensagemRodape: "");
      }
      AutoatendimentoUtils.closeProgress(context: context);
      return;
    } catch (e) {
      _tentarNovamentePrinter(
          "Desculpe, houve um problema na impressão do cupom fiscal",
          () => _printerNFCe(xml, context, nota),
          context,
          "Tentar novamente");
      return;
    }
  }

  void _tentarNovamentePrinter(String title, Function onConfirmar,
      BuildContext context, String txtConfirmar,
      {String txt = ""}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (c) => DialogAuto(
              title: title,
              message: "",
              txtConfirmar: txtConfirmar,
              onConfirm: onConfirmar,
              showCancelButton: true,
            ));
  }
//-----------------------------------/
}
