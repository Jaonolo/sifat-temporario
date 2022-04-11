part of openapi.api;

@JsonSerializable()
class RegiaoEmpresa {
  int? id;

  int? idEmpresa;

  BigDecimal? valor = BigDecimal.ZERO();

  String? tipoValor;

  // enum{ REAL, PERCENTUAL, }

  int? itinerario;

  int? prazoEntregaDias;

  int? idRegiao;

  RegiaoEmpresa();

  @override
  String toString() {
    return 'RegiaoEmpresa{id: $id, idEmpresa: $idEmpresa, valor: $valor, tipoValor: $tipoValor, itinerario: $itinerario, prazoEntregaDias: $prazoEntregaDias, idRegiao: $idRegiao}';
  }

  factory RegiaoEmpresa.fromJson(Map<String, dynamic> json) =>
      _$RegiaoEmpresaFromJson(json);

  Map<String, dynamic> toJson() => _$RegiaoEmpresaToJson(this);

  static List<RegiaoEmpresa> listFromJson(List<dynamic> json) {
    return json.map((value) => RegiaoEmpresa.fromJson(value)).toList();
  }

  static Map<String, RegiaoEmpresa> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, RegiaoEmpresa>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = RegiaoEmpresa.fromJson(value));
    }
    return map;
  }
}
