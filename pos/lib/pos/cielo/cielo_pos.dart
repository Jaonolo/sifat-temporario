import 'dart:convert';

import 'package:core/application/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:models/model/models.dart';
import 'package:utils/widgets/confirmation_dialog.dart';

class CieloPos {
  static bool? _sucesso;
  static Map<String, dynamic>? _dadosTransacao;
  static const _platform = MethodChannel("cielo_channel");

  static Future<bool?> transacionar(BuildContext context, Nota nota, int valor,
      FinalizadoraEmpresa finalizadora) async {
    try {
      _sucesso = false;
      _dadosTransacao = {};
      _dadosTransacao!['funcao'] = finalizadora.finalizadora!.finalizadoraRFB;
      _dadosTransacao!['valor'] = valor.toString();
      _dadosTransacao!['IdNota'] = nota.id.toString();
      _dadosTransacao!['notaItem'] = listNotaItemfromJson(nota);

      var result = await _platform
          .invokeMethod('transacionar', {"dados": _dadosTransacao});

      Application
          .getInstance()
          .transacoes
          .add({
        "funcao": finalizadora.finalizadora!.finalizadoraRFB,
        "valor": valor.toString(),
      });
      Map<String, Object> decode = jsonDecode(result);
      _alimentaTransacaoCartao(decode);

      _sucesso = true;
      return _sucesso;
    } on PlatformException catch (e) {
      //Operação foi cancelada
      if (e.message!.contains("cancelada")) {
        showDialog(
            context: context,
            builder: (_) =>
                ConfirmationDialog(
                  message: "Operação cancelada",
                  txtConfirmar: "OK",
                ));
      } else {
        showDialog(
            context: context,
            builder: (_) =>
                ConfirmationDialog(
                  title:
                  "Ocorreu um erro no processo de pagamento. O tempo de resposta foi excedido. Por favor tente novamente.",
                  message: "Detalhes: ${e.toString()}",
                  txtConfirmar: "OK",
                ));
      }

      return _sucesso;
    }
  }

  static List listNotaItemfromJson(Nota nota) {
    List<Map<String, String>> list = [];
    for (var i in nota.itens) {
      list.add({
        "idNotaItem": i.id.toString(),
        "descricao": i.descricao.toString(),
        "precoUnitario": (i.precoUnitario! * BigDecimal('100')).toString(),
        // Preço unitário em centavos
        "quantidade": (i.quantidade! * BigDecimal('1')).toString(),
        "unityOfMeasure": "unidade",
        // Unidade de medida do produto String
      });
    }

    return list;
  }

  static void _alimentaTransacaoCartao(Map<String, Object> map) {
    List<dynamic> payments = map["payments"] as List<dynamic>;
    var paymentFields = payments[0]["paymentFields"];

    var transacaoCartao = TransacaoCartao();
    transacaoCartao.idEmpresa = Application
        .getInstance()
        .empresa
        .id;
    transacaoCartao.orderId = map["id"].toString();
    transacaoCartao.data = DateTime.fromMillisecondsSinceEpoch(int.parse(
        paymentFields["requestDate"])); //data no emulador sempre 02/01/1970
    transacaoCartao.nsu = payments[0]["cieloCode"];
    transacaoCartao.codigoAutorizacao = payments[0]["authCode"];
    transacaoCartao.numeroParcelas =
        int.parse(payments[0]["installments"].toString());
    transacaoCartao.valor =
        BigDecimal(payments[0]["amount"].toString()) / BigDecimal("100");

    int numeroTransacao = int.parse(paymentFields["v40Code"]);
    String? tipoTransacao;
    switch (numeroTransacao) {
      case 2: //teste do emulador me retorna sempre 2
      case 4:
        tipoTransacao = "CREDITO";
        break;
      case 8:
        tipoTransacao = "DEBITO";
        break;
      default:
        tipoTransacao = null;
        break;
    }

    var bandeira = BandeiraCartao();
    bandeira.bandeira = payments[0]["brand"];
    bandeira.idEmpresa = Application
        .getInstance()
        .empresa
        .id;
    bandeira.operacao = tipoTransacao;
    bandeira.tipoTransacao = "TEF";
    bandeira.tipoTEF = "CIELO";

    transacaoCartao.bandeira = bandeira;
    Application
        .getInstance()
        .transacaoCartao = transacaoCartao;
  }

  static Future<bool?> estornar(BuildContext context,
      TransacaoCartao transacaoCartao) async {
    try {
      _sucesso = false;

      _dadosTransacao = Map<String, String?>();

      int valor = (transacaoCartao.valor! * BigDecimal('100')).toInt();
      _dadosTransacao!['orderId'] = transacaoCartao.orderId.toString();
      _dadosTransacao!['authCode'] = transacaoCartao.codigoAutorizacao;
      _dadosTransacao!['cieloCode'] = transacaoCartao.nsu;
      _dadosTransacao!['valor'] = valor.toString();

      Application
          .getInstance()
          .transacaoCartao = TransacaoCartao();
      Application
          .getInstance()
          .transacaoCartao!
          .bandeira =
          transacaoCartao.bandeira;
      Application
          .getInstance()
          .transacaoCartao!
          .data = DateTime.now();
      Application
          .getInstance()
          .transacaoCartao!
          .valor = transacaoCartao.valor;

      var result =
      await _platform.invokeMethod('estornar', {"dados": _dadosTransacao});

      Map<String, Object> decode = jsonDecode(result);
      List<dynamic> payments = decode["payments"] as List<
          dynamic>; //Me retorna dois payments o original e o cancelamento
      Application
          .getInstance()
          .transacaoCartao!
          .nsu = payments[1]["cieloCode"];
      Application
          .getInstance()
          .transacaoCartao!
          .sucesso = true;
      _sucesso = true;
      return _sucesso;
    } on PlatformException catch (e) {
      //Operação foi cancelada
      if (e.message!.contains("cancelada")) {
        showDialog(
            context: context,
            builder: (_) =>
                ConfirmationDialog(
                  message: "Operação cancelada",
                  txtConfirmar: "OK",
                ));
      } else {
        showDialog(
            context: context,
            builder: (_) =>
                ConfirmationDialog(
                  title:
                  "Ocorreu um erro no processo de estorno. O tempo de resposta foi excedido. Por favor tente novamente.",
                  message: "Detalhes: ${e.toString()}",
                  txtConfirmar: "OK",
                ));
      }

      return _sucesso;
    }
  }
}
