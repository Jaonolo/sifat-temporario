part of openapi.api;

enum ModuloContratoIndicadorEnum {

  FINANCEIRO(descricao: 'Financeiro'),
  FISCAL(descricao: 'Fiscal'),
  ESTOQUE(descricao: 'Estoque'),
  PRODUTO(descricao: 'Produto'),
  MODULO_VENDA(descricao: 'Módulos de Venda'),
  SERVICO_APLICACOES(descricao: 'Serviços/Aplicações'),
  OUTROS(descricao: 'Outros'),

  //EXTRAS
  TEF(descricao: 'TEF'),
  TIPO_SUPORTE(descricao: 'Tipo suporte'),
  INTEGRACAO(descricao: 'Integração'),
  APLICATIVOS(descricao: 'Aplicativos');

  const ModuloContratoIndicadorEnum({required this.descricao});
  final String descricao;
}