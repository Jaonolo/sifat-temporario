package br.com.sifat.autoatendimento.service;

import android.app.Activity;
import android.content.Context;

import br.com.sifat.autoatendimento.mini_pdv.ImpressoraElgin;
import br.com.sifat.autoatendimento.pos.gertec.ImpressoraGertecPOS;
import br.com.sifat.autoatendimento.pos.gtouch.ImpressoraGTouch;
import br.com.sifat.autoatendimento.pos.ingenico.ImpressoraIngenicoPOS;
import br.com.sifat.autoatendimento.pos.newland.ImpressoraNewland;
import br.com.sifat.autoatendimento.pos.model.MarcaPOS;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class ImpressoraService {

    private Context context;
    private Activity activity;
    private br.com.sifat.autoatendimetno.enumerator.TipoEstacao tipoEstacao;
    private MarcaPOS marcaPOS;
    private MethodChannel channel;
    private static final String IMPRESSORA_POS_CHANNEL = "impressora_channel";

    public ImpressoraService() {
    }

    public ImpressoraService(Activity activity, Context context, BinaryMessenger messenger) {
        this.context = context;
        this.activity = activity;
        this.channel = new MethodChannel(messenger, IMPRESSORA_POS_CHANNEL);
        try {
            listenImpressoraChannel();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void listenImpressoraChannel() {
        channel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                marcaPOS = MarcaPOS.valueOf(methodCall.argument("marcaPos"));
                tipoEstacao = br.com.sifat.autoatendimetno.enumerator.TipoEstacao.valueOf(methodCall.argument("tipoEstacao"));
                switch (methodCall.method) {
                    case "conectar":
                        conectarImpressora();
                        break;
                    case "imprimir":
                        imprimir(methodCall.argument("text"), result);
                        break;

                    case "imprimir_nfce":
                        imprimirNFCE(methodCall.argument("inicio"), methodCall.argument("qrcode"),
                                methodCall.argument("fim"), result);
                        break;

                    case "verificar_papel":
                        ImpressoraElgin impressoraElgin = new ImpressoraElgin();
                        impressoraElgin.statusSensorPapel(activity, tipoEstacao, marcaPOS, result);
                        break;

                    case "abrir_gaveta":
                        ImpressoraElgin impressoraElgin1 = new ImpressoraElgin();
                        impressoraElgin1.abrirGaveta(activity, tipoEstacao, marcaPOS, result);
                        break;

//                    case "enviarDisplay":
//                        System.out.println("##### enviar displayyy");
//                        GlassDisplay display = new GlassDisplay();
//                        display.EnviaSimbolo(methodCall.argument("symbol"));
//                        display.EnviaDados(methodCall.argument("value"));
//                        break;
                }
            }
        });
    }

    private void conectarImpressora() {
        switch (tipoEstacao) {
            case GTOUCH:
                ImpressoraGTouch.conectarImpressora();
                break;
        }
    }

    private void imprimir(String text, MethodChannel.Result result) {
        switch (tipoEstacao) {
            case SMART_POS:
                switch (marcaPOS) {
                    case GERTEC:
                        imprimirGertec(text, result);
                        break;
                    case INGENICO:
                        imprimirIngenico(text, result);
                        break;
                    case NEWLAND_N910:
                        imprimirNewland(text, result);
                        break;
                    case ELGIN_PAY_EP5855:
                        imprimirElgin(text, result);
                        break;
                }
                break;
            case GTOUCH:
                imprimirGTouch(text, result);
                break;
            case MINI_PDV:
                imprimirElgin(text, result);
                break;
        }
    }

    private void imprimirGertec(String text, MethodChannel.Result result) {
        ImpressoraGertecPOS impressora = new ImpressoraGertecPOS();
        impressora.imprimir(text, result);
    }

    private void imprimirIngenico(String text, MethodChannel.Result result) {
        ImpressoraIngenicoPOS impressoraIngenicoPOS = new ImpressoraIngenicoPOS(context);
        impressoraIngenicoPOS.imprimir(text, result);
    }

    private void imprimirGTouch(String text, MethodChannel.Result result) {
        ImpressoraGTouch impressoraGTouch =
                new ImpressoraGTouch();
        impressoraGTouch.imprimir(text, result);
    }

    private void imprimirElgin(String text, MethodChannel.Result result) {
        ImpressoraElgin impressoraElgin = new ImpressoraElgin();
        impressoraElgin.imprimir(text, activity, tipoEstacao, marcaPOS, result);
    }

    private void imprimirNewland(String text, MethodChannel.Result result) {
        ImpressoraNewland impressoraNewland = new ImpressoraNewland(context);
        impressoraNewland.imprimir(text, result);
    }

    private void imprimirNFCE(String inicio, String qrCode, String fim, MethodChannel.Result result) {
        switch (tipoEstacao) {
            case SMART_POS:
                switch (marcaPOS) {
                    case GERTEC:
                        imprimirNFCEGertec(inicio, qrCode, fim, result);
                        break;
                    case INGENICO:
                        imprimirNFCEIngenico(inicio, qrCode, fim, result);
                        break;
                    case NEWLAND_N910:
                        imprimirNFCENewland(inicio, qrCode, fim, result);
                        break;
                    case ELGIN_PAY_EP5855:
                        _imprimirNFCEElgin(inicio, qrCode, fim, result);
                        break;
                }
                break;
            case GTOUCH:
                imprimirNFCEGTouch(inicio, qrCode, fim, result);
                break;
            case MINI_PDV:
                _imprimirNFCEElgin(inicio, qrCode, fim, result);
                break;
        }

    }

    private void imprimirNFCEGertec(String inicio, String qrCode, String fim, MethodChannel.Result result) {
        ImpressoraGertecPOS impressora = new ImpressoraGertecPOS();
        impressora.imprimirNFCE(inicio, qrCode, fim, result);
    }

    private void imprimirNFCEIngenico(String inicio, String qrCode, String fim, MethodChannel.Result result) {
        ImpressoraIngenicoPOS impressoraIngenicoPOS = new ImpressoraIngenicoPOS(context);
        impressoraIngenicoPOS.imprimirNFCE(inicio, qrCode, fim, result);
    }

    private void imprimirNFCEGTouch(String inicio, String qrCode, String fim, MethodChannel.Result result) {
        ImpressoraGTouch impressoraGTouch =
                new ImpressoraGTouch();
        impressoraGTouch.imprimirNFCE(inicio, qrCode, fim, result);
    }

    private void imprimirNFCENewland(String inicio, String qrCode, String fim, MethodChannel.Result result) {
        ImpressoraNewland impressoraNewland = new ImpressoraNewland(context);
        impressoraNewland.imprimirNFCE(inicio, qrCode, fim, result);
    }

    private void _imprimirNFCEElgin(String inicio, String qrCode, String fim, MethodChannel.Result result) {
        ImpressoraElgin impressoraElgin = new ImpressoraElgin();
        impressoraElgin.imprimirNFCE(inicio, qrCode, fim, activity, tipoEstacao, marcaPOS, result);
    }
}
