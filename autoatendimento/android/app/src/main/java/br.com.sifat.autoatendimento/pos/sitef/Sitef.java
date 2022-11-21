package br.com.sifat.autoatendimento.pos.sitef;

import android.app.Activity;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import br.com.softwareexpress.sitef.android.CliSiTef;
import br.com.softwareexpress.sitef.android.ICliSiTefListener;
import br.com.sifat.autoatendimento.R;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;

@SuppressWarnings("ALL")
public class Sitef implements ICliSiTefListener {

    private CliSiTef clisitef;
    private Activity activity;
    private static String title;
    private MethodChannel.Result result;
    private BasicMessageChannel messageChannel;
    private static final String SITEF_CHANNEL = "sitef_channel";
    private static final String SITEF_MESSAGE_CHANNEL = "sitef_message_channel";

    private static final int CAMPO_COMPROVANTE_CLIENTE = 121;
    private static final int CAMPO_COMPROVANTE_ESTAB = 122;

    public Sitef(Activity activity, BinaryMessenger messenger) {
        this.activity = activity;

        MethodChannel channel = new MethodChannel(messenger, SITEF_CHANNEL);
        channel.setMethodCallHandler(this::handleActionsSitefChannel);

        messageChannel = new BasicMessageChannel<>(messenger, SITEF_MESSAGE_CHANNEL, new StandardMessageCodec());
    }


    private void handleActionsSitefChannel(MethodCall methodCall, MethodChannel.Result result) {
        this.result = result;

        if (clisitef == null) {
            clisitef = new CliSiTef(activity);
            clisitef.setActivity(activity);
            clisitef.setDebug(true);
        }

        switch (methodCall.method) {
            case "configure":
                configure(Objects.requireNonNull(methodCall.argument("configuracoes")));
                break;

            case "transacionar":
                transacionar(Objects.requireNonNull(methodCall.argument("dados")));
                break;

            case "finalizar":
                finalizar(Objects.requireNonNull(methodCall.argument("dados")),
                        Boolean.parseBoolean(Objects.requireNonNull(methodCall.argument("confirmar")).toString()));
                break;

            case "pendencias":
                pendencias(Objects.requireNonNull(methodCall.argument("dados")));
                break;

            case "cancelar_pendencias":
                cancelarPendencias(Objects.requireNonNull(methodCall.argument("dados")));
                break;

            case "cancelar_transacao":
                cancelarTransacao(Objects.requireNonNull(methodCall.argument("dados")));
                break;

            case "reimprimir":
                reimprimir(Objects.requireNonNull(methodCall.argument("dados")));
                break;

            case "abortar":
                abortar();
                break;
        }
    }


    private void configure(Map<String, String> config) {
        try {
            int retorno = clisitef.configure(config.get("endereco_sitef"), config.get("codigo_loja"),
                    config.get("terminal"), config.get("adicionais"));

            if (retorno == 0)
                result.success(null);
            else
                result.error("Erro ao configurar CliSitef", null, retorno);

        } catch (Exception e) {
            result.error("Erro", "Sitef.configure()", e.toString());
        }
    }

    private void transacionar(Map<String, String> dados) {
        try {
            messageChannel.setMessageHandler((message, reply) -> {
                Map<String, String> map = (Map<String, String>) message;
                clisitef.continueTransaction(map.get("option"));
            });

            clisitef.startTransaction(this,
                    Integer.parseInt(Objects.requireNonNull(dados.get("funcao"))), dados.get("valor"),
                    dados.get("cupom_fiscal"), dados.get("data_fiscal"), dados.get("hora_fiscal"), dados.get("param_adicionais"), "");
        } catch (Exception e) {
            result.error("Erro", "Sitef.transacionar()", e.toString());
        }
    }


    private void finalizar(Map<String, String> dados, boolean confirmar) {
        try {
            int resultado = clisitef.finishTransaction(confirmar ? 1 : 0, dados.get("cupom_fiscal"),
                    dados.get("data_fiscal"), dados.get("hora_fiscal"), "");

            if (resultado == 10000)
                result.success(true);
            else
                result.error("Erro", "Erro ao finalizar transacao: " + dados.toString(), resultado);

        } catch (Exception e) {
            result.error("Erro", "Erro ao finalizar transacao: " + dados.toString(), e.toString());
        }
    }


