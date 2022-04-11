part of openapi.api;

@JsonSerializable()
class DesdobramentoGarcom {

  Funcionario? vendedor;

  BigDecimal? vendasProduto = BigDecimal.ZERO();

  BigDecimal? vendasServico = BigDecimal.ZERO();

  DesdobramentoGarcom();

  @override
  String toString() {
    return 'DesdobramentoGarcom[vendedor=$vendedor, vendasProduto=$vendasProduto, vendasServico=$vendasServico, ]';
  }

  factory DesdobramentoGarcom.fromJson(Map<String, dynamic> json) =>
      _$DesdobramentoGarcomFromJson(json);

  Map<String, dynamic> toJson() => _$DesdobramentoGarcomToJson(this);

  static List<DesdobramentoGarcom> listFromJson(List<dynamic> json) {
    return json.map((value) => DesdobramentoGarcom.fromJson(value)).toList();
  }

  static Map<String, DesdobramentoGarcom> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, DesdobramentoGarcom>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = DesdobramentoGarcom.fromJson(value));
    }
    return map;
  }
}

