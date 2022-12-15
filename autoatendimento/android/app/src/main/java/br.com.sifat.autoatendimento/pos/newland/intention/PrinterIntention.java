package br.com.sifat.autoatendimento.pos.newland.intention;

import br.com.setis.printer.IPrinter;
import br.com.setis.printer.enums.PrinterSymbolCode;

public interface PrinterIntention {

    void print(IPrinter iPrinter, String content);

    void printQrCode(IPrinter iPrinter, PrinterSymbolCode printerSymbolCode, String content);

    void printFormfeed(IPrinter iPrinter);
}
