part of openapi.api;

@JsonSerializable()
class IdentificacaoCarteiraDigital {
  int? id;

  String? codigo;

  String? descricao;

  IdentificacaoCarteiraDigital();

  @override
  String toString() {
    return 'IdentificacaoCarteiraDigital{id: $id, codigo: $codigo, descricao: $descricao}';
  }

  factory IdentificacaoCarteiraDigital.fromJson(Map<String, dynamic> json) =>
      _$IdentificacaoCarteiraDigitalFromJson(json);

  Map<String, dynamic> toJson() => _$IdentificacaoCarteiraDigitalToJson(this);

  static List<IdentificacaoCarteiraDigital> listFromJson(List<dynamic> json) {
    return json == null
        ? List.empty()
        : json
            .map((value) => IdentificacaoCarteiraDigital.fromJson(value))
            .toList();
  }

  static Map<String, IdentificacaoCarteiraDigital> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, IdentificacaoCarteiraDigital> map = {};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
          map[key] = IdentificacaoCarteiraDigital.fromJson(value));
    }
    return map;
  }
}