    private void pendencias(Map<String, String> dados) {
        try {
            int qtde = clisitef.getQttPendingTransactions(dados.get("data_fiscal"), dados.get("cupom_fiscal"));
            result.success(qtde);
        } catch (Exception e) {
            result.error("Erro", "Sitef.pendencias()", e.toString());
        }
    }


    private void cancelarPendencias(Map<String, String> dados) {
        try {
            clisitef.finishTransaction(0, dados.get("cupom_fiscal"), dados.get("data_fiscal"),
                    "", "");
            result.success(true);
        } catch (Exception e) {
            result.error("Erro", "Sitef.cancelarPendencias()", e.toString());
        }
    }


    private void cancelarTransacao(Map<String, String> dados) {
        try {
            messageChannel.setMessageHandler((message, reply) -> {
                Map<String, String> map = (Map<String, String>) message;
                clisitef.continueTransaction(Objects.requireNonNull(map).get("option"));
            });

            clisitef.startTransaction(
                    this,
                    Integer.parseInt(Objects.requireNonNull(dados.get("funcao"))),
                    dados.get("valor"),
                    dados.get("cupom_fiscal"),
                    dados.get("data_fiscal"),
                    dados.get("hora_fiscal"),
                    dados.get("codigo_operador"),
                    "");
        } catch (Exception e) {
            result.error("Erro", "Sitef.cancelarTransacao()", e.toString());
        }
    }


    private void reimprimir(Map<String, String> dados) {
        try {
            messageChannel.setMessageHandler((message, reply) -> {
                Map<String, String> map = (Map<String, String>) message;
                clisitef.continueTransaction(Objects.requireNonNull(map).get("option"));
            });

            clisitef.startTransaction(this,
                    Integer.parseInt(Objects.requireNonNull(dados.get("funcao"))), dados.get("valor"),
                    dados.get("cupom_fiscal"), dados.get("data_fiscal"), dados.get("hora_fiscal"), "", "");
        } catch (Exception e) {
            result.error("Erro", "Sitef.reimprimir()", e.toString());
        }
    }

    private void abortar() {
        clisitef.abortTransaction(-1);
    }

