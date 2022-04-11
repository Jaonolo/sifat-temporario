part of openapi.api;

class Ncm {

  String? codigo;

  String? descricao;

  DateTime? inicioVigencia;

  DateTime? fimVigencia;

  String? unidadeTributaria;

  String? descricaoUnidadeTributaria;

  Ncm();

  @override
  String toString() {
    return 'Ncm[codigo=$codigo, descricao=$descricao, inicioVigencia=$inicioVigencia, fimVigencia=$fimVigencia, unidadeTributaria=$unidadeTributaria, descricaoUnidadeTributaria=$descricaoUnidadeTributaria, ]';
  }

  Ncm.fromJson(Map<String, dynamic>? json) {
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
    if (json['inicioVigencia'] == null) {
      inicioVigencia = null;
    } else {
      inicioVigencia = DateTime.parse(json['inicioVigencia']);
    }
    if (json['fimVigencia'] == null) {
      fimVigencia = null;
    } else {
      fimVigencia = DateTime.parse(json['fimVigencia']);
    }
    if (json['unidadeTributaria'] == null) {
      unidadeTributaria = null;
    } else {
      unidadeTributaria = json['unidadeTributaria'];
    }
    if (json['descricaoUnidadeTributaria'] == null) {
      descricaoUnidadeTributaria = null;
    } else {
      descricaoUnidadeTributaria = json['descricaoUnidadeTributaria'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (codigo != null)
      json['codigo'] = codigo;
    if (descricao != null)
      json['descricao'] = descricao;
    if (inicioVigencia != null)
      json['inicioVigencia'] =
      inicioVigencia == null ? null : inicioVigencia!.toIso8601String();
    if (fimVigencia != null)
      json['fimVigencia'] =
      fimVigencia == null ? null : fimVigencia!.toIso8601String();
    if (unidadeTributaria != null)
      json['unidadeTributaria'] = unidadeTributaria;
    if (descricaoUnidadeTributaria != null)
      json['descricaoUnidadeTributaria'] = descricaoUnidadeTributaria;
    return json;
  }

  static List<Ncm> listFromJson(List<dynamic> json) {
    return json.map((value) => Ncm.fromJson(value)).toList();
  }

  static Map<String, Ncm> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Ncm>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Ncm.fromJson(value));
    }
    return map;
  }
}

