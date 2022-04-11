part of openapi.api;

@JsonSerializable()
class ItemDTO {
  String? produtoDescricao;

  String? codigoInterno;

  BigDecimal? produtoValor;

  BigDecimal? quantidade;

  BigDecimal? valor;

  ItemDTO();

  @override
  String toString() {
    return 'ItemDTO{produtoDescricao: $produtoDescricao, codigoInterno: $codigoInterno, produtoValor: $produtoValor, quantidade: $quantidade, valor: $valor}';
  }

  factory ItemDTO.fromJson(Map<String, dynamic> json) =>
      _$ItemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDTOToJson(this);

  static List<ItemDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => ItemDTO.fromJson(value)).toList();
  }

  static Map<String, ItemDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ItemDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ItemDTO.fromJson(value));
    }
    return map;
  }
}