part of openapi.api;

@JsonSerializable()
class HistoricoPedidoDTO {
  int? totalPedidos;

  BigDecimal? ticketMedio;

  DateTime? dataUltimoPedido;

  String? tempoMedioExpedicao;

  List<PedidoDTO> pedidoDTOList = [];

  HistoricoPedidoDTO();

  @override
  String toString() {
    return 'HistoricoPedidoDTO{totalPedidos: $totalPedidos, ticketMedio: $ticketMedio, dataUltimoPedido: $dataUltimoPedido, tempoMedioExpedicao: $tempoMedioExpedicao, pedidoDTOList: $pedidoDTOList}';
  }

  factory HistoricoPedidoDTO.fromJson(Map<String, dynamic> json) =>
      _$HistoricoPedidoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$HistoricoPedidoDTOToJson(this);

  static List<HistoricoPedidoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => HistoricoPedidoDTO.fromJson(value)).toList();
  }

  static Map<String, HistoricoPedidoDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, HistoricoPedidoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = HistoricoPedidoDTO.fromJson(value));
    }
    return map;
  }


}