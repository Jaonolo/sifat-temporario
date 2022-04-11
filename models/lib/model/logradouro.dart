part of openapi.api;

class Logradouro {

  int? id;

  String? nome;

  String? nomeAbreviado;

  String? cep;

  Bairro? bairro;

  String? prefixo;

  bool? utilizaPrefixo;

  Logradouro();

  @override
  String toString() {
    return 'Logradouro[id=$id, nome=$nome, nomeAbreviado=$nomeAbreviado, cep=$cep, bairro=$bairro, prefixo=$prefixo, utilizaPrefixo=$utilizaPrefixo, ]';
  }

  Logradouro.fromJson(Map<String, dynamic>? json) {
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
    if (json['bairro'] == null) {
      bairro = null;
    } else {
      bairro = Bairro.fromJson(json['bairro']);
    }
    if (json['prefixo'] == null) {
      prefixo = null;
    } else {
      prefixo = json['prefixo'];
    }
    if (json['utilizaPrefixo'] == null) {
      utilizaPrefixo = null;
    } else {
      utilizaPrefixo = json['utilizaPrefixo'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (nome != null)
      json['nome'] = nome;
    if (nomeAbreviado != null)
      json['nomeAbreviado'] = nomeAbreviado;
    if (cep != null)
      json['cep'] = cep;
    if (bairro != null)
      json['bairro'] = bairro;
    if (prefixo != null)
      json['prefixo'] = prefixo;
    if (utilizaPrefixo != null)
      json['utilizaPrefixo'] = utilizaPrefixo;
    return json;
  }

  static List<Logradouro> listFromJson(List<dynamic> json) {
    return json.map((value) => Logradouro.fromJson(value)).toList();
  }

  static Map<String, Logradouro> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Logradouro>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Logradouro.fromJson(value));
    }
    return map;
  }
}

