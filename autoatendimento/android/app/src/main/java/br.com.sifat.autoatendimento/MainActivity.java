package br.com.sifat.autoatendimento;

import android.content.Intent;
import android.util.Log;

import androidx.annotation.NonNull;

import br.com.sifat.autoatendimento.pos.rede.Rede;
import br.com.sifat.autoatendimento.pos.sitef.Sitef;
import br.com.sifat.autoatendimento.service.ImpressoraService;
import br.com.sifat.autoatendimento.utils.AndroidUtil;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private Rede rede;
    private Sitef sitef;
    private ImpressoraService impressoraService;
    private AndroidUtil androidUtil;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        Log.d("WAYCHEF", "Passou no MainActivity.onCreate() da camada Android");
        this.rede = new Rede(this, flutterEngine.getDartExecutor().getBinaryMessenger());
        this.sitef = new Sitef(this, flutterEngine.getDartExecutor().getBinaryMessenger());
        this.androidUtil = new AndroidUtil(this, flutterEngine.getDartExecutor().getBinaryMessenger());
        this.impressoraService = new ImpressoraService(this, this, flutterEngine.getDartExecutor().getBinaryMessenger());

    }


    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        this.rede.tratarActivityResult(requestCode, resultCode, data, RESULT_OK, RESULT_CANCELED);
    }
}
