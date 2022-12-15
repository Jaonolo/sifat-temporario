package br.com.sifat.autoatendimento.pos.newland;

import android.content.Context;

import androidx.annotation.NonNull;

import br.com.setis.printer.IPrinter;
import br.com.setis.printer.IPrinterListener;
import br.com.setis.printer.PrinterError;
import br.com.setis.printer.enums.PrinterSymbolCode;
import br.com.sifat.autoatendimento.AutoAtendimentoApplication;
import br.com.sifat.autoatendimento.pos.newland.intention.PrinterIntention;
import io.flutter.plugin.common.MethodChannel;

public class ImpressoraNewland implements PrinterIntention, IPrinterListener {
    private Context context;
    private MethodChannel.Result result;
    private boolean enviarRetorno = false;

    public ImpressoraNewland(Context context) {
        this.context = context;
        this.enviarRetorno = false;
    }

    public void imprimirComprovante(String text) {
        try {
            //no envia retorno
            this.enviarRetorno = false;
            IPrinter iPrinter = AutoAtendimentoApplication.getNewlandIPrinter();

            print(iPrinter, text);
            printFormfeed(iPrinter);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void imprimir(String text, MethodChannel.Result result) {
        try {
            this.result = result;
            IPrinter iPrinter = AutoAtendimentoApplication.getNewlandIPrinter();
            this.enviarRetorno = false;

            print(iPrinter, text);
            this.enviarRetorno = true;
            printFormfeed(iPrinter);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void imprimirNFCE(String inicio, String qrCode, String fim, MethodChannel.Result result) {
        this.result = result;
        IPrinter iPrinter = AutoAtendimentoApplication.getNewlandIPrinter();
        this.enviarRetorno = false;

        print(iPrinter, inicio);
        printQrCode(iPrinter, PrinterSymbolCode.CODESYMB_QRCODE, qrCode);
        print(iPrinter, fim);
        this.enviarRetorno = true;
        printFormfeed(iPrinter);
    }

    @Override
    public void print(IPrinter iPrinter, String content) {
        iPrinter.printLine(content, this);
    }

    @Override
    public void printQrCode(@NonNull IPrinter iPrinter, PrinterSymbolCode printerSymbolCode, String content) {
        iPrinter.printSymbolCode(content, printerSymbolCode, this);
    }

    @Override
    public void printFormfeed(IPrinter iPrinter) {
        //Pular linha
        iPrinter.printFormFeed(this);
    }

    @Override
    public void onSuccess() {
        //tratativa por conta de resposta duplicado dando erro "Reply already submitted"
        if (enviarRetorno) {
            if (result != null) {
                this.result.success(true);
            }
        }
    }

    @Override
    public void onError(PrinterError printerError) {
        this.result.error("", "Ocorreu um erro ao realizar a impressão", printerError.toString());
    }
}
