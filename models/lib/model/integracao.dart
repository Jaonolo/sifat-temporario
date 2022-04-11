part of openapi.api;

class Integracao {

  int? id;

  int? idEmpresa;

  String? operacao;

  //enum operacaoEnum {  Inserido,  Atualizado,  Removido,  };{

  String? entidade;

  //enum entidadeEnum {  AJUSTE_ESTOQUE,  ALFA_SYNC,  AUXILIAR_PRODUCAO,  BANCO,  CARDAPIO,  CARDAPIO_MENU,  CEST,  CFOP,  CLASSIFICACAO_PESSOA,  CLIENT,  CLIENTE,  CLIENTE_REFERENCIA,  CLIENT_EMPRESA,  CONDICAO_PAGAMENTO,  CONJUGE,  CONSULTA_AJUSTE_ESTOQUE,  CONSULTA_VENDA,  CONSUMO_MAPA,  CONTABILISTA,  COP,  CSOSN_ICMS,  CST_ICMS,  CST_PIS_COFINS,  DRIVER_IMPRESSORA,  EMISSOR_FISCAL,  EMITENTE_CHEQUE,  EMPRESA,  ENDERECO,  EQUIPAMENTO_IMPRESSAO,  ESPECIE_TITULO,  ESTACAO_TRABALHO,  EVENTO,  FAMILIA_PRECO,  FINALIZADORA,  FORNECEDOR,  FORNECEDOR_CONTATO,  FOX_CONSUMO,  FUNCIONARIO,  GERENCIADOR,  GRUPO_ESTACAO,  GRUPO_USUARIO,  HISTORICO_ESTOQUE,  IBPT,  ICMS,  LAYOUT_CONFERENCIA,  LOCAL_ESTOCADO,  LOCAL_PRODUCAO,  MODULO,  MOTIVO_CANCELAMENTO,  MOVIMENTO,  NCM,  NOTA,  NOTA_ITEM,  OPERACAO_CAIXA,  ORIGEM_MERCADORIA,  PERFIL_CARTAO,  PESSOA,  PIS_COFINS,  PRODUTO,  PRODUTO_COR,  PRODUTO_EMPRESA,  PRODUTO_GRADE,  PRODUTO_GRADE_EMPRESA,  PRODUTO_GRUPO,  PRODUTO_ICMS,  PRODUTO_MARCA,  PRODUTO_MENU,  PRODUTO_OBSERVACAO,  PRODUTO_PISCOFINS,  PRODUTO_TAMANHO,  PROMOCAO,  RAMO_ATIVIDADE,  REGIAO,  REPRESENTANTE,  SERVICO,  SERVICO_FOURALL,  SERVICO_IFOOD,  SERVICO_IMPRESSAO,  SETOR,  STATUS_CREDITO,  TABELA_PRECO,  TELEFONE,  TURNO,  USER,  USUARIO_EMPRESA,  };{

  int? idEntidade;

  DateTime? data;

  bool? ignorar;

  Integracao();

  @override
  String toString() {
    return 'Integracao[id=$id, idEmpresa=$idEmpresa, operacao=$operacao, entidade=$entidade, idEntidade=$idEntidade, data=$data, ignorar=$ignorar, ]';
  }

  Integracao.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idEmpresa'] == null) {
      idEmpresa = null;
    } else {
      idEmpresa = json['idEmpresa'];
    }
    if (json['operacao'] == null) {
      operacao = null;
    } else {
      operacao = json['operacao'];
    }
    if (json['entidade'] == null) {
      entidade = null;
    } else {
      entidade = json['entidade'];
    }
    if (json['idEntidade'] == null) {
      idEntidade = null;
    } else {
      idEntidade = json['idEntidade'];
    }
    if (json['data'] == null) {
      data = null;
    } else {
      data = DateTime.parse(json['data']);
    }
    if (json['ignorar'] == null) {
      ignorar = null;
    } else {
      ignorar = json['ignorar'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (operacao != null)
      json['operacao'] = operacao;
    if (entidade != null)
      json['entidade'] = entidade;
    if (idEntidade != null)
      json['idEntidade'] = idEntidade;
    if (data != null)
      json['data'] = data == null ? null : data!.toIso8601String();
    if (ignorar != null)
      json['ignorar'] = ignorar;
    return json;
  }

  static List<Integracao> listFromJson(List<dynamic> json) {
    return json.map((value) => Integracao.fromJson(value)).toList();
  }

  static Map<String, Integracao> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Integracao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Integracao.fromJson(value));
    }
    return map;
  }
}

