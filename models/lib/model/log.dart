part of openapi.api;

class Log {

  int? id;

  String? tipoLog;

  //enum tipoLogEnum {  INFORMACAO,  ALERTA,  ERRO,  };{

  int? idEmpresa;

  String? mensagem;

  String? descricao;

  String? origemLog;

  //enum origemLogEnum {  ERP,  API,  ALFA_SYNC,  WAYCHEF,  WAYCHEF_MOBILE,  };{

  DateTime? data;

  bool? verificado;

  String? stackTrace;

  String? idExterno;

  String? entidade;

  //enum entidadeEnum {  AJUSTE_ESTOQUE,  ALFA_SYNC,  AUXILIAR_PRODUCAO,  BANCO,  CONTA_CORRENTE,  PLANO_CONTA,  CENTRO_CUSTO,  MOVIMENTACAO_CAIXA,  CARDAPIO,  CARDAPIO_MENU,  CEST,  CFOP,  CLASSIFICACAO_PESSOA,  CLIENT,  CLIENTE,  LOJISTA,  CLIENTE_REFERENCIA,  CLIENT_EMPRESA,  CONDICAO_PAGAMENTO,  CONJUGE,  CONSULTA_AJUSTE_ESTOQUE,  CONSULTA_VENDA,  CONSUMO_MAPA,  CONTABILISTA,  COP,  CSOSN_ICMS,  CST_ICMS,  CST_PIS_COFINS,  DRIVER_IMPRESSORA,  EMISSOR_FISCAL,  EMITENTE_CHEQUE,  EMPRESA,  CONFIGURACAO_EMPRESA,  ENDERECO,  EQUIPAMENTO_IMPRESSAO,  ESPECIE_TITULO,  ESTACAO_TRABALHO,  EVENTO,  FAMILIA_PRECO,  FINALIZADORA,  BANDEIRA_CARTAO,  FORNECEDOR,  FORNECEDOR_CONTATO,  FOX_CONSUMO,  FUNCIONARIO,  GERENCIADOR,  GRUPO_ESTACAO,  GRUPO_USUARIO,  HISTORICO_ESTOQUE,  IBPT,  ICMS,  LAYOUT_CONFERENCIA,  LOCAL_ESTOCADO,  LOCAL_PRODUCAO,  MODULO,  MOTIVO_CANCELAMENTO,  MOVIMENTO,  NCM,  NOTA,  NOTA_DADOS_INTEGRADOR,  NOTA_PENDENCIA,  NOTA_ITEM,  OPERACAO_CAIXA,  ORIGEM_MERCADORIA,  PERFIL_CARTAO,  PESSOA,  PIS_COFINS,  PRODUTO,  PRODUTO_COR,  PRODUTO_EMPRESA,  PRODUTO_GRADE,  PRODUTO_GRADE_EMPRESA,  PRODUTO_GRUPO,  PRODUTO_ICMS,  PRODUTO_MARCA,  PRODUTO_MENU,  PRODUTO_MENU_VINCULO,  PRODUTO_OBSERVACAO,  PRODUTO_PISCOFINS,  PRODUTO_TAMANHO,  FICHA_TECNICA,  PROMOCAO,  RAMO_ATIVIDADE,  REGIAO,  REPRESENTANTE,  SERVICO,  SERVICO_FOURALL,  SERVICO_IFOOD,  SERVICO_IMPRESSAO,  SETOR,  STATUS_CREDITO,  TABELA_PRECO,  TELEFONE,  TURNO,  USER,  USUARIO_EMPRESA,  CONFIGURACAO,  SINCRONISMO,  TUTORIAL,  IFOOD_FORMA_PAGAMENTO,  LOG,  ALFA_SYNC_ACAO,  };{
  Log();

  @override
  String toString() {
    return 'Log[id=$id, tipoLog=$tipoLog, idEmpresa=$idEmpresa, mensagem=$mensagem, descricao=$descricao, origemLog=$origemLog, data=$data, verificado=$verificado, stackTrace=$stackTrace, json=$json, idExterno=$idExterno, entidade=$entidade, ]';
  }

  Log.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['tipoLog'] == null) {
      tipoLog = null;
    } else {
      tipoLog = json['tipoLog'];
    }
    if (json['idEmpresa'] == null) {
      idEmpresa = null;
    } else {
      idEmpresa = json['idEmpresa'];
    }
    if (json['mensagem'] == null) {
      mensagem = null;
    } else {
      mensagem = json['mensagem'];
    }
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
    if (json['origemLog'] == null) {
      origemLog = null;
    } else {
      origemLog = json['origemLog'];
    }
    if (json['data'] == null) {
      data = null;
    } else {
      data = DateTime.parse(json['data']);
    }
    if (json['verificado'] == null) {
      verificado = null;
    } else {
      verificado = json['verificado'];
    }
    if (json['stackTrace'] == null) {
      stackTrace = null;
    } else {
      stackTrace = json['stackTrace'];
    }
    if (json['idExterno'] == null) {
      idExterno = null;
    } else {
      idExterno = json['idExterno'];
    }
    if (json['entidade'] == null) {
      entidade = null;
    } else {
      entidade = json['entidade'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (tipoLog != null)
      json['tipoLog'] = tipoLog;
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (mensagem != null)
      json['mensagem'] = mensagem;
    if (descricao != null)
      json['descricao'] = descricao;
    if (origemLog != null)
      json['origemLog'] = origemLog;
    if (data != null)
      json['data'] = data == null ? null : data!.toIso8601String();
    if (verificado != null)
      json['verificado'] = verificado;
    if (stackTrace != null)
      json['stackTrace'] = stackTrace;
    if (idExterno != null)
      json['idExterno'] = idExterno;
    if (entidade != null)
      json['entidade'] = entidade;
    return json;
  }

  static List<Log> listFromJson(List<dynamic> json) {
    return json.map((value) => Log.fromJson(value)).toList();
  }

  static Map<String, Log> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Log>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Log.fromJson(value));
    }
    return map;
  }
}

