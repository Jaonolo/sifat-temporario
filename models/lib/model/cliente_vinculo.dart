part of openapi.api;

class ClienteVinculo {

  Funcionario? vendedor;

  bool? fixarTabelaPreco;

  TabelaPreco? tabelaPreco;

  CondicaoPagamento? condicaoPagamento;

  ProgramaFidelidade? programaFidelidade;

  ContaContabil? contaContabil;

  Fornecedor? transportador;

  DateTime? dataProgramaFidelidade;

  String? desoneracaoIcms;

  //enum desoneracaoIcmsEnum {  NAO,  PRODUTOR_AGROPECUARIO,  ORGAO_PUBLICO_ESTADUAL,  };{
  ClienteVinculo();

  @override
  String toString() {
    return 'ClienteVinculo[vendedor=$vendedor, fixarTabelaPreco=$fixarTabelaPreco, tabelaPreco=$tabelaPreco, condicaoPagamento=$condicaoPagamento, programaFidelidade=$programaFidelidade, contaContabil=$contaContabil, transportador=$transportador, dataProgramaFidelidade=$dataProgramaFidelidade, desoneracaoIcms=$desoneracaoIcms, ]';
  }

  ClienteVinculo.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['vendedor'] == null) {
      vendedor = null;
    } else {
      vendedor = Funcionario.fromJson(json['vendedor']);
    }
    if (json['fixarTabelaPreco'] == null) {
      fixarTabelaPreco = null;
    } else {
      fixarTabelaPreco = json['fixarTabelaPreco'];
    }
    if (json['tabelaPreco'] == null) {
      tabelaPreco = null;
    } else {
      tabelaPreco = TabelaPreco.fromJson(json['tabelaPreco']);
    }
    if (json['condicaoPagamento'] == null) {
      condicaoPagamento = null;
    } else {
      condicaoPagamento = CondicaoPagamento.fromJson(json['condicaoPagamento']);
    }
    if (json['programaFidelidade'] == null) {
      programaFidelidade = null;
    } else {
      programaFidelidade =
          ProgramaFidelidade.fromJson(json['programaFidelidade']);
    }
    if (json['contaContabil'] == null) {
      contaContabil = null;
    } else {
      contaContabil = ContaContabil.fromJson(json['contaContabil']);
    }
    if (json['transportador'] == null) {
      transportador = null;
    } else {
      transportador = Fornecedor.fromJson(json['transportador']);
    }
    if (json['dataProgramaFidelidade'] == null) {
      dataProgramaFidelidade = null;
    } else {
      dataProgramaFidelidade = DateTime.parse(json['dataProgramaFidelidade']);
    }
    if (json['desoneracaoIcms'] == null) {
      desoneracaoIcms = null;
    } else {
      desoneracaoIcms = json['desoneracaoIcms'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (vendedor != null)
      json['vendedor'] = vendedor;
    if (fixarTabelaPreco != null)
      json['fixarTabelaPreco'] = fixarTabelaPreco;
    if (tabelaPreco != null)
      json['tabelaPreco'] = tabelaPreco;
    if (condicaoPagamento != null)
      json['condicaoPagamento'] = condicaoPagamento;
    if (programaFidelidade != null)
      json['programaFidelidade'] = programaFidelidade;
    if (contaContabil != null)
      json['contaContabil'] = contaContabil;
    if (transportador != null)
      json['transportador'] = transportador;
    if (dataProgramaFidelidade != null)
      json['dataProgramaFidelidade'] =
      dataProgramaFidelidade == null ? null : dataProgramaFidelidade!
          .toIso8601String();
    if (desoneracaoIcms != null)
      json['desoneracaoIcms'] = desoneracaoIcms;
    return json;
  }

  static List<ClienteVinculo> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteVinculo.fromJson(value)).toList();
  }

  static Map<String, ClienteVinculo> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ClienteVinculo>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteVinculo.fromJson(value));
    }
    return map;
  }
}

