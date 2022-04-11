part of openapi.api;

class DocumentoFiscal {

  int? id;

  String? descricao;

  String? sigla;

  String? modelo;

  DocumentoFiscal();

  @override
  String toString() {
    return 'DocumentoFiscal[id=$id, descricao=$descricao, sigla=$sigla, modelo=$modelo, ]';
  }

  DocumentoFiscal.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
    if (json['sigla'] == null) {
      sigla = null;
    } else {
      sigla = json['sigla'];
    }
    if (json['modelo'] == null) {
      modelo = null;
    } else {
      modelo = json['modelo'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (descricao != null)
      json['descricao'] = descricao;
    if (sigla != null)
      json['sigla'] = sigla;
    if (modelo != null)
      json['modelo'] = modelo;
    return json;
  }

  static List<DocumentoFiscal> listFromJson(List<dynamic> json) {
    return json.map((value) => DocumentoFiscal.fromJson(value)).toList();
  }

  static Map<String, DocumentoFiscal> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, DocumentoFiscal>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = DocumentoFiscal.fromJson(value));
    }
    return map;
  }
}

