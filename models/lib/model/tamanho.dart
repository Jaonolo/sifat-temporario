part of openapi.api;

class Tamanho {

  int? id;

  int? idEmpresa;

  int? codigo;

  String? descricao;

  int? indice;

  int? getId;

  int? versao;

  Tamanho();

  @override
  String toString() {
    return 'Tamanho[id=$id, idEmpresa=$idEmpresa, codigo=$codigo, descricao=$descricao, indice=$indice, getId=$getId, versao=$versao, ]';
  }

  Tamanho.fromJson(Map<String, dynamic>? json) {
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
    if (json['indice'] == null) {
      indice = null;
    } else {
      indice = json['indice'];
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
    if (codigo != null)
      json['codigo'] = codigo;
    if (descricao != null)
      json['descricao'] = descricao;
    if (indice != null)
      json['indice'] = indice;
    if (getId != null)
      json['get_id'] = getId;
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<Tamanho> listFromJson(List<dynamic> json) {
    return json.map((value) => Tamanho.fromJson(value)).toList();
  }

  static Map<String, Tamanho> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Tamanho>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Tamanho.fromJson(value));
    }
    return map;
  }
}

