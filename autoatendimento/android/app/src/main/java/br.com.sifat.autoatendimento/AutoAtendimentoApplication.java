package br.com.sifat.autoatendimento;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;

import com.elgin.e1.Impressora.Termica;
import com.usdk.apiservice.BuildConfig;
import com.usdk.apiservice.aidl.UDeviceService;

import java.util.concurrent.TimeUnit;

import br.com.setis.printer.IPrinter;
import br.com.setis.printer.PrinterManager;
import br.com.sifat.autoatendimento.pos.gtouch.ImpressoraGTouch;
import br.com.sifat.autoatendimento.pos.ingenico.util.api.DeviceService;
import io.flutter.app.FlutterApplication;
import io.reactivex.Completable;
import timber.log.Timber;
import wangpos.sdk4.libbasebinder.Printer;

public class AutoAtendimentoApplication extends FlutterApplication {
    private static final String TAG = "WAYCHEF";
    private static final String USDK_ACTION_NAME = "com.usdk.apiservice";
    private static final String USDK_PACKAGE_NAME = "com.usdk.apiservice";
    private static DeviceService deviceService;
    private static Context context;
    private static Printer gertecPrinter;
    private static IPrinter newlandIPrinter;

    /**
     * Create.
     */
    @Override
    public void onCreate() {
        super.onCreate();
        Log.d(TAG, "Passou no onCreate do Application");

        Log.d(TAG, BuildConfig.FLAVOR + " - " + BuildConfig.BUILD_TYPE);

        context = getApplicationContext();

        //Start da impressora GTouch precisa estar no onCreate, caso contrário não funciona
        //Como não existe nenhuma comunicação com a API antes da execução, não tem como validar se a estação é GTOUCH, porém, em testes com demais equipamentos não houve problema.
        ImpressoraGTouch.start();

        if (BuildConfig.FLAVOR.contains("ingenico")) {
            // Bind sdk device service.
            bindSdkDeviceService();

            // Create a global webView to load print template
            br.com.sifat.autoatendimento.pos.ingenico.util.printer.Printer.initWebView(context);
//            Printer.initWebView(context);

            Completable.complete().delay(3, TimeUnit.SECONDS)
                    .andThen(br.com.sifat.autoatendimento.pos.ingenico.util.printer.Printer.preLoadHtml("multi-languages-template", "{}"))
                    .subscribe();

            if (BuildConfig.DEBUG) {
                Timber.plant(new Timber.DebugTree());
            }
        } else if (BuildConfig.FLAVOR.contains("gertec")) {
            new Thread() {
                @Override
                public void run() {
                    gertecPrinter = new Printer((getApplicationContext()));
                }
            }.start();
        } else if (BuildConfig.FLAVOR.contains("newland")) {
            configNewland();
        }
    }

    private void configNewland() {
        try {
            //Para que a impressora seja agnóstica ao hardware, o printerModule deve ser enviado vazio:
            newlandIPrinter = PrinterManager.getPrinter(context, "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onTerminate() {
        super.onTerminate();
        Log.d(TAG, "Passou no onTerminate do Application");
        //Fecha a impressora do mini pdv
        Termica.FechaConexaoImpressora();

        if (BuildConfig.FLAVOR.contains("ingenico")) {
            try {
                deviceService.unregister();
            } catch (RemoteException e) {
                e.printStackTrace();
            }
            unbindService(serviceConnection);
            System.exit(0);
        }
    }

    /**
     * Get context.
     */
    public static Context getContext() {
        if (context == null) {
            throw new RuntimeException("Initiate context failed");
        }

        return context;
    }

    /**
     * Get device service instance.
     */
    public static DeviceService getDeviceService() {
        if (deviceService == null) {
            throw new RuntimeException("SDK service is still not connected.");
        }

        return deviceService;
    }


    /**
     * Bind sdk service.
     */
    private void bindSdkDeviceService() {
        Intent intent = new Intent();
        intent.setAction(USDK_ACTION_NAME);
        intent.setPackage(USDK_PACKAGE_NAME);

        Log.d(TAG, "binding sdk device service...");
        boolean flag = bindService(intent, serviceConnection, Context.BIND_AUTO_CREATE);
        if (!flag) {
            Log.d(TAG, "SDK service binding failed.");
            return;
        }

        Log.d(TAG, "SDK service binding successfully.");
    }

    /**
     * Service connection.
     */
    private ServiceConnection serviceConnection = new ServiceConnection() {

        @Override
        public void onServiceDisconnected(ComponentName name) {
            Log.d(TAG, "SDK service disconnected.");
            deviceService = null;
        }

        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            Log.d(TAG, "SDK service connected.");

            try {
                deviceService = new DeviceService(UDeviceService.Stub.asInterface(service));
                deviceService.register();
                deviceService.debugLog(true, true);
                Log.d(TAG, "SDK deviceService initiated version: " + deviceService.getVersion() + ".");
            } catch (RemoteException e) {
                throw new RuntimeException("SDK deviceService initiating failed.", e);
            }

            try {
                linkToDeath(service);
            } catch (RemoteException e) {
                throw new RuntimeException("SDK service link to death error.", e);
            }
        }

        private void linkToDeath(IBinder service) throws RemoteException {
            service.linkToDeath(() -> {
                Log.d(TAG, "SDK service is dead. Reconnecting...");
                bindSdkDeviceService();
            }, 0);
        }
    };

    public static Printer getGertecPrinter() {
        return gertecPrinter;
    }

    public static IPrinter getNewlandIPrinter() {
        return newlandIPrinter;
    }
}
