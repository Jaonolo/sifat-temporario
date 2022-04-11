part of openapi.api;

@JsonSerializable()
class DesdobramentoModulo {

  String? modulo;

  //enum moduloEnum {  GERAL,  MESA,  FICHA,  DELIVERY,  CARTAO,  BALCAO,  DRIVE_THRU,  };{

  BigDecimal? taxaServico = BigDecimal.ZERO();

  BigDecimal? vendasProduto = BigDecimal.ZERO();

  BigDecimal? vendasServico = BigDecimal.ZERO();

  DesdobramentoModulo();

  @override
  String toString() {
    return 'DesdobramentoModulo[modulo=$modulo, taxaServico=$taxaServico, vendasProduto=$vendasProduto, vendasServico=$vendasServico, ]';
  }

  factory DesdobramentoModulo.fromJson(Map<String, dynamic> json) =>
      _$DesdobramentoModuloFromJson(json);

  Map<String, dynamic> toJson() => _$DesdobramentoModuloToJson(this);

  static List<DesdobramentoModulo> listFromJson(List<dynamic> json) {
    return json.map((value) => DesdobramentoModulo.fromJson(value)).toList();
  }

  static Map<String, DesdobramentoModulo> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, DesdobramentoModulo>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = DesdobramentoModulo.fromJson(value));
    }
    return map;
  }
}

