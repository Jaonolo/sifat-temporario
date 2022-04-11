import 'dart:convert';
import 'package:core/application/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:models/model/models.dart';

class RedePOS {
  static late BuildContext _context;
  static bool? _sucesso;
  static Map<String, String?>? _dadosTransacao;
  static const _platform = const MethodChannel("rede_channel");

//  static const _channel =
//      const BasicMessageChannel("rede_message_channel", StandardMessageCodec());

  //----------------------------------------------------- METHODS ------------------------------------------------------

  static Future<bool?> transacionar(BuildContext ctx, int valor,
      FinalizadoraEmpresa finalizadora) async {
    try {
      _sucesso = false;
      _context = ctx;
      _dadosTransacao = Map<String, String?>();
      _dadosTransacao!['funcao'] = finalizadora.finalizadora!.finalizadoraRFB;
      _dadosTransacao!['valor'] = valor.toString();

      Application
          .getInstance()
          .transacaoCartao = TransacaoCartao();
      Application
          .getInstance()
          .transacaoCartao!
          .bandeira = BandeiraCartao();

      var result = await _platform
          .invokeMethod('transacionar', {"dados": _dadosTransacao});

      _sucesso = true;
      Application
          .getInstance()
          .transacoes
          .add(_dadosTransacao);
      Map<String, Object> decode = jsonDecode(result);
      _alimentaTransacaoCartao(decode);
    } on Exception catch (e, s) {
      print(s);
      Navigator.pop(_context);
    }
    return _sucesso;
  }

  static Future<bool?> estornar(BigDecimal valor,
      BandeiraCartao bandeiraCartao) async {
    try {
      _sucesso = false;

      Application
          .getInstance()
          .transacaoCartao = TransacaoCartao();
      Application
          .getInstance()
          .transacaoCartao!
          .bandeira = bandeiraCartao;
      Application
          .getInstance()
          .transacaoCartao!
          .data = DateTime.now();
      Application
          .getInstance()
          .transacaoCartao!
          .valor = valor;

      var result = await _platform.invokeMethod('estornar');

      Map<String, Object> decode = jsonDecode(result);
      Application
          .getInstance()
          .transacaoCartao!
          .nsu = decode['transactionNumber'] as String?;
      Application
          .getInstance()
          .transacaoCartao!
          .sucesso = true;

      _sucesso = true;
    } on Exception catch (e, s) {
      print(s);
      Navigator.pop(_context);
    }
    return _sucesso;
  }

  static Future<bool?> reimpressao() async {
    try {
      _sucesso = false;
      await _platform.invokeMethod('reimprimir');
      _sucesso = true;
    } on Exception catch (e, s) {
      print(s);
      Navigator.pop(_context);
    }
    return _sucesso;
  }

  static void _alimentaTransacaoCartao(Map<String, Object> map) {
    var transacaoCartao = Application
        .getInstance()
        .transacaoCartao!;
    transacaoCartao.data =
        DateTime.fromMillisecondsSinceEpoch(map["date"] as int);
    transacaoCartao.nsu = map["nSU"] as String?;
    transacaoCartao.codigoAutorizacao = map["aUTO"] as String?;
    transacaoCartao.numeroParcelas = map["installments"] as int?;
    transacaoCartao.idEmpresa = Application
        .getInstance()
        .empresa
        .id;
    transacaoCartao.valor = BigDecimal(map["value"].toString());

    String tipoTransacao = map["operationType"] as String;
    if (tipoTransacao.toUpperCase().contains("CRÉDITO"))
      tipoTransacao = "CREDITO";
    else if (tipoTransacao.toUpperCase().
    contains("DÉBITO"))
      tipoTransacao = "DEBITO";

    var bandeira = transacaoCartao.bandeira!;
    bandeira.bandeira = map["flag"] as String?;
    bandeira.idEmpresa = Application
        .getInstance()
        .empresa
        .id;
    bandeira.operacao = tipoTransacao;
    bandeira.tipoTransacao = "TEF";
    bandeira.tipoTEF = "REDE";
  }
}
