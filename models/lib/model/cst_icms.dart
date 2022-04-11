part of openapi.api;

class CstIcms {

  String? codigo;

  String? descricao;

  bool? substituicaoTributaria;

  CstIcms();

  @override
  String toString() {
    return 'CstIcms[codigo=$codigo, descricao=$descricao, substituicaoTributaria=$substituicaoTributaria, ]';
  }

  CstIcms.fromJson(Map<String, dynamic>? json) {
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
    if (json['substituicaoTributaria'] == null) {
      substituicaoTributaria = null;
    } else {
      substituicaoTributaria = json['substituicaoTributaria'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (codigo != null)
      json['codigo'] = codigo;
    if (descricao != null)
      json['descricao'] = descricao;
    if (substituicaoTributaria != null)
      json['substituicaoTributaria'] = substituicaoTributaria;
    return json;
  }

  static List<CstIcms> listFromJson(List<dynamic> json) {
    return json.map((value) => CstIcms.fromJson(value)).toList();
  }

  static Map<String, CstIcms> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CstIcms>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CstIcms.fromJson(value));
    }
    return map;
  }
}

