part of openapi.api;

@JsonSerializable()
class RecebimentoParcial {

  Nota? nota;

  String? tipoRecebimento;

  //enum tipoRecebimentoEnum {  VALOR,  ITEM,  };{

  @JsonKey(defaultValue: [])
  List<NotaFinalizadora> finalizadoras = [];

  @JsonKey(defaultValue: [])
  List<NotaItem> itens = [];

  RecebimentoParcial();

  @override
  String toString() {
    return 'RecebimentoParcial[nota=$nota, tipoRecebimento=$tipoRecebimento, finalizadoras=$finalizadoras, itens=$itens, ]';
  }

  factory RecebimentoParcial.fromJson(Map<String, dynamic> json) =>
      _$RecebimentoParcialFromJson(json);

  Map<String, dynamic> toJson() => _$RecebimentoParcialToJson(this);

  static List<RecebimentoParcial> listFromJson(List<dynamic> json) {
    return json.map((value) => RecebimentoParcial.fromJson(value)).toList();
  }

  static Map<String, RecebimentoParcial> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, RecebimentoParcial> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = RecebimentoParcial.fromJson(value));
    }
    return map;
  }
}

