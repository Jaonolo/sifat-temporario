part of openapi.api;

@JsonSerializable()
class OperacaoFinalizadora {
  OperacaoFinalizadoraPK? id = OperacaoFinalizadoraPK();

  FinalizadoraEmpresa? finalizadoraEmpresa;

  BigDecimal? valor = BigDecimal.ZERO();

  OperacaoFinalizadora();

  @override
  String toString() {
    return 'OperacaoFinalizadora[id=$id, finalizadoraEmpresa=$finalizadoraEmpresa, valor=$valor, ]';
  }

  factory OperacaoFinalizadora.fromJson(Map<String, dynamic> json) =>
      _$OperacaoFinalizadoraFromJson(json);

  Map<String, dynamic> toJson() => _$OperacaoFinalizadoraToJson(this);

  static List<OperacaoFinalizadora> listFromJson(List<dynamic> json) {
    return json.map((value) => OperacaoFinalizadora.fromJson(value)).toList();
  }

  static Map<String, OperacaoFinalizadora> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, OperacaoFinalizadora>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = OperacaoFinalizadora.fromJson(value));
    }
    return map;
  }
}
