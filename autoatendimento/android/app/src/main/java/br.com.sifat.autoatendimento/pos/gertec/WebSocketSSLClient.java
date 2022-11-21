package br.com.sifat.autoatendimento.pos.gertec;

import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;

import java.net.URI;
import java.net.URISyntaxException;

public class WebSocketSSLClient {

    private static WebSocketClient chatclient;
    private static Boolean clientConnect;

    public static void createConnection() {
        try {
            chatclient = new WebSocketClient(new URI("ws://localhost:2235")) {
                @Override
                public void onOpen(ServerHandshake handshakedata) {

                }

                @Override
                public void onMessage(String message) {

                }

                @Override
                public void onClose(int code, String reason, boolean remote) {

                }

                @Override
                public void onError(Exception ex) {

                }
            };
            chatclient.connect();
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            clientConnect = true;

        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
    }

    public static void closeSocket() {
        try {
            chatclient.closeBlocking();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        clientConnect = false;

    }

    public void reconnectSocket() {
        chatclient.reconnect();
        clientConnect = true;
    }

    public static void sendMessageSocket(String text) {
        if (clientConnect()) chatclient.send(text);
    }

    public void sendMessageSocket(byte[] data) {
        if (clientConnect()) chatclient.send(data);
    }

    private static boolean clientConnect() {
        return clientConnect;
    }
}
