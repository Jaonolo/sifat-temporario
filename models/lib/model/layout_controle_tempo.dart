part of openapi.api;

@JsonSerializable()
class LayoutControleTempo {
  int? id;

  int? idLayoutControler;

  @JsonKey(unknownEnumValue: TempoColor.VERMELHO)
  TempoColor? tempoColor;

  int? horaInicial;

  int? horaFinal;

  LayoutControleTempo();


  @override
  String toString() {
    return 'LayoutControleTempo{id: $id, idLayoutControler: $idLayoutControler, tempoColor: $tempoColor, horaInicial: $horaInicial, horaFinal: $horaFinal}';
  }

  factory LayoutControleTempo.fromJson(Map<String, dynamic> json) =>
      _$LayoutControleTempoFromJson(json);

  Map<String, dynamic> toJson() => _$LayoutControleTempoToJson(this);

  static List<LayoutControleTempo> listFromJson(List<dynamic> json) {
    return json.map((value) => LayoutControleTempo.fromJson(value)).toList();
  }

  static Map<String, LayoutControleTempo> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, LayoutControleTempo>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = LayoutControleTempo.fromJson(value));
    }
    return map;
  }
}