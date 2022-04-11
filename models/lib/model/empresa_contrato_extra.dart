part of openapi.api;

@JsonSerializable()
class EmpresaContratoExtra {

  int? id;

  int? idEmpresaContrato;

  ContratoExtra? contratoExtra;

  BigDecimal? valorUnitario;

  int? quantidade;

  BigDecimal? valorTotal;

  EmpresaContratoExtra();

  @override
  String toString() {
    return 'EmpresaContratoExtra[id=$id, idEmpresaContrato=$idEmpresaContrato, contratoExtra=$contratoExtra, valorUnitario=$valorUnitario, quantidade=$quantidade, valorTotal=$valorTotal, ]';
  }

  factory EmpresaContratoExtra.fromJson(Map<String, dynamic> json) =>
      _$EmpresaContratoExtraFromJson(json);

  Map<String, dynamic> toJson() => _$EmpresaContratoExtraToJson(this);

  static List<EmpresaContratoExtra> listFromJson(List<dynamic> json) {
    return json.map((value) => EmpresaContratoExtra.fromJson(value)).toList();
  }

  static Map<String, EmpresaContratoExtra> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, EmpresaContratoExtra>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EmpresaContratoExtra.fromJson(value));
    }
    return map;
  }
}

