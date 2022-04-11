part of openapi.api;

class ContaContabil {

  int? id;

  Empresa? empresa;

  int? versao;

  ContaContabil();

  @override
  String toString() {
    return 'ContaContabil[id=$id, empresa=$empresa, versao=$versao, ]';
  }

  ContaContabil.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['empresa'] == null) {
      empresa = null;
    } else {
      empresa = Empresa.fromJson(json['empresa']);
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
    if (empresa != null)
      json['empresa'] = empresa;
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<ContaContabil> listFromJson(List<dynamic> json) {
    return json.map((value) => ContaContabil.fromJson(value)).toList();
  }

  static Map<String, ContaContabil> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ContaContabil>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ContaContabil.fromJson(value));
    }
    return map;
  }
}

