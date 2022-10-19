import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/utils/autoatendimento_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/consumo_requester.dart';
import 'package:requester/requester/nota_requester.dart';
import 'package:requester/response/response_pws.dart';

class NotaRepository {


  static AppController appController = Modular.get();

  static Future<Nota> inserir(Nota nota, BuildContext context) async {
    AutoatendimentoUtils.showProgress(context: context);
    return await ConsumoRequester.inserir(
        appController.pwsConfig, appController.token, nota)
        .then((response) {
      AutoatendimentoUtils.closeProgress(context: context);
      if (response.isSuccess) {
        Nota nota = response.content;
        return nota;
      } else {
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      AutoatendimentoUtils.catchError(e, s, context);
    });
  }

  static Future<Nota> receber(Nota nota, BuildContext context) async {
    //Não possui permissaão para limiteExcedente em debitar do cliente
    return await ConsumoRequester.receber(
        appController.pwsConfig, appController.token, nota, false)
        .then((response) {
      if (response.isSuccess) {
        Nota nota = response.content;
        return nota;
      } else {
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      AutoatendimentoUtils.catchError(e, s, context);
    });
  }

  static Future<String?> emitirFiscal(Nota nota, String modeloFiscal) async {

    if(!isNotaNaoMontada(nota)){
      print('XML envio =' + nota.notaFiscal!.notaXml!.xmlEnvio!.toString());
      return await _emitirNFCe(nota, gerarImpressao: true)
          .then((response) async {
        if (response.isSuccess) {
          XmlDTO dto = response.content;
          String? xml = dto.xml;
          return xml;
        } else {
          PwsAlert pws = response.content;
          throw PwsException(pws);
        }
      });
    }

    return await _calcularImpostos(nota).then((response) async {
      if (response.isSuccess) {
        if (modeloFiscal == 'NFCE') {
          if (nota.notaFiscal == null) await _montarNFCe(nota);
          return await _emitirNFCe(nota, gerarImpressao: true)
              .then((response) async {
            if (response.isSuccess) {
              XmlDTO dto = response.content;
              String? xml = dto.xml;
              return xml;
            } else {
              PwsAlert pws = response.content;
              throw PwsException(pws);
            }
          });
        }
      } else {
        PwsAlert alert = response.content;
        throw PwsException(alert);
      }
    }).catchError((e, s) {
      print(e);
      print(s);
      throw e;
    });
  }

  static bool isNotaNaoMontada(Nota nota) {

    return nota.notaFiscal == null
        || nota.notaFiscal!.notaXml == null
        || ((nota.notaFiscal!.notaXml!.xmlEnvio == null || nota.notaFiscal!.notaXml!.xmlEnvio!.isEmpty)
            && (nota.notaFiscal!.notaXml!.xmlEmissao == null || nota.notaFiscal!.notaXml!.xmlEmissao!.isEmpty));
  }

  //Métodos privados da classe

  // ignore: unused_element
  static Future<ResponsePws> _carregar(num idNota) {
    return NotaRequester.carregar(
        appController.pwsConfig, appController.token, idNota);
  }

  static Future<ResponsePws> _calcularImpostos(Nota nota) {
    return NotaRequester.calcularImpostos(
        appController.pwsConfig, appController.token, nota);
  }

  static Future<ResponsePws> _montarNFCe(Nota nota) {
    return NotaRequester.montarNFCe(
        appController.pwsConfig, appController.token, nota);
  }

  static Future<ResponsePws> _emitirNFCe(Nota nota,
      {bool gerarImpressao = false}) {
    return NotaRequester.emitirNFCe(
        appController.pwsConfig, appController.token, nota,
        gerarImpressao: gerarImpressao);
  }
}
