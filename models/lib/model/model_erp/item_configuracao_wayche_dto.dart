part of openapi.api;

@JsonSerializable()
class ItemConfiguracaoWaychefDTO {
  String? id;
  String? nome;
  String? tipoItem;
  String? tipoItemContratoWaychef;
  //generico
  List<IntegradorPodeComercializarItemDTO>? integradorPodeComercializarItemDTOLista;

  ItemConfiguracaoWaychefDTO();

  @override
  String toString() {
    return 'ItemConfiguracaoWaychefDTO[id: $id, nome: $nome, tipoItem: $tipoItem, tipoItemContratoWaychef: $tipoItemContratoWaychef, integradorPodeComercializarItemDTOLista: $integradorPodeComercializarItemDTOLista]';
  }


  factory ItemConfiguracaoWaychefDTO.fromJson(Map<String, dynamic> json) =>
      _$ItemConfiguracaoWaychefDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ItemConfiguracaoWaychefDTOToJson(this);

  static List<ItemConfiguracaoWaychefDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => ItemConfiguracaoWaychefDTO.fromJson(value)).toList();
  }

  static Map<String, ItemConfiguracaoWaychefDTO> mapFromJson(Map<String, dynamic> json) {
    Map<String, ItemConfiguracaoWaychefDTO> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ItemConfiguracaoWaychefDTO.fromJson(value));
    }
    return map;
  }
}
