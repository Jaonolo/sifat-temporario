package br.com.sifat.autoatendimento.pos.model;

public enum MarcaPOS {
    NENHUMA("NENHUMA"),
    GERTEC("GERTEC"),
    INGENICO("INGENICO"),
    CIELO_LIO("CIELO_LIO"),
    NEWLAND_N910("NEWLAND_N910"),
    ELGIN_PAY_EP5855("Elgin Pay EP5855");

    private String descricao;

    MarcaPOS(String descricao) {
        this.descricao = descricao;
    }
}
