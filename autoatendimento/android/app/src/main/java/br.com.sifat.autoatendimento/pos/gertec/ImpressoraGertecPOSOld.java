package br.com.sifat.autoatendimento.pos.gertec;

import android.annotation.SuppressLint;
import android.util.Log;

import org.json.JSONObject;

import io.flutter.plugin.common.MethodChannel;

public class ImpressoraGertecPOSOld {

    public ImpressoraGertecPOSOld() {
    }

    @SuppressLint("StaticFieldLeak")
    public void imprimir(String text, MethodChannel.Result result) {
        try {
            WebSocketSSLClient.createConnection();

            JSONObject printerObject = new JSONObject();
            JSONObject parameters = new JSONObject();

            printerObject.put("module", "Printer");
            printerObject.put("service", "printText");
            printerObject.put("requestId", 1);

            parameters.put("offset", 0);
            parameters.put("lineSpace", 0);
            parameters.put("alignment", "CENTER");
            parameters.put("bold", false);
            parameters.put("italic", false);
            parameters.put("underscore", false);
            parameters.put("textSize", 22);
            parameters.put("text", text);
            parameters.put("outputNow", true);
            parameters.put("scrollPaper", true);

            printerObject.put("parameters", parameters);

            WebSocketSSLClient.sendMessageSocket(printerObject.toString());
            WebSocketSSLClient.closeSocket();

            result.success(null);
        } catch (Exception ex) {
            result.error(ex.getMessage(), ex.getLocalizedMessage(), ex.toString());
        }
    }

    @SuppressLint("StaticFieldLeak")
    public void imprimirNFCE(String inicio, String qrCode, String fim, MethodChannel.Result result) {
        try {
            WebSocketSSLClient.createConnection();

            JSONObject printerObject = new JSONObject();
            JSONObject parameters = new JSONObject();

            printerObject.put("module", "Printer");
            printerObject.put("service", "printText");
            printerObject.put("requestId", 1);
            parameters.put("offset", 0);
            parameters.put("lineSpace", 0);
            parameters.put("alignment", "CENTER");
            parameters.put("bold", false);
            parameters.put("italic", false);
            parameters.put("underscore", false);
            parameters.put("textSize", 18);
            parameters.put("text", inicio);
            parameters.put("outputNow", true);
            parameters.put("scrollPaper", false);
            printerObject.put("parameters", parameters);
            WebSocketSSLClient.sendMessageSocket(printerObject.toString());


            printerObject = new JSONObject();
            parameters = new JSONObject();
            printerObject.put("module", "Printer");
            printerObject.put("service", "printCode");
            printerObject.put("requestId", 2);
            parameters.put("text", qrCode);
            parameters.put("format", "QR_CODE");
            parameters.put("size", "HALF_PAPER");
            parameters.put("outputNow", true);
            printerObject.put("parameters", parameters);
            WebSocketSSLClient.sendMessageSocket(printerObject.toString());


            printerObject = new JSONObject();
            parameters = new JSONObject();
            printerObject.put("module", "Printer");
            printerObject.put("service", "printText");
            printerObject.put("requestId", 3);
            parameters.put("offset", 0);
            parameters.put("lineSpace", 0);
            parameters.put("alignment", "CENTER");
            parameters.put("bold", false);
            parameters.put("italic", false);
            parameters.put("underscore", false);
            parameters.put("textSize", 18);
            parameters.put("text", fim);
            parameters.put("outputNow", true);
            parameters.put("scrollPaper", true);
            printerObject.put("parameters", parameters);
            WebSocketSSLClient.sendMessageSocket(printerObject.toString());

            WebSocketSSLClient.closeSocket();
            result.success(null);
        } catch (Exception ex) {
            result.error(ex.getMessage(), ex.getLocalizedMessage(), ex.toString());
        }
    }
}