    @Override
    public void onData(int stage, int command, int fieldId, int minLength, int maxLength, byte[] input) {
        Map<String, String> retorno = new HashMap<>();
        String data = "";

        System.out.println("##### on data ######");
        System.out.println(" | comando = " + command
                + " | tipoCampo = " + fieldId
                + " | tamanhoMinimo = " + minLength
                + " | tamanhoMaximo = " + maxLength
                + " | stage = " + stage
                + " | buffer = >>> " + clisitef.getBuffer() + " <<<"
                + " | buffer.length = " + clisitef.getBuffer().length());
        System.out.println("###########");

        switch (command) {
            case CliSiTef.CMD_RESULT_DATA:
                switch (fieldId) {
                    //Dados da transacao
                    case 105: //data
                    case 108: //codigo bandeira com Carteira Digital
                    case 132: //codigo bandeira
                    case 134: //nsu
                    case 156: //bandeira
                    case 952: //documento Carteira Digital
                        retorno.put("dados_transacao_cartao", "true");
                        retorno.put("command", String.valueOf(command));
                        retorno.put("fieldId", String.valueOf(fieldId));
                        retorno.put("data", clisitef.getBuffer());
                        messageChannel.send(retorno);
                        break;


                    case CAMPO_COMPROVANTE_CLIENTE:
                    case CAMPO_COMPROVANTE_ESTAB:
                        retorno.put("command", String.valueOf(command));
                        retorno.put("fieldId", String.valueOf(fieldId));
                        retorno.put("alerta", clisitef.getBuffer());
                        messageChannel.send(retorno);
                }
                break;

            case CliSiTef.CMD_SHOW_MSG_CASHIER:
            case CliSiTef.CMD_SHOW_MSG_CUSTOMER:
            case CliSiTef.CMD_SHOW_MSG_CASHIER_CUSTOMER:
                retorno.put("command", String.valueOf(command));
                retorno.put("fieldId", String.valueOf(fieldId));
                retorno.put("status", clisitef.getBuffer());
                messageChannel.send(retorno);
                break;

            case CliSiTef.CMD_SHOW_MENU_TITLE:
            case CliSiTef.CMD_SHOW_HEADER:
                title = clisitef.getBuffer();
                break;
            case CliSiTef.CMD_CLEAR_MSG_CASHIER:
            case CliSiTef.CMD_CLEAR_MSG_CUSTOMER:
            case CliSiTef.CMD_CLEAR_MSG_CASHIER_CUSTOMER:
            case CliSiTef.CMD_CLEAR_MENU_TITLE:
            case CliSiTef.CMD_CLEAR_HEADER:
                title = "";
                break;
            case CliSiTef.CMD_CONFIRM_GO_BACK:
            case CliSiTef.CMD_CONFIRMATION: {
                retorno.put("command", String.valueOf(command));
                retorno.put("fieldId", String.valueOf(fieldId));
                retorno.put("title", title);
                retorno.put("message", clisitef.getBuffer());
                retorno.put("get_data", "true");
                retorno.put("confirmation", "true");
                messageChannel.send(retorno);
                return;
            }
            case CliSiTef.CMD_GET_FIELD:
            case CliSiTef.CMD_GET_FIELD_BARCODE:
            case CliSiTef.CMD_GET_FIELD_CURRENCY: {
                retorno.put("command", String.valueOf(command));
                retorno.put("fieldId", String.valueOf(fieldId));
                retorno.put("title", title);
                retorno.put("message", clisitef.getBuffer());
                retorno.put("get_data", "true");
                messageChannel.send(retorno);
                return;
            }
            case CliSiTef.CMD_GET_MENU_OPTION: {
                retorno.put("command", String.valueOf(command));
                retorno.put("fieldId", String.valueOf(fieldId));
                retorno.put("title", title);
                retorno.put("message", clisitef.getBuffer());
                retorno.put("get_data", "true");
                retorno.put("menu", "true");
                messageChannel.send(retorno);
                return;
            }

            case CliSiTef.CMD_SHOW_QRCODE_FIELD: {
                retorno.put("command", String.valueOf(command));
                retorno.put("fieldId", String.valueOf(fieldId));
                retorno.put("title", title);
                retorno.put("message", clisitef.getBuffer());
                retorno.put("get_data", "true");
                retorno.put("menu", "true");
                messageChannel.send(retorno);
                break;
            }

            case CliSiTef.CMD_REMOVE_QRCODE_FIELD: {
                retorno.put("command", String.valueOf(command));
                retorno.put("fieldId", String.valueOf(fieldId));
                retorno.put("title", title);
                retorno.put("message", clisitef.getBuffer());
                retorno.put("get_data", "true");
                retorno.put("menu", "true");
                messageChannel.send(retorno);
                break;
            }

            case CliSiTef.CMD_PRESS_ANY_KEY: {
                retorno.put("command", String.valueOf(command));
                retorno.put("fieldId", String.valueOf(fieldId));
                retorno.put("message", clisitef.getBuffer());
                retorno.put("information", "true");
                messageChannel.send(retorno);
                return;
            }

            default:

                break;
        }


        clisitef.continueTransaction(data);
    }

    @Override
    public void onTransactionResult(int stage, int resultCode) {
        Map<String, String> retorno = new HashMap<>();
        retorno.put("stage", String.valueOf(stage));
        retorno.put("resultCode", String.valueOf(resultCode));

        if (stage == 1 && resultCode == 0) {
            result.success(true);
        } else {
            if (resultCode == 0) {

            } else {
                switch (resultCode) {
                    case -2:
                        retorno.put("message", getMessageDescription(stage, resultCode));
                        retorno.put("abortado", "true");
                        messageChannel.send(retorno);
                        break;

                    default:
                        result.error("Erro", getMessageDescription(stage, resultCode), resultCode);
                }
            }
        }
    }


    private String getMessageDescription(int stage, int sts) {
        switch (sts) {
            case -1:
                return activity.getString(R.string.msgModuloNaoConfigurado);
            case -2:
                return activity.getString(R.string.msgCanceladoOperador);
            case -3:
                return activity.getString(R.string.msgFuncaoInvalida);
            case -4:
                return activity.getString(R.string.msgFaltaMemoria);
            case -5:
                return activity.getString(R.string.msgFalhaComunicacao);
            case -6:
                return activity.getString(R.string.msgCanceladoPortador);
            case -40:
                return activity.getString(R.string.msgNegadaSiTef);
            case -43:
                return activity.getString(R.string.msgErroPinPad);
            case -100:
                return activity.getString(R.string.msgOutrosErros);
            default:
                return "Stage " + stage + activity.getString(R.string.msgReturned) + " " + sts;
        }
    }
}
