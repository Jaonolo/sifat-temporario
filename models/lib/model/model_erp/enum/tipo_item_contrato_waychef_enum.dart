part of openapi.api;


enum TipoitemContratoWaychefEnum {

  MODULO_FINANCEIRO(ModuloContratoIndicadorEnum.FINANCEIRO),
  CONTROLE_BOLETO_BANCARIO(ModuloContratoIndicadorEnum.FINANCEIRO),
  CONTROLE_CARTOES(ModuloContratoIndicadorEnum.FINANCEIRO),
  CONTROLE_DRE_DFC(ModuloContratoIndicadorEnum.FINANCEIRO),
  CONTROLE_VENDAS_PRAZO( ModuloContratoIndicadorEnum.FINANCEIRO),

  EMISSAO_NFE(ModuloContratoIndicadorEnum.FISCAL),
  EMISSAO_NFSE(ModuloContratoIndicadorEnum.FISCAL),
  LANCAMENTO_NFE(ModuloContratoIndicadorEnum.FISCAL),

  MODULO_ESTOQUE(ModuloContratoIndicadorEnum.ESTOQUE),
  CONTROLE_MULTIPLOS_LOCAIS(ModuloContratoIndicadorEnum.ESTOQUE),

  CONTROLE_OBSERVACOES(ModuloContratoIndicadorEnum.PRODUTO),
  CONTROLE_PROMOCAO(ModuloContratoIndicadorEnum.PRODUTO),
  CONTROLE_PACOTES(ModuloContratoIndicadorEnum.PRODUTO),
  CONTROLE_TABELA_PRECO(ModuloContratoIndicadorEnum.PRODUTO),
  CONTROLE_GERADOR_ETIQUETA(ModuloContratoIndicadorEnum.PRODUTO),
  CONTROLE_VARIACOES(ModuloContratoIndicadorEnum.PRODUTO),

  MODULO_VENDA_AUTOATENDIMENTO(ModuloContratoIndicadorEnum.MODULO_VENDA),
  MODULO_VENDA_BALCAO(ModuloContratoIndicadorEnum.MODULO_VENDA),
  MODULO_VENDA_MESA(ModuloContratoIndicadorEnum.MODULO_VENDA),
  MODULO_VENDA_FICHA(ModuloContratoIndicadorEnum.MODULO_VENDA),
  MODULO_VENDA_DELIVERY(ModuloContratoIndicadorEnum.MODULO_VENDA),
  MODULO_VENDA_DRIVE_THRU(ModuloContratoIndicadorEnum.MODULO_VENDA),
  MODULO_VENDA_PUB(ModuloContratoIndicadorEnum.MODULO_VENDA),

  SERVICO_IMPRESSAO(ModuloContratoIndicadorEnum.SERVICO_APLICACOES),
  SERVICO_WAYCHEF_DESKTOP(ModuloContratoIndicadorEnum.SERVICO_APLICACOES),
  SERVICO_WAYCHEF_MOBILE(ModuloContratoIndicadorEnum.SERVICO_APLICACOES),
  SERVICO_ALFA_SYNC(ModuloContratoIndicadorEnum.SERVICO_APLICACOES),
  MODO_HIBRIDO(ModuloContratoIndicadorEnum.OUTROS),


  //Extras
  AUTO_PESAGEM(ModuloContratoIndicadorEnum.APLICATIVOS),
  AUTO_ATENDIMENTO(ModuloContratoIndicadorEnum.APLICATIVOS),
  WAYWALLET(ModuloContratoIndicadorEnum.APLICATIVOS),
  ARQUIVAR_XML_VENDA(ModuloContratoIndicadorEnum.OUTROS),
  CONCENTRADOR(ModuloContratoIndicadorEnum.OUTROS),
  DASHBOARD_WEB(ModuloContratoIndicadorEnum.OUTROS),
  EMISSAO_FISCAL(ModuloContratoIndicadorEnum.OUTROS),
  SESSAO_EXTRA(ModuloContratoIndicadorEnum.OUTROS),

  //integracao
  IFOOD(ModuloContratoIndicadorEnum.INTEGRACAO),
  QUEST(ModuloContratoIndicadorEnum.INTEGRACAO),
  TRACKAPP(ModuloContratoIndicadorEnum.INTEGRACAO),
  WAYMENU(ModuloContratoIndicadorEnum.INTEGRACAO),
  WABIZ(ModuloContratoIndicadorEnum.INTEGRACAO),
  CATRACA(ModuloContratoIndicadorEnum.INTEGRACAO),
  EVEREST(ModuloContratoIndicadorEnum.INTEGRACAO),
  UNICID(ModuloContratoIndicadorEnum.INTEGRACAO),
  NAPP(ModuloContratoIndicadorEnum.INTEGRACAO),
  GIG(ModuloContratoIndicadorEnum.INTEGRACAO),

  //tipoSuporte
  SUPORTE_PREMIUM_PLANTAO(ModuloContratoIndicadorEnum.TIPO_SUPORTE),
  SUPORTE_PREMIUM(ModuloContratoIndicadorEnum.TIPO_SUPORTE),

  //tef
  CIELO_LIO(ModuloContratoIndicadorEnum.TEF),
  PAYGO(ModuloContratoIndicadorEnum.TEF),
  REDE(ModuloContratoIndicadorEnum.TEF),
  SITEF(ModuloContratoIndicadorEnum.TEF),
  ELGIN_PAY(ModuloContratoIndicadorEnum.TEF);

  const TipoitemContratoWaychefEnum(this.modulo);

  // final String descricao;
  final ModuloContratoIndicadorEnum modulo;


}
