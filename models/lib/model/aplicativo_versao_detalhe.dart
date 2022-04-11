part of openapi.api;

@JsonSerializable()
class AplicativoVersaoDetalhe {

  int? id;

  int? idAplicativoVersao;

  AplicativoVersao? aplicativoVersao;

  String? detalhes;

  bool? termoTecnico;

  AplicativoVersaoDetalhe();

  factory AplicativoVersaoDetalhe.fromJson(Map<String, dynamic> json) =>
      _$AplicativoVersaoDetalheFromJson(json);

  Map<String, dynamic> toJson() => _$AplicativoVersaoDetalheToJson(this);

  static List<AplicativoVersaoDetalhe> listFromJson(List<dynamic> json) {
    return json.map((value) => AplicativoVersaoDetalhe.fromJson(value))
        .toList();
  }

  static Map<String, AplicativoVersaoDetalhe> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, AplicativoVersaoDetalhe> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = AplicativoVersaoDetalhe.fromJson(value));
    }
    return map;
  }
}

