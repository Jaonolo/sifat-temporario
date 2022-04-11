part of openapi.api;

class LocalProducao {

  int? id;

  int? idEmpresa;

  String? descricao;

  int? getId;

  int? versao;

  LocalProducao();

  @override
  String toString() {
    return 'LocalProducao[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, getId=$getId, versao=$versao, ]';
  }

  LocalProducao.fromJson(Map<String, dynamic>? json) {
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
    if (json['get_id'] == null) {
      getId = null;
    } else {
      getId = json['get_id'];
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
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (descricao != null)
      json['descricao'] = descricao;
    if (getId != null)
      json['get_id'] = getId;
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<LocalProducao> listFromJson(List<dynamic> json) {
    return json.map((value) => LocalProducao.fromJson(value)).toList();
  }

  static Map<String, LocalProducao> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, LocalProducao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = LocalProducao.fromJson(value));
    }
    return map;
  }
}

