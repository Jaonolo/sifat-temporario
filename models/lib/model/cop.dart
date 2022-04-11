part of openapi.api;

class COP {

  int? id;

  int? idEmpresa;

  String? tipoMovimento;

  //enum tipoMovimentoEnum {  ENTRADA,  AQUISICAO,  SAIDA,  PRESTACAO,  };{

  String? tipoLancamento;

  //enum tipoLancamentoEnum {  SIMPLES,  COMPLETO,  };{

  String? classificacao;

  //enum classificacaoEnum {  COMPRA,  VENDA,  TRANSFERENCIA,  DEVOLUCAO,  RETORNO,  REMESSA,  ANULACAO_VALOR,  SERVICO,  OUTRO,  };{

  String? local;

  //enum localEnum {  ESTADUAL,  INTERESTADUAL,  EXTERIOR,  };{

  int? operacaoRaiz;

  int? operacaoDetalhe;

  int? operacaoVariacao;

  String? descricaoResumida;

  String? descricaoCompleta;

  DocumentoFiscal? documentoFiscal;

  bool? movimentaEstoque;

  bool? movimentaFinanceiro;

  bool? atualizaCustos;

  bool? ativo;

  COP();

  @override
  String toString() {
    return 'COP[id=$id, idEmpresa=$idEmpresa, tipoMovimento=$tipoMovimento, tipoLancamento=$tipoLancamento, classificacao=$classificacao, local=$local, operacaoRaiz=$operacaoRaiz, operacaoDetalhe=$operacaoDetalhe, operacaoVariacao=$operacaoVariacao, descricaoResumida=$descricaoResumida, descricaoCompleta=$descricaoCompleta, documentoFiscal=$documentoFiscal, movimentaEstoque=$movimentaEstoque, movimentaFinanceiro=$movimentaFinanceiro, atualizaCustos=$atualizaCustos, ativo=$ativo, ]';
  }

  COP.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
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
    if (json['tipoMovimento'] == null) {
      tipoMovimento = null;
    } else {
      tipoMovimento = json['tipoMovimento'];
    }
    if (json['tipoLancamento'] == null) {
      tipoLancamento = null;
    } else {
      tipoLancamento = json['tipoLancamento'];
    }
    if (json['classificacao'] == null) {
      classificacao = null;
    } else {
      classificacao = json['classificacao'];
    }
    if (json['local'] == null) {
      local = null;
    } else {
      local = json['local'];
    }
    if (json['operacaoRaiz'] == null) {
      operacaoRaiz = null;
    } else {
      operacaoRaiz = json['operacaoRaiz'];
    }
    if (json['operacaoDetalhe'] == null) {
      operacaoDetalhe = null;
    } else {
      operacaoDetalhe = json['operacaoDetalhe'];
    }
    if (json['operacaoVariacao'] == null) {
      operacaoVariacao = null;
    } else {
      operacaoVariacao = json['operacaoVariacao'];
    }
    if (json['descricaoResumida'] == null) {
      descricaoResumida = null;
    } else {
      descricaoResumida = json['descricaoResumida'];
    }
    if (json['descricaoCompleta'] == null) {
      descricaoCompleta = null;
    } else {
      descricaoCompleta = json['descricaoCompleta'];
    }
    if (json['documentoFiscal'] == null) {
      documentoFiscal = null;
    } else {
      documentoFiscal = DocumentoFiscal.fromJson(json['documentoFiscal']);
    }
    if (json['movimentaEstoque'] == null) {
      movimentaEstoque = null;
    } else {
      movimentaEstoque = json['movimentaEstoque'];
    }
    if (json['movimentaFinanceiro'] == null) {
      movimentaFinanceiro = null;
    } else {
      movimentaFinanceiro = json['movimentaFinanceiro'];
    }
    if (json['atualizaCustos'] == null) {
      atualizaCustos = null;
    } else {
      atualizaCustos = json['atualizaCustos'];
    }
    if (json['ativo'] == null) {
      ativo = null;
    } else {
      ativo = json['ativo'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (tipoMovimento != null)
      json['tipoMovimento'] = tipoMovimento;
    if (tipoLancamento != null)
      json['tipoLancamento'] = tipoLancamento;
    if (classificacao != null)
      json['classificacao'] = classificacao;
    if (local != null)
      json['local'] = local;
    if (operacaoRaiz != null)
      json['operacaoRaiz'] = operacaoRaiz;
    if (operacaoDetalhe != null)
      json['operacaoDetalhe'] = operacaoDetalhe;
    if (operacaoVariacao != null)
      json['operacaoVariacao'] = operacaoVariacao;
    if (descricaoResumida != null)
      json['descricaoResumida'] = descricaoResumida;
    if (descricaoCompleta != null)
      json['descricaoCompleta'] = descricaoCompleta;
    if (documentoFiscal != null)
      json['documentoFiscal'] = documentoFiscal;
    if (movimentaEstoque != null)
      json['movimentaEstoque'] = movimentaEstoque;
    if (movimentaFinanceiro != null)
      json['movimentaFinanceiro'] = movimentaFinanceiro;
    if (atualizaCustos != null)
      json['atualizaCustos'] = atualizaCustos;
    if (ativo != null)
      json['ativo'] = ativo;
    return json;
  }

  static List<COP> listFromJson(List<dynamic> json) {
    return json.map((value) => COP.fromJson(value)).toList();
  }

  static Map<String, COP> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, COP>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = COP.fromJson(value));
    }
    return map;
  }
}

