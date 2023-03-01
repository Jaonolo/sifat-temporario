part of openapi.api;

@JsonSerializable()
class ItemConfiguracaoWaychef {
  String? id;
  String? nome;
  String? tipoItem;
  TipoitemContratoWaychefEnum? tipoItemContratoWaychef;

  //generico
  List<IntegradorPodeComercializarItemDTO>? integradorPodeComercializarItemDTOLista;

  ItemConfiguracaoWaychef();

  @override
  String toString() {
    return 'ItemConfiguracaoWaychef{id: $id, nome: $nome, tipoItem: $tipoItem, '
        'tipoItemContratoWaychef: $tipoItemContratoWaychef, integradorPodeComercializarItemDTOLista: $integradorPodeComercializarItemDTOLista}';
  }

  factory ItemConfiguracaoWaychef.fromJson(Map<String, dynamic> json) =>
      _$ItemConfiguracaoWaychefFromJson(json);

  Map<String, dynamic> toJson() => _$ItemConfiguracaoWaychefToJson(this);

  static List<ItemConfiguracaoWaychef> listFromJson(List<dynamic> json) {
    return json
        .map((value) => ItemConfiguracaoWaychef.fromJson(value))
        .toList();
  }

  static Map<String, ItemConfiguracaoWaychef> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, ItemConfiguracaoWaychef> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
          map[key] = ItemConfiguracaoWaychef.fromJson(value));
    }
    return map;
  }
}
