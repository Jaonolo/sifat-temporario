part of openapi.api;

@JsonSerializable()
class ItemConfiguracaoIntegradorWaychef {
  String? id;
  double? valor;
  bool? permiteComercializar;
  int? idEmpresa;
  String? detalhes;
  String? idItemConfiguracaoWaychef;
  //generico
  // List<ItemConfiguracaoWaychefDTO>? itemConfiguracaoWaychefDTOLista;
  late ItemConfiguracaoWaychefDTO itemConfiguracaoWaychefDTO;

  ItemConfiguracaoIntegradorWaychef();

  @override
  String toString() {
    return 'ItemConfiguracaoIntengradorWaychef[id: $id, valor: $valor, permiteComercializar: $permiteComercializar, "detalhes": $detalhes, idEmpresa: $idEmpresa, idItemConfiguracaoWaychef: $idItemConfiguracaoWaychef, itemConfiguracaoWaychefDTO: $itemConfiguracaoWaychefDTO]';
  }


  factory ItemConfiguracaoIntegradorWaychef.fromJson(Map<String, dynamic> json) =>
      _$ItemConfiguracaoIntegradorWaychefFromJson(json);

  Map<String, dynamic> toJson() => _$ItemConfiguracaoIntegradorWaychefToJson(this);

  static List<ItemConfiguracaoIntegradorWaychef> listFromJson(List<dynamic> json) {
    return json.map((value) => ItemConfiguracaoIntegradorWaychef.fromJson(value)).toList();
  }

  static Map<String, ItemConfiguracaoIntegradorWaychef> mapFromJson(Map<String, dynamic> json) {
    Map<String, ItemConfiguracaoIntegradorWaychef> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ItemConfiguracaoIntegradorWaychef.fromJson(value));
    }
    return map;
  }
}
