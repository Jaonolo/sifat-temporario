package br.com.sifat.autoatendimento.mini_pdv;

import android.app.Activity;

import com.elgin.e1.Impressora.Termica;

import br.com.sifat.autoatendimetno.enumerator.TipoEstacao;
import br.com.sifat.autoatendimento.pos.model.MarcaPOS;
import io.flutter.plugin.common.MethodChannel;

public class ImpressoraElgin {
    //ALINHAMENTO: Esquerda = 0, Centralizado = 1, Direita = 2;
    int alignValue = 1;
    //STILO: FONT B = 1, isUnderline += 2, isBold += 8
    int styleValue = 1;
    //Tamanho da fonte
    int fontSize = 0;

    // Está função somente devera se chamada uma vez ao setar a impressora, ela inicializara a conexao com a impressora e seta o activity que é nescessario
    //no on destroy fecha a conexao
    private void conectarImpressora(Activity activity, TipoEstacao tipoEstacao, MarcaPOS marcaPOS) {
        printerStop();
        Termica.setActivity(activity);
        if (tipoEstacao.equals(TipoEstacao.MINI_PDV)) {
            Termica.AbreConexaoImpressora(6, "M8", "", 0);
        } else if (marcaPOS.equals(MarcaPOS.ELGIN_PAY_EP5855)) {
            Termica.AbreConexaoImpressora(5, "SMARTPOS", "", 0);
        }
    }

    private void printerStop() {
        Termica.FechaConexaoImpressora();
    }

    private void finalizaImpressao(TipoEstacao tipoEstacao, MarcaPOS marcaPOS) {
        if (tipoEstacao.equals(TipoEstacao.MINI_PDV)) {
            Termica.AvancaPapel(20);
            Termica.Corte(3);
        } else if (marcaPOS.equals(MarcaPOS.ELGIN_PAY_EP5855)) {
            Termica.AvancaPapel(1);
        }
    }


    public void imprimir(String text, Activity activity, TipoEstacao tipoEstacao, MarcaPOS marcaPOS, MethodChannel.Result result) {
        try {
            conectarImpressora(activity, tipoEstacao, marcaPOS);
            int i = Termica.ImpressaoTexto(text, alignValue, styleValue, fontSize);
            finalizaImpressao(tipoEstacao, marcaPOS);

            result.success(null);
        } catch (Exception ex) {
            ex.printStackTrace();
            result.error(ex.getMessage(), ex.getLocalizedMessage(), ex.toString());
        }
    }

    public void imprimirNFCE(String inicio, String qrCode, String fim, Activity activity, TipoEstacao tipoEstacao, MarcaPOS marcaPOS, MethodChannel.Result result) {
        try {
            conectarImpressora(activity, tipoEstacao, marcaPOS);

            Termica.ImpressaoTexto(inicio, alignValue, styleValue, fontSize);

            Termica.DefinePosicao(1);
            Termica.ImpressaoQRCode(qrCode, 3, 2);

            Termica.ImpressaoTexto(fim, alignValue, styleValue, fontSize);

            finalizaImpressao(tipoEstacao, marcaPOS);
            result.success(null);
        } catch (Exception ex) {
            ex.printStackTrace();
            result.error(ex.getMessage(), ex.getLocalizedMessage(), ex.toString());
        }
    }

    public void abrirGaveta(Activity activity, br.com.sifat.autoatendimetno.enumerator.TipoEstacao tipoEstacao, MarcaPOS marcaPOS, MethodChannel.Result result) {
        conectarImpressora(activity, tipoEstacao, marcaPOS);
        Termica.AbreGavetaElgin();
        result.success(true);
    }

    public void statusSensorPapel(Activity activity, br.com.sifat.autoatendimetno.enumerator.TipoEstacao tipoEstacao, MarcaPOS marcaPOS, MethodChannel.Result result) {
        conectarImpressora(activity, tipoEstacao, marcaPOS);

        result.success(Termica.StatusImpressora(3));
    }
}