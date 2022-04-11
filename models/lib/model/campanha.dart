part of openapi.api;

@JsonSerializable()
class Campanha {

  int? ID;

  String? descricao;

  Campanha();

  @override
  String toString() {
    return 'Campanha[ID=$ID, descricao=$descricao, ]';
  }

  factory Campanha.fromJson(Map<String, dynamic> json) =>
      _$CampanhaFromJson(json);

  Map<String, dynamic> toJson() => _$CampanhaToJson(this);

  static List<Campanha> listFromJson(List<dynamic> json) {
    return json.map((value) => Campanha.fromJson(value)).toList();
  }

  static Map<String, Campanha> mapFromJson(Map<String, dynamic> json) {
    Map<String, Campanha> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Campanha.fromJson(value));
    }
    return map;
  }
}

