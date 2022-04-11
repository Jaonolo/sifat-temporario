part of openapi.api;

class Cidade {

  int? id;

  String? nome;

  String? nomeAbreviado;

  String? cep;

  String? codigoIbge;

  int? situacao;

  String? tipo;

  Cidade? cidadePai;

  UnidadeFederativa? unidadeFederativa;

  Cidade();

  @override
  String toString() {
    return 'Cidade[id=$id, nome=$nome, nomeAbreviado=$nomeAbreviado, cep=$cep, codigoIbge=$codigoIbge, situacao=$situacao, tipo=$tipo, cidadePai=$cidadePai, unidadeFederativa=$unidadeFederativa, ]';
  }

  Cidade.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['nome'] == null) {
      nome = null;
    } else {
      nome = json['nome'];
    }
    if (json['nomeAbreviado'] == null) {
      nomeAbreviado = null;
    } else {
      nomeAbreviado = json['nomeAbreviado'];
    }
    if (json['cep'] == null) {
      cep = null;
    } else {
      cep = json['cep'];
    }
    if (json['codigoIbge'] == null) {
      codigoIbge = null;
    } else {
      codigoIbge = json['codigoIbge'];
    }
    if (json['situacao'] == null) {
      situacao = null;
    } else {
      situacao = json['situacao'];
    }
    if (json['tipo'] == null) {
      tipo = null;
    } else {
      tipo = json['tipo'];
    }
    if (json['cidadePai'] == null) {
      cidadePai = null;
    } else {
      cidadePai = Cidade.fromJson(json['cidadePai']);
    }
    if (json['unidadeFederativa'] == null) {
      unidadeFederativa = null;
    } else {
      unidadeFederativa = UnidadeFederativa.fromJson(json['unidadeFederativa']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null) {
      json['id'] = id;
    }
    if (nome != null) {
      json['nome'] = nome;
    }
    if (nomeAbreviado != null) {
      json['nomeAbreviado'] = nomeAbreviado;
    }
    if (cep != null) {
      json['cep'] = cep;
    }
    if (codigoIbge != null) {
      json['codigoIbge'] = codigoIbge;
    }
    if (situacao != null) {
      json['situacao'] = situacao;
    }
    if (tipo != null) {
      json['tipo'] = tipo;
    }
    if (cidadePai != null) {
      json['cidadePai'] = cidadePai;
    }
    if (unidadeFederativa != null) {
      json['unidadeFederativa'] = unidadeFederativa;
    }
    return json;
  }

  static List<Cidade> listFromJson(List<dynamic> json) {
    return json.map((value) => Cidade.fromJson(value)).toList();
  }

  static Map<String, Cidade> mapFromJson(Map<String, dynamic> json) {
    Map<String, Cidade> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Cidade.fromJson(value));
    }
    return map;
  }
}

