part of openapi.api;

@JsonSerializable()
class FoxConsumo {

  int? id;

  String? modulo;

  //enum moduloEnum {  GERAL,  MESA,  FICHA,  DELIVERY,  CARTAO,  BALCAO,  DRIVE_THRU,  };{

  BigDecimal? valorTotal = BigDecimal.ZERO();

  int? quantidadeComandas;

  DateTime? dataEnvio;

  int? idEmpresa;

  FoxConsumo();

  @override
  String toString() {
    return 'FoxConsumo[id=$id, modulo=$modulo, valorTotal=$valorTotal, quantidadeComandas=$quantidadeComandas, dataEnvio=$dataEnvio, idEmpresa=$idEmpresa, ]';
  }

  factory FoxConsumo.fromJson(Map<String, dynamic> json) =>
      _$FoxConsumoFromJson(json);

  Map<String, dynamic> toJson() => _$FoxConsumoToJson(this);

  static List<FoxConsumo> listFromJson(List<dynamic> json) {
    return json.map((value) => FoxConsumo.fromJson(value)).toList();
  }

  static Map<String, FoxConsumo> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, FoxConsumo>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = FoxConsumo.fromJson(value));
    }
    return map;
  }
}

