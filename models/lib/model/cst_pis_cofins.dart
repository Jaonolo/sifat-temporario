part of openapi.api;

class CstPisCofins {

  String? codigo;

  String? descricao;

  CstPisCofins();

  @override
  String toString() {
    return 'CstPisCofins[codigo=$codigo, descricao=$descricao, ]';
  }

  CstPisCofins.fromJson(Map<String, dynamic>? json) {
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
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (codigo != null)
      json['codigo'] = codigo;
    if (descricao != null)
      json['descricao'] = descricao;
    return json;
  }

  static List<CstPisCofins> listFromJson(List<dynamic> json) {
    return json.map((value) => CstPisCofins.fromJson(value)).toList();
  }

  static Map<String, CstPisCofins> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CstPisCofins>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CstPisCofins.fromJson(value));
    }
    return map;
  }
}

