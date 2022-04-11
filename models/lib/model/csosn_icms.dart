part of openapi.api;

class CsosnIcms {

  int? codigo;

  String? descricao;

  String? observacao;

  bool? substituicaoTributaria;

  CsosnIcms();

  @override
  String toString() {
    return 'CsosnIcms[codigo=$codigo, descricao=$descricao, observacao=$observacao, substituicaoTributaria=$substituicaoTributaria, ]';
  }

  CsosnIcms.fromJson(Map<String, dynamic>? json) {
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
    if (json['observacao'] == null) {
      observacao = null;
    } else {
      observacao = json['observacao'];
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
    if (observacao != null)
      json['observacao'] = observacao;
    if (substituicaoTributaria != null)
      json['substituicaoTributaria'] = substituicaoTributaria;
    return json;
  }

  static List<CsosnIcms> listFromJson(List<dynamic> json) {
    return json.map((value) => CsosnIcms.fromJson(value)).toList();
  }

  static Map<String, CsosnIcms> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CsosnIcms>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CsosnIcms.fromJson(value));
    }
    return map;
  }
}

