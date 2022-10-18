package br.com.sifat.autoatendimento.utils;

import android.content.Context;

import java.util.Objects;

import br.com.sifat.autoatendimento.BuildConfig;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;

public class AndroidUtil {

    private MethodChannel.Result result;
    private BasicMessageChannel messageChannel;
    private static final String ANDROID_UTIL_CHANNEL = "android_util_channel";
    private static final String ANDROID_UTIL_MESSAGE_CHANNEL = "android_util_message_channel";


    public AndroidUtil(Context context, BinaryMessenger messenger) {

        MethodChannel channel = new MethodChannel(messenger, ANDROID_UTIL_CHANNEL);
        channel.setMethodCallHandler(this::handleActionsfChannel);

        messageChannel = new BasicMessageChannel<>(messenger, ANDROID_UTIL_MESSAGE_CHANNEL, new StandardMessageCodec());
    }


    private void handleActionsfChannel(MethodCall methodCall, MethodChannel.Result result) {
        this.result = result;

        switch (methodCall.method) {
            case "flavor":
                System.out.println("FLAVOR: " + BuildConfig.FLAVOR);
                this.messageChannel.send(BuildConfig.FLAVOR);
                this.result.success(BuildConfig.FLAVOR);
                break;
        }
    }
}

