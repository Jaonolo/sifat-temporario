package br.com.sifat.autoatendimento.utils;

import java.text.Normalizer;

public class StringUtils {

    public static String removeAcentuacao(String sTexto) {
        if (sTexto == null)
            return sTexto;

        sTexto = Normalizer.normalize(sTexto, Normalizer.Form.NFD);
        sTexto = sTexto.replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
        return sTexto;
    }
}