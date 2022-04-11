part of openapi.api;

class Cest {

  String? codigo;

  String? descricao;

  Cest();

  @override
  String toString() {
    return 'Cest[codigo=$codigo, descricao=$descricao, ]';
  }

  Cest.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['codigo'] == null) {
      codigo = null;
    } else {
      codigo = json['codigo'];
    }
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (codigo != null) {
      json['codigo'] = codigo;
    }
    if (descricao != null) {
      json['descricao'] = descricao;
    }
    return json;
  }

  static List<Cest> listFromJson(List<dynamic> json) {
    return json.map((value) => Cest.fromJson(value)).toList();
  }

  static Map<String, Cest> mapFromJson(Map<String, dynamic> json) {
    Map<String, Cest> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Cest.fromJson(value));
    }
    return map;
  }
}

