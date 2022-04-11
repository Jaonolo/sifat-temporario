part of openapi.api;

class Colecao {

  int? id;

  int? idEmpresa;

  String? descricao;

  String? ano;

  Colecao();

  @override
  String toString() {
    return 'Colecao[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, ano=$ano, ]';
  }

  Colecao.fromJson(Map<String, dynamic>? json) {
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
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
    if (json['ano'] == null) {
      ano = null;
    } else {
      ano = json['ano'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (descricao != null)
      json['descricao'] = descricao;
    if (ano != null)
      json['ano'] = ano;
    return json;
  }

  static List<Colecao> listFromJson(List<dynamic> json) {
    return json.map((value) => Colecao.fromJson(value)).toList();
  }

  static Map<String, Colecao> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Colecao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Colecao.fromJson(value));
    }
    return map;
  }
}

