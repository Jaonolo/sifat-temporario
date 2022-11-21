package br.com.sifat.autoatendimento.pos.rede;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;

import com.alibaba.fastjson.JSON;

import java.util.Map;
import java.util.Objects;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;
import rede.smartrede.sdk.FlexTipoPagamento;
import rede.smartrede.sdk.Payment;
import rede.smartrede.sdk.Receipt;
import rede.smartrede.sdk.RedePaymentValidationError;
import rede.smartrede.sdk.RedePayments;

public class Rede {

    private Activity activity;
    private RedePayments redePayments;
    private MethodChannel.Result result;
    private BasicMessageChannel messageChannel;
    private static final String REDE_CHANNEL = "rede_channel";
    private static final String REDE_MESSAGE_CHANNEL = "rede_message_channel";
    private static final int PAYMENT_REQUEST_CODE = 400, REVERSAL_REQUEST_CODE = 401, REPRINT_REQUEST_CODE = 402;

    public Rede(Activity activity, BinaryMessenger messenger) {
        this.activity = activity;

        this.redePayments = RedePayments.getInstance(activity);

        MethodChannel channel = new MethodChannel(messenger, REDE_CHANNEL);
        channel.setMethodCallHandler(this::handleActionsSitefChannel);

        messageChannel = new BasicMessageChannel<>(messenger, REDE_MESSAGE_CHANNEL, new StandardMessageCodec());
    }


    private void handleActionsSitefChannel(MethodCall methodCall, MethodChannel.Result result) {
        this.result = result;
        switch (methodCall.method) {
            case "transacionar":
                transacionar(Objects.requireNonNull(methodCall.argument("dados")));
                break;

            case "estornar":
                estornar();
                break;

            case "reimprimir":
                reimprimir();
                break;
        }
    }


    private void sendResult(boolean success, Object data) {
        if (success)
            this.result.success(JSON.toJSONString(data));
        else
            this.result.error(null, data.toString(), null);
    }

    private void transacionar(Map<String, String> dados) {
        try {
            FlexTipoPagamento tipoPagamento = null;
            if (Objects.requireNonNull(dados.get("funcao")).equals("CARTAO_DEBITO")) {
                tipoPagamento = FlexTipoPagamento.DEBITO;
            }
            if (Objects.requireNonNull(dados.get("funcao")).equals("CARTAO_CREDITO")) {
                tipoPagamento = FlexTipoPagamento.CREDITO_A_VISTA;
            }

            long valor = Long.parseLong(Objects.requireNonNull(dados.get("valor")));

            Intent i = redePayments.intentForPaymentBuilder(Objects.requireNonNull(tipoPagamento), valor).build();

            this.activity.startActivityForResult(i, PAYMENT_REQUEST_CODE);

        } catch (Exception e) {
            e.printStackTrace();
            result.error("Erro", "Rede.transacionar()", e.toString());
        }
    }

    private void estornar() {
        try {
            Intent i = redePayments.intentForReversal();
            this.activity.startActivityForResult(i, REVERSAL_REQUEST_CODE);
        } catch (Exception e) {
            e.printStackTrace();
            result.error("Erro", "Rede.estornar()", e.toString());
        }
    }

    private void reimprimir() {
        try {
            Intent i = redePayments.intentForReprint();
            this.activity.startActivityForResult(i, REPRINT_REQUEST_CODE);
        } catch (Exception e) {
            e.printStackTrace();
            result.error("Erro", "Rede.reprint()", e.toString());
        }
    }

    public void tratarActivityResult(int requestCode, int resultCode, Intent data, int RESULT_OK, int RESULT_CANCELED) {
        switch (requestCode) {
            case PAYMENT_REQUEST_CODE:
                if (resultCode == RESULT_OK) {
                    if (data != null) {
                        Payment payment = RedePayments.getPaymentFromIntent(data);
                        switch (payment.getStatus()) {
                            case AUTHORIZED:
                                Receipt receipt = payment.getReceipt();
                                sendResult(true, receipt);
                                break;

                            case FAILED:
                                sendResult(false, "Pagamento falhou");
                                break;

                            case DECLINED:
                                sendResult(false, "Pagamento negado");
                                break;
                        }
                    }
                } else if (resultCode == RESULT_CANCELED) {
                    sendResult(false, "Pagamento cancelado");
                }
                break;

            case REVERSAL_REQUEST_CODE:
                if (resultCode == RESULT_OK) {
                    if (data != null) {
                        Payment payment = RedePayments.getPaymentFromIntent(data);

                        switch (payment.getStatus()) {
                            case AUTHORIZED:
                                sendResult(true, payment);
                                break;

                            case FAILED:
                                sendResult(false, "Estorno de pagamento: FALHA");
                                break;

                            case DECLINED:
                                sendResult(true, "Estorno de pagamento: RECUSADO");
                                break;
                        }
                    }
                } else {
                    sendResult(false, "Estorno de pagamento:  CANCELADO");
                }
                break;

            case REPRINT_REQUEST_CODE:
                if (resultCode == RESULT_OK)
                    sendResult(true, "Reimpressão feita com sucesso");
                else
                    sendResult(false, "Reimpressão cancelada");
                break;
        }
    }
}
