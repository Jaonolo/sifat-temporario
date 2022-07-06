part of openapi.api;

enum Servico {
    NENHUM("NENHUM"),
    IFOOD("IFOOD"),
    IMPRESSAO("IMPRESSAO"),
    CATRACA("CATRACA"),
    ALFA_SYNC("ALFA_SYNC"),
    FOUR_ALL("4ALL"),
    SITEF("SITEF"),
    PAYGO("PayGo"),
    REDE("REDE"),
    CIELO_LIO("Cielo Lio"),
    QUEST("Quest"),
    WABIZ("Wabiz"),
    TRACKAPP("TrackApp"),
    WAYMENU("WayMenu"),
    NAPP("NAPP Solutions"),
    NFSE("NFS-e"),
    GIG("Gig Soluções"),
    AUTO_PESAGEM("AutoPesagem"),
    AUTO_ATENDIMENTO("AutoAtendimento"),
    MFE("Integrador fiscal"),
    ELGIN_PAY("TEF - Elgin Pay"),
    ;

    final String descricao;

    const Servico(this.descricao);
}

extension ServicoExtension on Servico {
    String get name => describeEnum(this);

    bool equals(Servico tipo) => this == tipo;
}
