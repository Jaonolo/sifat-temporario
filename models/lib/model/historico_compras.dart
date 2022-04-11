part of openapi.api;

@JsonSerializable()
class HistoricoCompras {

  String? produto;

  BigDecimal? compras = BigDecimal.ZERO();

  HistoricoCompras();

  @override
  String toString() {
    return 'HistoricoCompras[produto=$produto, compras=$compras, ]';
  }

  factory HistoricoCompras.fromJson(Map<String, dynamic> json) =>
      _$HistoricoComprasFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricoComprasToJson(this);

  static List<HistoricoCompras> listFromJson(List<dynamic> json) {
    return json.map((value) => HistoricoCompras.fromJson(value)).toList();
  }

  static Map<String, HistoricoCompras> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, HistoricoCompras>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = HistoricoCompras.fromJson(value));
    }
    return map;
  }
}

