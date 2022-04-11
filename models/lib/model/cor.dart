part of openapi.api;

class Cor {

  int? id;

  int? idEmpresa;

  String? descricao;

  String? hexadecimal;

  int? indice;

  int? versao;

  Cor();

  @override
  String toString() {
    return 'Cor[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, hexadecimal=$hexadecimal, indice=$indice, versao=$versao, ]';
  }

  Cor.fromJson(Map<String, dynamic>? json) {
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
    if (json['hexadecimal'] == null) {
      hexadecimal = null;
    } else {
      hexadecimal = json['hexadecimal'];
    }
    if (json['indice'] == null) {
      indice = null;
    } else {
      indice = json['indice'];
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
    if (hexadecimal != null)
      json['hexadecimal'] = hexadecimal;
    if (indice != null)
      json['indice'] = indice;
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<Cor> listFromJson(List<dynamic> json) {
    return json.map((value) => Cor.fromJson(value)).toList();
  }

  static Map<String, Cor> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Cor>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Cor.fromJson(value));
    }
    return map;
  }
}

