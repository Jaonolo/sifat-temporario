part of openapi.api;

@JsonSerializable()
class NotaXml {
  int? id;

  String? xmlEmissao;

  String? xmlEnvio;

  String? xmlCancelamento;

  String? xmlInutilizacao;

  NotaXml();

  @override
  String toString() {
    return 'NotaXML{id: $id, xmlEmissao: $xmlEmissao, xmlEnvio: $xmlEnvio, xmlCancelamento: $xmlCancelamento, xmlInutilizacao: $xmlInutilizacao}';
  }

  factory NotaXml.fromJson(Map<String, dynamic> json) =>
      _$NotaXmlFromJson(json);

  Map<String, dynamic> toJson() => _$NotaXmlToJson(this);

  static List<NotaXml> listFromJson(List<dynamic> json) {
    return json.map((value) => NotaXml.fromJson(value)).toList();
  }

  static Map<String, NotaXml> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, NotaXml>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = NotaXml.fromJson(value));
    }
    return map;
  }

}