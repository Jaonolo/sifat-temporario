part of openapi.api;

class FornecedorVinculo {

  CondicaoPagamento? condicaoPagamento;

  ContaContabil? contaContabil;

  int? prazoEntrega;

  int? prazoPagamento;

  FornecedorVinculo();

  @override
  String toString() {
    return 'FornecedorVinculo[condicaoPagamento=$condicaoPagamento, contaContabil=$contaContabil, prazoEntrega=$prazoEntrega, prazoPagamento=$prazoPagamento, ]';
  }

  FornecedorVinculo.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['condicaoPagamento'] == null) {
      condicaoPagamento = null;
    } else {
      condicaoPagamento = CondicaoPagamento.fromJson(json['condicaoPagamento']);
    }
    if (json['contaContabil'] == null) {
      contaContabil = null;
    } else {
      contaContabil = ContaContabil.fromJson(json['contaContabil']);
    }
    if (json['prazoEntrega'] == null) {
      prazoEntrega = null;
    } else {
      prazoEntrega = json['prazoEntrega'];
    }
    if (json['prazoPagamento'] == null) {
      prazoPagamento = null;
    } else {
      prazoPagamento = json['prazoPagamento'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (condicaoPagamento != null)
      json['condicaoPagamento'] = condicaoPagamento;
    if (contaContabil != null)
      json['contaContabil'] = contaContabil;
    if (prazoEntrega != null)
      json['prazoEntrega'] = prazoEntrega;
    if (prazoPagamento != null)
      json['prazoPagamento'] = prazoPagamento;
    return json;
  }

  static List<FornecedorVinculo> listFromJson(List<dynamic> json) {
    return json.map((value) => FornecedorVinculo.fromJson(value)).toList();
  }

  static Map<String, FornecedorVinculo> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, FornecedorVinculo>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = FornecedorVinculo.fromJson(value));
    }
    return map;
  }
}

