package br.com.sifat.autoatendimetno.enumerator;

public enum TipoEstacao {
    MOVEL("MOVEL"),
    SMART_POS("SMART_POS"),
    GTOUCH("GTouch"),
    MINI_PDV("MINI_PDV");

    private String descricao;

    TipoEstacao(String descricao) {
        this.descricao = descricao;
    }

}
