package br.com.sifat.autoatendimento.pos.gtouch;

import br.com.gertec.libescpos.ConnectionConfig;
import br.com.gertec.libescpos.ESCPOS.Command;
import br.com.gertec.libescpos.ESCPOS.EscPos;
import br.com.gertec.libescpos.ModelGertec;
import br.com.gertec.libescpos.Utils.TypeConnection;
import br.com.sifat.autoatendimento.AutoAtendimentoApplication;
import io.flutter.plugin.common.MethodChannel;

public class ImpressoraGTouch {
    static EscPos escPos;

    public ImpressoraGTouch() {
    }

    // Está função somente devera se chamada uma vez no seu OnCreate, ela inicializara o Esc Pos
    public static void start() {
        escPos = EscPos.getInstance(ModelGertec.A112);
    }

    public static void conectarImpressora() {
        ConnectionConfig connectionConfig = new ConnectionConfig();
        escPos = EscPos.getInstance(ModelGertec.A112);
        connectionConfig.setTypeConnection(TypeConnection.CONNECTION_USB_A112);
        connectionConfig.setUsbPid(1280);
        connectionConfig.setUsbVid(26728);
        escPos.connection.setConnection(AutoAtendimentoApplication.getContext(), connectionConfig);
    }

    public void imprimir(String text, MethodChannel.Result result) {
        try {
            if (!escPos.connection.isConnected()) {
                conectarImpressora();
            }

            escPos.addSelectPrintModes(Command.FONT.FONTB,
                    Command.ENABLE.OFF,
                    Command.ENABLE.OFF,
                    Command.ENABLE.OFF,
                    Command.ENABLE.OFF);
            escPos.addSetCharacterSize(Command.WIDTH_ZOOM.MUL_1, Command.HEIGHT_ZOOM.MUL_1);
            escPos.addSelectJustification(Command.JUSTIFICATION.CENTER);
            escPos.addText(text);
            escPos.cutPaper(Command.TYPE_CUT.FULL_CUT);
            escPos.addPrintAndFeedLines(Byte.parseByte("1"));
            result.success(null);
        } catch (Exception ex) {
            ex.printStackTrace();
            result.error(ex.getMessage(), ex.getLocalizedMessage(), ex.toString());
        }
    }

    public void imprimirNFCE(String inicio, String qrCode, String fim, MethodChannel.Result result) {
        try {
            if (!escPos.connection.isConnected()) {
                conectarImpressora();
            }

            escPos.addSelectPrintModes(Command.FONT.FONTB,
                    Command.ENABLE.OFF,
                    Command.ENABLE.OFF,
                    Command.ENABLE.OFF,
                    Command.ENABLE.OFF);
            escPos.addSetCharacterSize(Command.WIDTH_ZOOM.MUL_1, Command.HEIGHT_ZOOM.MUL_1);
            escPos.addSelectJustification(Command.JUSTIFICATION.CENTER);

            escPos.addText(inicio + "\n");

            if (qrCode != null && !qrCode.isEmpty()) {
                escPos.addSelectErrorCorrectionLevelForQRCode((byte) 0x31);
                escPos.addSelectSizeOfModuleForQRCode(Byte.parseByte("3"));
                escPos.addStoreQRCodeData(qrCode);
                escPos.addPrintQRCode();
            }

            escPos.addText("\n" + fim);

            escPos.cutPaper(Command.TYPE_CUT.FULL_CUT);
            escPos.addPrintAndFeedLines(Byte.parseByte("1"));
            result.success(null);
        } catch (Exception ex) {
            ex.printStackTrace();
            result.error(ex.getMessage(), ex.getLocalizedMessage(), ex.toString());
        }
    }
}
