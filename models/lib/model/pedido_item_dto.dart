part of openapi.api;

@JsonSerializable()
class PedidoItemDTO {
  int? idNotaItem;

  int? idNotaItemPai;

  String? tipoItem;

  // enum TipoItem { ITEM, OBSERVACAO, ADICIONAL, COMBO, ITEM_COMBO, COMPOSTO, ITEM_COMPOSTO, COMBINADO, ITEM_COMBINADO, RODIZIO, ITEM_RODIZIO, CESTA, ITEM_CESTA, MENU, GORJETA, INGRESSO, }

  String? descricao;

  BigDecimal? quantidade;

  BigDecimal? total;

  @JsonKey(defaultValue: [])
  List<PedidoItemDTO> subitens = [];

  PedidoItemDTO();


  @override
  String toString() {
    return 'PedidoItemDTO{idNotaItem: $idNotaItem, idNotaItemPai: $idNotaItemPai, tipoItem: $tipoItem, descricao: $descricao, quantidade: $quantidade, total: $total, subitens: $subitens}';
  }

  factory PedidoItemDTO.fromJson(Map<String, dynamic> json) =>
      _$PedidoItemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PedidoItemDTOToJson(this);

  static List<PedidoItemDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => PedidoItemDTO.fromJson(value)).toList();
  }

  static Map<String, PedidoItemDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, PedidoItemDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = PedidoItemDTO.fromJson(value));
    }
    return map;
  }
}