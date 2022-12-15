package br.com.sifat.autoatendimento.pos.gertec;

import android.annotation.SuppressLint;

import br.com.sifat.autoatendimento.AutoAtendimentoApplication;
import io.flutter.plugin.common.MethodChannel;
import wangpos.sdk4.libbasebinder.Printer;


public class ImpressoraGertecPOS {

    public ImpressoraGertecPOS() {
    }

    @SuppressLint("StaticFieldLeak")
    public void imprimir(String text, MethodChannel.Result result) {
        try {
            Printer gertecPrinter = AutoAtendimentoApplication.getGertecPrinter();

            gertecPrinter.printInit();
            gertecPrinter.printString(text, 18, Printer.Align.CENTER, true, false);
            gertecPrinter.printPaper(2);
            gertecPrinter.printFinish();

            result.success(null);
        } catch (Exception ex) {
            result.error(ex.getMessage(), ex.getLocalizedMessage(), ex.toString());
        }

    }

    @SuppressLint("StaticFieldLeak")
    public void imprimirNFCE(String inicio, String qrCode, String fim, MethodChannel.Result result) {
        try {
            Printer gertecPrinter = AutoAtendimentoApplication.getGertecPrinter();

            gertecPrinter.printInit();
            gertecPrinter.printString(inicio, 18, Printer.Align.CENTER, true, false);
            gertecPrinter.printQRCode(qrCode, 200, Printer.Align.CENTER);
            gertecPrinter.printString(fim, 18, Printer.Align.CENTER, true, false);
            gertecPrinter.printPaper(2);
            gertecPrinter.printFinish();

            result.success(null);
        } catch (Exception ex) {
            result.error(ex.getMessage(), ex.getLocalizedMessage(), ex.toString());
        }
    }
}
