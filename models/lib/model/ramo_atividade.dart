part of openapi.api;

class RamoAtividade {

  int? id;

  int? idEmpresa;

  String? descricao;

  String? cnae;

  int? versao;

  RamoAtividade();

  @override
  String toString() {
    return 'RamoAtividade[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, cnae=$cnae, versao=$versao, ]';
  }

  RamoAtividade.fromJson(Map<String, dynamic>? json) {
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
    if (json['cnae'] == null) {
      cnae = null;
    } else {
      cnae = json['cnae'];
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
    if (cnae != null)
      json['cnae'] = cnae;
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<RamoAtividade> listFromJson(List<dynamic> json) {
    return json.map((value) => RamoAtividade.fromJson(value)).toList();
  }

  static Map<String, RamoAtividade> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, RamoAtividade>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = RamoAtividade.fromJson(value));
    }
    return map;
  }
}

