part of openapi.api;

class IncrementarContadorDto {

  String? entidade;

  //enum entidadeEnum {  AJUSTE_ESTOQUE,  ALFA_SYNC,  AUXILIAR_PRODUCAO,  BANCO,  CARDAPIO,  CARDAPIO_MENU,  CEST,  CFOP,  CLASSIFICACAO_PESSOA,  CLIENT,  CLIENTE,  CLIENTE_REFERENCIA,  CLIENT_EMPRESA,  CONDICAO_PAGAMENTO,  CONJUGE,  CONSULTA_AJUSTE_ESTOQUE,  CONSULTA_VENDA,  CONSUMO_MAPA,  CONTABILISTA,  COP,  CSOSN_ICMS,  CST_ICMS,  CST_PIS_COFINS,  DRIVER_IMPRESSORA,  EMISSOR_FISCAL,  EMITENTE_CHEQUE,  EMPRESA,  ENDERECO,  EQUIPAMENTO_IMPRESSAO,  ESPECIE_TITULO,  ESTACAO_TRABALHO,  EVENTO,  FAMILIA_PRECO,  FINALIZADORA,  FORNECEDOR,  FORNECEDOR_CONTATO,  FOX_CONSUMO,  FUNCIONARIO,  GERENCIADOR,  GRUPO_ESTACAO,  GRUPO_USUARIO,  HISTORICO_ESTOQUE,  IBPT,  ICMS,  LAYOUT_CONFERENCIA,  LOCAL_ESTOCADO,  LOCAL_PRODUCAO,  MODULO,  MOTIVO_CANCELAMENTO,  MOVIMENTO,  NCM,  NOTA,  NOTA_ITEM,  OPERACAO_CAIXA,  ORIGEM_MERCADORIA,  PERFIL_CARTAO,  PESSOA,  PIS_COFINS,  PRODUTO,  PRODUTO_COR,  PRODUTO_EMPRESA,  PRODUTO_GRADE,  PRODUTO_GRADE_EMPRESA,  PRODUTO_GRUPO,  PRODUTO_ICMS,  PRODUTO_MARCA,  PRODUTO_MENU,  PRODUTO_OBSERVACAO,  PRODUTO_PISCOFINS,  PRODUTO_TAMANHO,  PROMOCAO,  RAMO_ATIVIDADE,  REGIAO,  REPRESENTANTE,  SERVICO,  SERVICO_FOURALL,  SERVICO_IFOOD,  SERVICO_IMPRESSAO,  SETOR,  STATUS_CREDITO,  TABELA_PRECO,  TELEFONE,  TURNO,  USER,  USUARIO_EMPRESA,  };{

  int? id;

  IncrementarContadorDto();

  @override
  String toString() {
    return 'IncrementarContadorDto[entidade=$entidade, id=$id, ]';
  }

  IncrementarContadorDto.fromJson(Map<String, dynamic> json) {
    if (json['entidade'] == null) {
      entidade = null;
    } else {
      entidade = json['entidade'];
    }
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (entidade != null)
      json['entidade'] = entidade;
    if (id != null)
      json['id'] = id;
    return json;
  }

  static List<IncrementarContadorDto> listFromJson(List<dynamic> json) {
    return json.map((value) => IncrementarContadorDto.fromJson(value)).toList();
  }

  static Map<String, IncrementarContadorDto> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, IncrementarContadorDto>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = IncrementarContadorDto.fromJson(value));
    }
    return map;
  }
}

