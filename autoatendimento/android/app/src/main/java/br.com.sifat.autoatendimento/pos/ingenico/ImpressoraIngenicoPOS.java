package br.com.sifat.autoatendimento.pos.ingenico;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.RemoteException;

import com.usdk.apiservice.aidl.printer.ASCScale;
import com.usdk.apiservice.aidl.printer.ASCSize;
import com.usdk.apiservice.aidl.printer.AlignMode;
import com.usdk.apiservice.aidl.printer.ECLevel;
import com.usdk.apiservice.aidl.printer.HZScale;
import com.usdk.apiservice.aidl.printer.HZSize;
import com.usdk.apiservice.aidl.printer.OnPrintListener;

import br.com.sifat.autoatendimento.AutoAtendimentoApplication;
import br.com.sifat.autoatendimento.pos.ingenico.util.printer.Printer;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;

public class ImpressoraIngenicoPOS extends FlutterActivity {

    private static final int FONT_SIZE_SMALL = 0;
    private static final int FONT_SIZE_NORMAL = 1;
    private static final int FONT_SIZE_LARGE = 2;
    private static final int FONT_SIZE_WAYBE = 3;
    private Context context;

    public ImpressoraIngenicoPOS(Context context) {
        this.context = context;
    }

    @SuppressLint("StaticFieldLeak")
    public void imprimir(String text, MethodChannel.Result result) {

        text = text.replaceAll("-----------------------------------------------------",
                "------------------------------------------------");
        try {
            AutoAtendimentoApplication.getDeviceService().register();
        } catch (RemoteException e) {
            e.printStackTrace();
        }
        try {
            int status = AutoAtendimentoApplication.getDeviceService().getPrinter().getStatus();
            int tentativas = 0;
            Thread.sleep(1000);
            while (status > 0 && tentativas < 5) {
                Thread.sleep(1000);
                status = AutoAtendimentoApplication.getDeviceService().getPrinter().getStatus();
                tentativas += 1;
            }

            Exception ex = new Exception();
            for (int i = 0; i < 5; i++) {
                try {
                    Printer.getInstance().getStatus();
                    setFontSpec(FONT_SIZE_SMALL);
                    Printer.getInstance().addText(AlignMode.CENTER, text);
                    Printer.getInstance().feedLine(8);
                    Printer.getInstance().start(new OnPrintListener.Stub() {
                        @Override
                        public void onFinish() {
                        }

                        @Override
                        public void onError(int error) {
                        }
                    });

                    result.success(null);
                    return;
                }catch (Exception e){
                    Thread.sleep(1000);
                    ex = e;
                }
            }

            result.error(ex.getMessage(), ex.getLocalizedMessage(), ex.toString());
        } catch (Exception ex) {
            result.error(ex.getMessage(), ex.getLocalizedMessage(), ex.toString());
        }


    }

    @SuppressLint("StaticFieldLeak")
    public void imprimirNFCE(String inicio, String qrCode, String fim, MethodChannel.Result result) {

        //Tratativas String nfce enviada pela API waybe
        inicio = inicio.replaceAll("-----------------------------------------------------",
                "------------------------------------------------");

        try {
            AutoAtendimentoApplication.getDeviceService().register();
        } catch (RemoteException e) {
            e.printStackTrace();
        }

        try {
            int status = AutoAtendimentoApplication.getDeviceService().getPrinter().getStatus();
            int tentativas = 0;
            while (status > 0 && tentativas < 5) {
                Thread.sleep(1000);
                status = AutoAtendimentoApplication.getDeviceService().getPrinter().getStatus();
                tentativas += 1;
            }


            Exception ex = new Exception();
            for (int i = 0; i < 5; i++) {
                try {
                    Printer.getInstance().getStatus();
                    setFontSpec(FONT_SIZE_SMALL);
                    Printer.getInstance().addText(AlignMode.CENTER, inicio);
                    Printer.getInstance().addQrCode(AlignMode.CENTER, 180, ECLevel.ECLEVEL_Q, qrCode);
                    Printer.getInstance().addText(AlignMode.CENTER, fim);
                    Printer.getInstance().feedLine(8);
                    Printer.getInstance().start(new OnPrintListener.Stub() {
                        @Override
                        public void onFinish() {
                        }

                        @Override
                        public void onError(int error) {
                        }
                    });
                    result.success(null);
                    return;
                }catch (Exception e){
                    Thread.sleep(1000);
                    ex = e;
                }
            }

            result.error(ex.getMessage(), ex.getLocalizedMessage(), ex.toString());

        } catch (Exception ex) {
            result.error(ex.getMessage(), ex.getLocalizedMessage(), ex.toString());
        }
    }


    private void setFontSpec(int fontSpec) throws RemoteException {
        switch (fontSpec) {
            case FONT_SIZE_SMALL:
                Printer.getInstance().setHzSize(HZSize.DOT16x16);
                Printer.getInstance().setHzScale(HZScale.SC1x1);
                Printer.getInstance().setAscSize(ASCSize.DOT16x8);
                Printer.getInstance().setAscScale(ASCScale.SC1x1);
                break;

            case FONT_SIZE_NORMAL:
                Printer.getInstance().setHzSize(HZSize.DOT24x24);
                Printer.getInstance().setHzScale(HZScale.SC1x1);
                Printer.getInstance().setAscSize(ASCSize.DOT24x12);
                Printer.getInstance().setAscScale(ASCScale.SC1x1);
                break;

            case FONT_SIZE_LARGE:
                Printer.getInstance().setHzSize(HZSize.DOT24x24);
                Printer.getInstance().setHzScale(HZScale.SC1x2);
                Printer.getInstance().setAscSize(ASCSize.DOT24x12);
                Printer.getInstance().setAscScale(ASCScale.SC1x2);
                break;

            case FONT_SIZE_WAYBE:
                Printer.getInstance().setHzSize(HZSize.DOT16x16);
                Printer.getInstance().setHzScale(HZScale.SC2x1);
                Printer.getInstance().setAscSize(ASCSize.DOT16x8);
                Printer.getInstance().setAscScale(ASCScale.SC1x1);
                break;
        }
    }
}
