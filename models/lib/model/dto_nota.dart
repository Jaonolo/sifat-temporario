part of openapi.api;

@JsonSerializable()
class DtoNota {

  Nota? nota;

  List<NotaItem> notaItemList = [];

  List<NotaFinalizadora> notaFinalizadoraList = [];

  DtoNota();

  @override
  String toString() {
    return 'DtoNota[nota=$nota, notaItemList=$notaItemList, notaFinalizadoraList=$notaFinalizadoraList, ]';
  }

  factory DtoNota.fromJson(Map<String, dynamic> json) =>
      _$DtoNotaFromJson(json);

  Map<String, dynamic> toJson() => _$DtoNotaToJson(this);

  static List<DtoNota> listFromJson(List<dynamic> json) {
    return json.map((value) => DtoNota.fromJson(value)).toList();
  }

  static Map<String, DtoNota> mapFromJson(Map<String, dynamic> json) {
    Map<String, DtoNota> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = DtoNota.fromJson(value));
    }
    return map;
  }
}

