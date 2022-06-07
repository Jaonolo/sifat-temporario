part of openapi.api;

@JsonSerializable()
class PedidoDTO {
  int? idNota;

  DateTime? data;

  int? numeroPedido;

  BigDecimal? total;

  String? origem;

  // enum Origem {WAITER, WAITER_MOBILE, ALFA_SYNC, IFOOD, RAPPI, WABIZ, FOURALL, CONCENTRADOR, WAYMENU, OUTRO,}

  @JsonKey(defaultValue: [])
  List<PedidoItemDTO> pedidoItemDTOList = [];

  PedidoDTO();


  @override
  String toString() {
    return 'PedidoDTO{idNota: $idNota, data: $data, numeroPedido: $numeroPedido, total: $total, origem: $origem, pedidoItemDTOList: $pedidoItemDTOList}';
  }

  factory PedidoDTO.fromJson(Map<String, dynamic> json) =>
      _$PedidoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PedidoDTOToJson(this);

  static List<PedidoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => PedidoDTO.fromJson(value)).toList();
  }

  static Map<String, PedidoDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, PedidoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = PedidoDTO.fromJson(value));
    }
    return map;
  }
}