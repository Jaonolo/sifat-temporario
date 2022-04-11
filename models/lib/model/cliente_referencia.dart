part of openapi.api;

class ClienteReferencia {

  ClienteReferenciaPK? id;

  Pessoa? pessoa;

  String? tipo;

  //enum tipoEnum {  COMERCIAL,  PESSOAL,  };{

  String? observacao;

  int? versao;

  ClienteReferencia();

  @override
  String toString() {
    return 'ClienteReferencia[id=$id, pessoa=$pessoa, tipo=$tipo, observacao=$observacao, versao=$versao, ]';
  }

  ClienteReferencia.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = ClienteReferenciaPK.fromJson(json['id']);
    }
    if (json['pessoa'] == null) {
      pessoa = null;
    } else {
      pessoa = Pessoa.fromJson(json['pessoa']);
    }
    if (json['tipo'] == null) {
      tipo = null;
    } else {
      tipo = json['tipo'];
    }
    if (json['observacao'] == null) {
      observacao = null;
    } else {
      observacao = json['observacao'];
    }
    if (json['versao'] == null) {
      versao = null;
    } else {
      versao = json['versao'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (pessoa != null)
      json['pessoa'] = pessoa;
    if (tipo != null)
      json['tipo'] = tipo;
    if (observacao != null)
      json['observacao'] = observacao;
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<ClienteReferencia> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteReferencia.fromJson(value)).toList();
  }

  static Map<String, ClienteReferencia> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ClienteReferencia>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteReferencia.fromJson(value));
    }
    return map;
  }
}

