import 'dart:async';

import 'package:core/application/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:models/model/models.dart';
import 'package:pos/pos/impressora/impressao_pos_utils.dart';
import 'package:pos/pos/sitef/sitef_dialog.dart';
import 'package:utils/utils/date_time_utils.dart';
import 'package:utils/utils/string_utils.dart';
import 'package:utils/widgets/confirmation_dialog.dart';
import 'package:utils/formatters/currency_input_formatter.dart';

class SitefPOS {
  static BigDecimal? _valor;
  static bool? _sucesso;
  static int? _tipoTransacao;
  static String? _md5Supervisor;
  static late BuildContext _context;
  static late bool _perguntaCancelamento;
  static TipoOperacaoTEF? _tipoOperacao;
  static Map<String, String?>? _dadosTransacao;
  static const _platform = const MethodChannel("sitef_channel");
  static const _channel = const BasicMessageChannel(
      "sitef_message_channel", StandardMessageCodec());

  //----------------------------------------------------- METHODS ------------------------------------------------------

  static Future configure(ServicoSitef servico, {String? otp}) async {
    try {
      var terminal =
          "WC${StringUtils.padStart(Application
          .getInstance()
          .estacao!
          .numeroCaixa
          .toString(), 6, '0')}";
      var cnpjEmpresa =
          Application
              .getInstance()
              .empresa
              .pessoa!
              .inscricaoFederal;
      var cnpjAC = "00689700000135";
      var adicionais;

