package br.com.sifat.autoatendimento.pos.gtouch;

import java.io.File;
import java.io.OutputStream;

public class GlassDisplay {

    static File mydevice = new File("/dev/ttyHSL2");

    SerialPort mSerialPort;

    public GlassDisplay() {
        try {
            mSerialPort = new SerialPort(mydevice, 2400, 0);
        } catch (Exception ex) {

        }
    }

    public void EnviaDados(String Numeros) {
        OutputStream mOutputStream = mSerialPort.getOutputStream();
        byte[] Numbers = Numeros.getBytes();
        byte[] Prefix = new byte[]{0x1B, 0x51, 0x41};
        try {
            mOutputStream.write(Prefix);
            mOutputStream.write(Numbers);
            mOutputStream.write(0x0d);
        } catch (Exception ex) {

        }
    }

    public void EnviaSimbolo(int Numero) {
        OutputStream mOutputStream = mSerialPort.getOutputStream();
        byte[] Prefix = new byte[]{0x1B, 0x73, 0x00};
        if ((Numero >= 1) && (Numero <= 4))
            Prefix[2] = (byte) Numero;
        try {
            mOutputStream.write(Prefix);
        } catch (Exception ex) {

        }
    }

    public void ApagaDisplay() {
        OutputStream mOutputStream = mSerialPort.getOutputStream();
        try {
            mOutputStream.write(0x0c);
        } catch (Exception ex) {

        }
    }
}