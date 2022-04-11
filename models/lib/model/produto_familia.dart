part of openapi.api;

class ProdutoFamilia {

  int? id;

  int? idEmpresa;

  String? descricao;

  int? versao;

  ProdutoFamilia();

  @override
  String toString() {
    return 'ProdutoFamilia[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, versao=$versao, ]';
  }

  ProdutoFamilia.fromJson(Map<String, dynamic>? json) {
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
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<ProdutoFamilia> listFromJson(List<dynamic> json) {
    return json.map((value) => ProdutoFamilia.fromJson(value)).toList();
  }

  static Map<String, ProdutoFamilia> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ProdutoFamilia>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ProdutoFamilia.fromJson(value));
    }
    return map;
  }
}