      if (otp != null && otp.isNotEmpty) {
        adicionais = "[[TipoComunicacaoExterna=GSURF.SSL;"
            "GSurf.OTP=$otp;TerminalUUID=$terminal];"
            "[ParmsClient=1=$cnpjEmpresa;"
            "2=$cnpjAC];"
            "[TipoPinPad=${Application
            .getInstance()
            .estacao!
            .tipoPinPad}];]";
      } else {
        adicionais = "[ParmsClient=1=$cnpjEmpresa;"
            "2=$cnpjAC];"
            "[TipoPinPad=${Application
            .getInstance()
            .estacao!
            .tipoPinPad}];";
      }

      var config = Map<String, String?>();
      config['endereco_sitef'] = servico.ipServidor;
      config['codigo_loja'] = servico.numeroLoja;
      config['terminal'] = terminal;
      config['adicionais'] = adicionais;

      await _platform.invokeMethod('configure', {"configuracoes": config});
    } on PlatformException catch (e) {
      throw e;
    }
  }

  static Future<bool?> transacionar(BuildContext ctx, Nota nota,
      BigDecimal valor, FinalizadoraEmpresa finalizadora) async {
    try {
      _context = ctx;
      _valor = valor;
      _sucesso = false;
      _tipoOperacao = TipoOperacaoTEF.TRANSACAO;

      _dadosTransacao = Map<String, String?>();
      _dadosTransacao!['funcao'] = _getFuncaoTransacao(finalizadora);
      _dadosTransacao!['valor'] = valor.toStringAsFixed(2).replaceAll(".", ",");
      _dadosTransacao!['cupom_fiscal'] = nota.id.toString();
      var data = nota.consumo!.dataAbertura;
      _dadosTransacao!['data_fiscal'] =
          DateTimeUtils.format(data, DateTimeUtils.invertedNoFormatData);
      _dadosTransacao!['hora_fiscal'] =
          DateTimeUtils.format(data, DateTimeUtils.invertedNoFormatHora);

      _channel.setMessageHandler(
          _handleSitefActions as Future<Object?> Function(Object?)?);

      showDialog(
          context: _context,
          barrierDismissible: false,
          builder: (context) =>
              SitefDialog(
                onCancelar: () {
                  _perguntaCancelamento = true;
                  _abortar();
                },
              )).then((result) async {
        if (!_sucesso!) {
          _perguntaCancelamento = false;
          _abortar();
        }
      });

      Application
          .getInstance()
          .transacaoCartao = TransacaoCartao();
      Application
          .getInstance()
          .transacaoCartao!
          .bandeira = BandeiraCartao();

      bool success = await (_platform
          .invokeMethod('transacionar', {"dados": _dadosTransacao}) as FutureOr<
          bool>);

      if (success) {
        _sucesso = true;
        Application
            .getInstance()
            .transacoes
            .add(_dadosTransacao);
        Navigator.pop(_context);
      }
    } on PlatformException catch (_) {
      Navigator.pop(_context);
      //SitefDialog.instance.setError(e);
      //throw e;
    }
    return _sucesso;
  }

  static Future<bool?> finalizar(Map<String, String?>? dados,
      {bool confirmar = true}) async {
    return await _platform
        .invokeMethod('finalizar', {"dados": dados, "confirmar": confirmar});
  }

  static Future<int?> pendencias(String dataFiscal, String cupomFiscal) async {
    try {
      var dados = Map<String, String>();
      dados['data_fiscal'] = dataFiscal;
      dados['cupom_fiscal'] = cupomFiscal;
      return await _platform.invokeMethod('pendencias', {"dados": dados});
    } on PlatformException catch (e) {
      throw e;
    }
  }

  static Future cancelarPendencias(String dataFiscal,
      String cupomFiscal) async {
    try {
      var dados = Map<String, String>();
      dados['data_fiscal'] = dataFiscal;
      dados['cupom_fiscal'] = cupomFiscal;
      return await _platform
          .invokeMethod('cancelar_pendencias', {"dados": dados});
    } on PlatformException catch (e) {
      throw e;
    }
  }

  static Future<bool?> cancelarTransacao(BuildContext context,
      String opcaoCancelamento, BigDecimal valor) async {
    try {
      _context = context;
      _sucesso = false;
      _tipoOperacao = TipoOperacaoTEF.CANCELAMENTO;
      _valor = valor;

      _dadosTransacao = Map<String, String?>();
      _dadosTransacao!['funcao'] = _getFuncaoCancelamento(opcaoCancelamento);
      _dadosTransacao!['valor'] = "0,00";
      _dadosTransacao!['cupom_fiscal'] = "";
      var data = DateTime.now();
      _dadosTransacao!['data_fiscal'] =
          DateTimeUtils.format(data, DateTimeUtils.invertedNoFormatData);
      _dadosTransacao!['hora_fiscal'] =
          DateTimeUtils.format(data, DateTimeUtils.invertedNoFormatHora);

      _channel.setMessageHandler(
          _handleSitefActions as Future<Object?> Function(Object?)?);

      showDialog(
          context: _context,
          barrierDismissible: false,
          builder: (context) =>
              SitefDialog(
                onCancelar: () {
                  _perguntaCancelamento = true;
                  _abortar();
                },
              )).then((result) async {
        if (!_sucesso!) {
          _perguntaCancelamento = false;
          _abortar();
        }
      });

      Application
          .getInstance()
          .transacaoCartao = TransacaoCartao();
      Application
          .getInstance()
          .transacaoCartao!
          .bandeira = BandeiraCartao();

      bool success = await (_platform
          .invokeMethod(
          'cancelar_transacao', {"dados": _dadosTransacao}) as FutureOr<bool>);
      if (success) {
        _sucesso = true;
        finalizar(_dadosTransacao, confirmar: true);
        Navigator.pop(_context);
      }
    } on PlatformException catch (e) {
      Navigator.pop(_context);
      //SitefDialog.instance.setError(e);
      throw e;
    }
    return _sucesso;
  }

  static Future<bool?> reimprimir(BuildContext context,
      String opcaoReimpressao) async {
    try {
      _context = context;
      _sucesso = false;
      _tipoOperacao = TipoOperacaoTEF.REIMPRESSAO;

      var dados = Map<String, String?>();
      dados['funcao'] = _getFuncaoReimpressao(opcaoReimpressao);
      dados['valor'] = "0,00";
      dados['cupom_fiscal'] = "";
      var data = DateTime.now();
      dados['data_fiscal'] =
          DateTimeUtils.format(data, DateTimeUtils.invertedNoFormatData);
      dados['hora_fiscal'] =
          DateTimeUtils.format(data, DateTimeUtils.invertedNoFormatHora);

      _channel.setMessageHandler(
          _handleSitefActions as Future<Object?> Function(Object?)?);

      showDialog(
          context: _context,
          barrierDismissible: false,
          builder: (context) =>
              SitefDialog(
                onCancelar: () {
                  _perguntaCancelamento = true;
                  _abortar();
                },
              )).then((result) async {
        if (!_sucesso!) {
          _perguntaCancelamento = false;
          _abortar();
        }
      });

      bool success =
      await (_platform.invokeMethod('reimprimir', {"dados": dados}) as FutureOr<
          bool>);
      if (success) {
        _sucesso = true;
        Navigator.pop(_context);
      }
    } on PlatformException catch (e) {
      Navigator.pop(_context);
      //SitefDialog.instance.setError(e);
      throw e;
    }
    return _sucesso;
  }

  static Future _abortar() async {
    await _platform.invokeMethod('abortar');
  }

  static String _getFuncaoTransacao(FinalizadoraEmpresa finalizadoraEmpresa) {
    switch (finalizadoraEmpresa.finalizadora!.finalizadoraRFB) {
      case "CARTAO_DEBITO":
        _tipoTransacao = 2;
        return '2';

      case "CARTAO_CREDITO":
        _tipoTransacao = 3;
        return '3';

      default:
        _tipoTransacao = 0;
        return '0';
    }
  }

  static String _getFuncaoCancelamento(String option) {
    switch (option) {
      case "1":
        return '211';

      case "2":
        return '210';

      default:
        return '0';
    }
  }

  static String _getFuncaoReimpressao(String option) {
    switch (option) {
      case "1":
        return '114';

      case "2":
        return '113';

      default:
        return '0';
    }
  }

  static Future<dynamic>? _handleSitefActions(dynamic value) {
    Map<dynamic, dynamic> map = value;

    var command = map['command'];
    var fieldId = map['fieldId'];

    var transacaoCartao = Application
        .getInstance()
        .transacaoCartao;

    if (map.containsKey('get_data')) {
      switch (command) {
        case "20":
          switch (fieldId) {
            case "-1":
              _send("0");
              break;

            case "5013":
              if (_perguntaCancelamento) {
                _perguntarCancelamentoOperacao();
              } else {
                _send("0");
                Navigator.pop(_context);
              }
              break;
            default:
          }
          break;

        case "21":
          if (_tipoOperacao == TipoOperacaoTEF.REIMPRESSAO)
            SitefDialog.instance.setOptions(map['title'], map['message'], (v) {
              String? valor = v;
              if (valor != null && valor.isNotEmpty) _send(valor);
            });
          else
            _send("1");
          break;

        case "30":
          switch (fieldId) {
            case "500":
              _send(_md5Supervisor);
              break;

            case "515":
              SitefDialog.instance.setInput(
                  message: map['message'],
                  keyboardType: TextInputType.datetime,
                  onConfirm: (v) {
                    String? valor = v;
                    if (valor != null && valor.isNotEmpty) _send(valor);
                  });
              break;

            case "516":
              SitefDialog.instance.setInput(
                  message: map['message'],
                  keyboardType: TextInputType.number,
                  onConfirm: (v) {
                    String? valor = v;
                    if (valor != null && valor.isNotEmpty) _send(valor);
                  });
              break;
          }
          break;

        case "34":
          switch (fieldId) {
            case "146":
              SitefDialog.instance.setInput(
                  message: map['message'],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyInputFormatter(),
                  ],
                  onConfirm: (v) {
                    String? valor = v;
                    if (valor != null && valor.isNotEmpty) _send(valor);
                  });
              break;

            case "504":
              _send("0");
              break;
          }
          break;
      }
    }

    if (map.containsKey('status')) {
      String status = map['status'].toString();
      SitefDialog.instance.setStatus(status);
    }

    if (map.containsKey('alerta')) {
      String alerta = map['alerta'].toString();

      switch (command) {
        case '0':
          switch (fieldId) {
            case '122':
              if (_tipoOperacao == TipoOperacaoTEF.TRANSACAO ||
                  _tipoOperacao == TipoOperacaoTEF.CANCELAMENTO) {
                _dadosTransacao!['comprovante_estabelecimento'] = alerta;
                transacaoCartao!.viaCaixa =
                _dadosTransacao!['comprovante_estabelecimento'];
              }

              if (_tipoOperacao == TipoOperacaoTEF.CANCELAMENTO ||
                  _tipoOperacao == TipoOperacaoTEF.REIMPRESSAO)
                ImpressaoPOSUtils.imprimirGeneric(alerta + "\n\n\n");
              break;

            case '121':
              if (_tipoOperacao == TipoOperacaoTEF.TRANSACAO ||
                  _tipoOperacao == TipoOperacaoTEF.CANCELAMENTO) {
                _dadosTransacao!['comprovante_cliente'] = alerta;
                transacaoCartao!.viaCliente =
                _dadosTransacao!['comprovante_cliente'];
              }

              if (_tipoOperacao == TipoOperacaoTEF.CANCELAMENTO ||
                  _tipoOperacao == TipoOperacaoTEF.REIMPRESSAO)
                ImpressaoPOSUtils.imprimirGeneric(alerta + "\n\n\n");

              break;
          }
          break;
      }
    }

    if (_tipoOperacao == TipoOperacaoTEF.TRANSACAO ||
        _tipoOperacao == TipoOperacaoTEF.CANCELAMENTO) {
      if (map.containsKey('dados_transacao_cartao')) {
        String dados = map['data'].toString();

        switch (fieldId) {
          case '105':
            transacaoCartao!.data = DateTimeUtils.fromString(dados);
            break;

          case '132':
            transacaoCartao!.bandeira!.codigoBandeira = dados.trim();
            break;

          case '134':
            transacaoCartao!.nsu = dados;
            break;

          case '135':
            transacaoCartao!.codigoAutorizacao = dados;
            break;

          case '156':
            var bandeira = transacaoCartao!.bandeira!;
            bandeira.bandeira = dados.trim();
            bandeira.idEmpresa = Application
                .getInstance()
                .empresa
                .id;
            bandeira.operacao = _tipoTransacao == 3 ? "CREDITO" : "DEBITO";
            bandeira.tipoTransacao = "TEF";
            bandeira.tipoTEF = "SITEF";
            transacaoCartao.numeroParcelas =
            1; //Na regra atual a parcela é sempre 1
            transacaoCartao.idEmpresa = Application
                .getInstance()
                .empresa
                .id;
            transacaoCartao.valor = _valor;
            break;
        }
      }
    }

    if (map.containsKey('resultCode')) {
      switch (map['stage']) {
        case '1':
          switch (map['resultCode']) {
            case '-2': // Retirada do cartão, cancelamento operador
              Navigator.pop(_context);
              break;
          }

          break;
      }
    }

    if (map.containsKey('information')) {
      SitefDialog.instance.setInformation(
        information: map['message'],
        onConfirm: (_) => _send(""),
      );
    }

    //print(map);
    return null;
  }

  static void _send(String? option) {
    _channel.send({"option": option});
  }

  static void _perguntarCancelamentoOperacao() {
    showDialog(
        context: _context,
        builder: (context) =>
            ConfirmationDialog(
              showCancelButton: true,
              title: "Cancelar",
              message: "Deseja cancelar a operação?",
              txtConfirmar: "Sim",
              txtCancelar: "Não",
              onConfirm: () {
                _send("0");
              },
              onCancel: () => _send("1"),
            ));
  }
}

enum TipoOperacaoTEF { TRANSACAO, CANCELAMENTO, REIMPRESSAO }
