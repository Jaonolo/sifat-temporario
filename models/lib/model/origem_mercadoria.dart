part of openapi.api;

class OrigemMercadoria {

  int? codigo;

  String? origemCompra;

  //enum origemCompraEnum {  NACIONAL,  IMPORTADA,  };{

  String? descricao;

  OrigemMercadoria();

  @override
  String toString() {
    return 'OrigemMercadoria[codigo=$codigo, origemCompra=$origemCompra, descricao=$descricao, ]';
  }

  OrigemMercadoria.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['codigo'] == null) {
      codigo = null;
    } else {
      codigo = json['codigo'];
    }
    if (json['origemCompra'] == null) {
      origemCompra = null;
    } else {
      origemCompra = json['origemCompra'];
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
    if (origemCompra != null)
      json['origemCompra'] = origemCompra;
    if (descricao != null)
      json['descricao'] = descricao;
    return json;
  }

  static List<OrigemMercadoria> listFromJson(List<dynamic> json) {
    return json.map((value) => OrigemMercadoria.fromJson(value)).toList();
  }

  static Map<String, OrigemMercadoria> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, OrigemMercadoria>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = OrigemMercadoria.fromJson(value));
    }
    return map;
  }
}

