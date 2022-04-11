part of openapi.api;

@JsonSerializable()
class AplicativoVersao {

  int? id;

  DateTime? data;

  String? client;

  String? versao;

  String? link;

  bool? beta;

  bool? prioritaria;

  DateTime? dataLancamento;

  @JsonKey(defaultValue: [])
  List<AplicativoVersaoDetalhe> detalhes = [];

  AplicativoVersao();

  factory AplicativoVersao.fromJson(Map<String, dynamic> json) =>
      _$AplicativoVersaoFromJson(json);

  Map<String, dynamic> toJson() => _$AplicativoVersaoToJson(this);

  static List<AplicativoVersao> listFromJson(List<dynamic> json) {
    return json.map((value) => AplicativoVersao.fromJson(value)).toList();
  }

  static Map<String, AplicativoVersao> mapFromJson(Map<String, dynamic> json) {
    Map<String, AplicativoVersao> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = AplicativoVersao.fromJson(value));
    }
    return map;
  }
}

