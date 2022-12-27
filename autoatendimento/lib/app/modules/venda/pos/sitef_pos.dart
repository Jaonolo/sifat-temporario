import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/transacao_tef/transacao_tef_controller.dart';
import 'package:autoatendimento/app/modules/venda/widgets/confirmation_dialog.dart';
import 'package:autoatendimento/app/modules/venda/widgets/select_option_dialog/select_option.dart';
import 'package:autoatendimento/app/modules/venda/widgets/sitef_dialog.dart';
import 'package:autoatendimento/app/utils/currency_input_formatter.dart';
import 'package:autoatendimento/app/utils/date_time_utils.dart';
import 'package:autoatendimento/app/utils/string_utils.dart';
import 'package:core/application/application.dart';
//import 'package:core/pos/impressora/impressao_pos_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SitefPOS {
  static BigDecimal? _valor;
  static bool? _sucesso;
  static int? _tipoTransacao;
  static String? _codigoOperador;
  static BuildContext? _context;
  static bool? _perguntaCancelamento;
  static TipoOperacaoTEF? _tipoOperacao;
  static TransacaoCartao? _transacaoCartaoCancelamento;
  static FinalizadoraEmpresa? _finalizadoraEmpresa;
  static Map<String, String>? _dadosTransacao;
  static AppController appController = Modular.get();
  static TransacaoTefController controller = Modular.get();
  static const _platform = const MethodChannel("sitef_channel");
  static const _channel = const BasicMessageChannel(
      "sitef_message_channel", StandardMessageCodec());

  //----------------------------------------------------- METHODS ------------------------------------------------------

  static Future configure(ServicoSitef servico, {String? otp}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var terminal =
          "WC${StringUtils.padStart(appController.estacaoTrabalho.numeroCaixa.toString(), 6, '0')}";
      var cnpjEmpresa = prefs.getString('cnpj');
      var cnpjAC = "00689700000135";
      var adicionais;

      if (appController.estacaoTrabalho.codigoOTPSitef != null && appController.estacaoTrabalho.codigoOTPSitef!.isNotEmpty) {
        adicionais = "[[TipoComunicacaoExterna=GSURF.SSL;"
            "GSurf.OTP=${appController.estacaoTrabalho.codigoOTPSitef};TerminalUUID=$terminal];"
            "[ParmsClient=1=$cnpjEmpresa;"
            "2=$cnpjAC];"
            "[TipoPinPad=${appController.estacaoTrabalho.tipoPinPad}];]";
      } else {
        adicionais = "[ParmsClient=1=$cnpjEmpresa;"
            "2=$cnpjAC];"
            "[TipoPinPad=${appController.estacaoTrabalho.tipoPinPad}];";
      }

      var config = Map<String, String>();
      config['endereco_sitef'] = servico.ipServidor!;
      config['codigo_loja'] = servico.numeroLoja!;
      config['terminal'] = terminal;
      config['adicionais'] = adicionais;

      await _platform.invokeMethod('configure', {"configuracoes": config});
    } on PlatformException catch (e) {
      throw WaybeException("Não foi possivel iniciar o serviço",
          exception: e.message,
          mensagem: "Não foi possível carregar o serviço do Sitef");
    }
  }

  static Future<bool> transacionar(BuildContext ctx, Nota nota,
      BigDecimal valor, FinalizadoraEmpresa finalizadora) async {
    try {
      _context = ctx;
      _valor = valor;
      _sucesso = false;
      _tipoOperacao = TipoOperacaoTEF.TRANSACAO;
      _finalizadoraEmpresa = finalizadora;

      _dadosTransacao = Map<String, String>();
      _dadosTransacao!['funcao'] = _getFuncaoTransacao(finalizadora);
      _dadosTransacao!['valor'] = valor.toStringAsFixed(2).replaceAll(".", ",");
      _dadosTransacao!['cupom_fiscal'] = nota.id.toString();
      _dadosTransacao!['param_adicionais'] = "{DevolveStringQRCode=1}";
      var data = nota.consumo!.dataAbertura;
      _dadosTransacao!['data_fiscal'] =
          DateTimeUtils.format(data!, DateTimeUtils.invertedNoFormatData);
      _dadosTransacao!['hora_fiscal'] =
          DateTimeUtils.format(data, DateTimeUtils.invertedNoFormatHora);

      _channel.setMessageHandler(_handleSitefActions);

      appController.transacaoCartao = TransacaoCartao();
      appController.transacaoCartao!.bandeira = BandeiraCartao();

      bool success = await _platform
          .invokeMethod('transacionar', {"dados": _dadosTransacao});

      if (success) {
        _sucesso = true;
        appController.transacoes.add(_dadosTransacao);
        controller.finalizaVendaAndroid(_context!);
      }
    } on PlatformException catch (e) {
      controller.tratativasRetornoFalhaAndroid(e.message.toString(), _context!);
      //SitefDialog.instance.setError(e);
      //throw e;
    }
    return _sucesso!;
  }

  static Future<bool> finalizar(Map<String, String?>? dados,
      {bool confirmar = true}) async {
    return await _platform
        .invokeMethod('finalizar', {"dados": dados, "confirmar": confirmar});
  }

  static Future<int> pendencias(String dataFiscal, String cupomFiscal) async {
    try {
      var dados = Map<String, String>();
      dados['data_fiscal'] = dataFiscal;
      dados['cupom_fiscal'] = cupomFiscal;
      return await _platform.invokeMethod('pendencias', {"dados": dados});
    } on PlatformException catch (e) {
      throw e;
    }
  }

  static Future cancelarPendencias(
      String dataFiscal, String cupomFiscal) async {
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

  static Future<bool> cancelarTransacao(BuildContext context,
      TransacaoCartao transacaoCartao, String codigoOperador) async {
    try {
      _context = context;
      _sucesso = false;
      _tipoOperacao = TipoOperacaoTEF.CANCELAMENTO;
      _transacaoCartaoCancelamento = transacaoCartao;
      _valor = transacaoCartao.valor;
      _codigoOperador = codigoOperador;

      _dadosTransacao = Map<String, String>();
      _dadosTransacao!['funcao'] = "200";
      _dadosTransacao!['valor'] = "0.00";
      _dadosTransacao!['codigo_operador'] = codigoOperador;

      var data = DateTime.now();
      _dadosTransacao!['cupom_fiscal'] = DateTimeUtils.format(
          data, DateTimeUtils.diaMesAnoHoraMinutoSegundoSM);
      _dadosTransacao!['data_fiscal'] =
          DateTimeUtils.format(data, DateTimeUtils.invertedNoFormatData);
      _dadosTransacao!['hora_fiscal'] = "";

      _channel.setMessageHandler(_handleSitefActions);

      showDialog(
          context: _context!,
          barrierDismissible: false,
          builder: (context) => SitefDialog(
                onCancelar: () {
                  _perguntaCancelamento = true;
                  abortar();
                },
              )).then((result) async {
        if (!_sucesso!) {
          _perguntaCancelamento = false;
          abortar();
        }
      });

      appController.transacaoCartao = TransacaoCartao();
      appController.transacaoCartao!.bandeira = BandeiraCartao();

      bool success = await _platform
          .invokeMethod('cancelar_transacao', {"dados": _dadosTransacao});
      if (success) {
        _sucesso = true;
        finalizar(_dadosTransacao!, confirmar: true);
        Navigator.pop(_context!);
      }
    } on PlatformException catch (e) {
      Navigator.pop(_context!);
      //SitefDialog.instance.setError(e);
      throw e;
    }
    return _sucesso!;
  }

  static Future<bool> reimprimir(
      BuildContext context, String opcaoReimpressao) async {
    try {
      _context = context;
      _sucesso = false;
      _tipoOperacao = TipoOperacaoTEF.REIMPRESSAO;

      var dados = Map<String, String>();
      dados['funcao'] = _getFuncaoReimpressao(opcaoReimpressao);
      dados['valor'] = "0,00";
      dados['cupom_fiscal'] = "";
      var data = DateTime.now();
      dados['data_fiscal'] =
          DateTimeUtils.format(data, DateTimeUtils.invertedNoFormatData);
      dados['hora_fiscal'] =
          DateTimeUtils.format(data, DateTimeUtils.invertedNoFormatHora);

      _channel.setMessageHandler(_handleSitefActions);

      showDialog(
          context: _context!,
          barrierDismissible: false,
          builder: (context) => SitefDialog(
                onCancelar: () {
                  _perguntaCancelamento = true;
                  abortar();
                },
              )).then((result) async {
        if (!_sucesso!) {
          _perguntaCancelamento = false;
          abortar();
        }
      });

      bool success =
          await _platform.invokeMethod('reimprimir', {"dados": dados});
      if (success) {
        _sucesso = true;
        Navigator.pop(_context!);
      }
    } on PlatformException catch (e) {
      Navigator.pop(_context!);
      //SitefDialog.instance.setError(e);
      throw e;
    } finally {
      return _sucesso!;
    }
  }

  static Future<void> abortar() async {
    _perguntaCancelamento = false;
    await _platform.invokeMethod('abortar');
    return Future.value();
  }

  static String _getFuncaoTransacao(FinalizadoraEmpresa finalizadoraEmpresa) {
    switch (finalizadoraEmpresa.finalizadora!.finalizadoraRFB) {
      case "CARTAO_DEBITO":
        _tipoTransacao = 2;
        return '2';

      case "CARTAO_CREDITO":
        _tipoTransacao = 3;
        return '3';

      case "TRANSFERENCIA_BANCARIA":
        _tipoTransacao = 122;
        return '122';

      default:
        _tipoTransacao = 0;
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

  static Future<void> _handleSitefActions(dynamic value) async {
    Map<dynamic, dynamic> map = value;

    var command = map['command'];
    var fieldId = map['fieldId'];

    String titleQrCode = "Efetue a leitura do QR Code";

    var transacaoCartao = appController.transacaoCartao;

    if (map.containsKey('get_data')) {
      switch (command) {
        case "3":
          switch (fieldId) {
            case "584":
              //retorna mensagem do qrCode via CARTEIRA_DIGITAL, algumas adquirentes não devolve essa mensagem
              titleQrCode = map['message'];
              break;
          }
          break;

        case "20":
          switch (fieldId) {
            case "-1":
              _send("0");
              break;

            case "5013":
                _send("0");
                controller.recomecar(false);
              break;
            default:
          }
          break;

        case "21":
          //monta as opçoes
          var optionsList = map['message'].split(";");
          List<SelectOption> itens = [];
          optionsList.forEach((option) {
            if (option != null && option.isNotEmpty) {
              var split = option.split(":");
              itens.add(SelectOption(value: split[0], text: split[1]));
            }
          });

          SelectOption? adquirenteCorrespondente = null;

          //======================== tratativas para autoseleção ===============
          if (_tipoOperacao == TipoOperacaoTEF.CANCELAMENTO) {
            //Verifica se é solicitacao de cancelamento
            if (map['title'].contains("Selecione o tipo de cancelamento")) {
              //remove as opções extra fora do meu scopo
              itens = itens
                  .where((o) =>
                      o.text.contains("Cancelamento de Cartao de Debito") ||
                      o.text.contains("Cancelamento de Cartao de Credito") ||
                      o.text.contains("Cancelamento Carteira Digital"))
                  .toList();

              //ja escolhe o cancelamento de acordo com a operacao (replace por conta da carteira digital)
              adquirenteCorrespondente = itens.firstWhere((o) => o.text
                  .toUpperCase()
                  .contains(_transacaoCartaoCancelamento!.bandeira!.operacao!
                      .replaceAll("_", " ")));
            }
          } else if (_tipoOperacao == TipoOperacaoTEF.TRANSACAO) {
            //Se for carteira digital e tiver um adquirente vinculado ja seleciona ele direto caso ache
            if (_tipoTransacao == 122 &&
                _finalizadoraEmpresa!.finalizadora!.finalizadoraRFB ==
                    "TRANSFERENCIA_BANCARIA" &&
                _finalizadoraEmpresa!.identificacaoCarteiraDigital != null) {
              adquirenteCorrespondente = itens.firstWhere(
                  (o) =>
                      o.text.toUpperCase() ==
                      _finalizadoraEmpresa!
                          .identificacaoCarteiraDigital!.descricao!
                          .toUpperCase(),
                  orElse: null);
            }
          }
          //====================================================================

          //se tiver ja estiver encontrado um igual ao scopo ja seleciona ele
          if (adquirenteCorrespondente != null) {
            _send(adquirenteCorrespondente.value);
          } else {
            controller.atualizaBuffer(map['title'].toString());
          }
          break;

        case "30":
          switch (fieldId) {
            case "500": // código do supervisor
              _send(_codigoOperador!);
              break;

            case "515":
            case "505":
              //515 - data da transação a ser cancelada
              //505 - parcelas
            controller.atualizaBuffer(map['message'].toString());

              //================ preenchimento automatico ======================
              if (_tipoOperacao == TipoOperacaoTEF.CANCELAMENTO) {
                if (map['message']
                        .toString()
                        .contains("Data da transacao (ddmm) ou (ddmmaaaa)") ||
                    map['message']
                        .toString()
                        .contains("Data da transacao (DDMMAAAA)")) {
                  SitefDialog.instance.inputController.text =
                      DateTimeUtils.format(_transacaoCartaoCancelamento!.data!,
                          DateTimeUtils.diaMesAnoSM);
                }
              }
              //================================================================
              break;

            case "516":
              controller.atualizaBuffer(map['message'].toString());
              //================ preenchimento automatico ======================
              if (_tipoOperacao == TipoOperacaoTEF.CANCELAMENTO) {
                if (map['message'].toString().contains(
                    "Forneca o numero do documento a ser cancelado")) {
                  if (_transacaoCartaoCancelamento!.bandeira!.operacao ==
                      OperacaoCartao.CARTEIRA_DIGITAL.name) {
                    SitefDialog.instance.inputController.text =
                        _transacaoCartaoCancelamento!.documentoCarteiraDigital!;
                  } else {
                    SitefDialog.instance.inputController.text =
                        _transacaoCartaoCancelamento!.nsu!;
                  }
                }
              }
              //================================================================
              break;
          }
          break;

        case "34":
          switch (fieldId) {
            case "145":
            case "146":
            controller.atualizaBuffer(map['message'].toString());

              //================ preenchimento automatico ======================
              if (_tipoOperacao == TipoOperacaoTEF.CANCELAMENTO) {
                if (map['message']
                    .toString()
                    .contains("Forneca o valor da transacao original")) {
                  SitefDialog.instance.inputController.text =
                      _transacaoCartaoCancelamento!.valor!.toStringAsFixed(2);
                }
                if (map['message'].toString().contains(
                    "Forneca o numero do documento a ser cancelado")) {
                  SitefDialog.instance.inputController.text =
                      _transacaoCartaoCancelamento!.documentoCarteiraDigital!;
                }
                if (map['message']
                    .toString()
                    .contains("Digite o valor da transacao")) {
                  SitefDialog.instance.inputController.text =
                      _transacaoCartaoCancelamento!.valor!.toStringAsFixed(2);
                }
              }
              //================================================================
              break;

            case "504":
              _send("0");
              break;
          }
          break;

        case "50":

          controller.atualizaBuffer(map['message'].toString());
          break;

        case "51":
          //Comando para retirar o QrCode da tela Sitef ja devolveu a resposta
          controller.atualizaBuffer("Aguarde ...");
          break;
      }
    }

    if (map.containsKey('status')) {
        controller.atualizaBuffer( map['status'].toString());

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
                  _tipoOperacao == TipoOperacaoTEF.REIMPRESSAO) {}
              // ImpressaoPOSUtils.imprimirGeneric(alerta + "\n\n\n");
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
                // ImpressaoPOSUtils.imprimirGeneric(alerta + "\n\n\n");

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

          case '108':
            if (_tipoTransacao == 122) {
              //Retorna a codigoBandeira com CARTEIRA_DIGITAL
              transacaoCartao!.bandeira!.codigoBandeira = dados;
            }
            break;

          case '132':
            transacaoCartao!.bandeira!.codigoBandeira = dados.trim();
            break;

          case '134':
            if (_tipoTransacao == 122 ||
                (_transacaoCartaoCancelamento != null &&
                    _transacaoCartaoCancelamento!.bandeira!.operacao ==
                        OperacaoCartao.CARTEIRA_DIGITAL.name)) {
              int documentoSemZeroEsquerda = int.parse(dados);
              transacaoCartao!.nsu = documentoSemZeroEsquerda.toString();
            } else {
              transacaoCartao!.nsu = dados;
            }
            break;

          case '135':
            transacaoCartao!.codigoAutorizacao = dados;
            break;

          case '156':
            var bandeira = transacaoCartao!.bandeira;
            bandeira!.bandeira = dados.trim();
            bandeira.idEmpresa = appController.estacaoTrabalho.idEmpresa;

            switch (_tipoTransacao) {
              case 2:
                bandeira.operacao = OperacaoCartao.DEBITO.name;
                break;
              case 3:
                bandeira.operacao = OperacaoCartao.CREDITO.name;
                break;
              case 122:
                bandeira.operacao = OperacaoCartao.CARTEIRA_DIGITAL.name;
                break;
            }
            bandeira.tipoTransacao = TipoTransacao.TEF.name;
            bandeira.tipoTEF = "SITEF";
            transacaoCartao.numeroParcelas =
                1; //Na regra atual a parcela é sempre 1
            transacaoCartao.idEmpresa = appController.estacaoTrabalho.idEmpresa;
            transacaoCartao.valor = _valor;
            break;
          case '952':
            int documentoSemZeroEsquerda = int.parse(dados);
            transacaoCartao!.documentoCarteiraDigital =
                documentoSemZeroEsquerda.toString();
            break;
        }
      }
    }

    if (map.containsKey('resultCode')) {
      switch (map['stage']) {
        case '1':
          switch (map['resultCode']) {
            case '-2': // Retirada do cartão, cancelamento operador
              break;
          }

          break;
      }
    }

    if (map.containsKey('information')) {
      controller.atualizaBuffer(map['message'].toString());
      _send("");
    }
  }

  static void _send(String option) {
    _channel.send({"option": option});
  }

  static void _perguntarCancelamentoOperacao() {
    showDialog(
        context: _context!,
        builder: (context) => ConfirmationDialog(
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
