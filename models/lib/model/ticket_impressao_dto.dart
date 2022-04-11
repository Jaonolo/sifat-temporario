part of openapi.api;

@JsonSerializable()
class TicketImpressaoDTO {
  String? nomeRestaurante;

  String? modulo;

  String? comanda;

  List<ItemDTO> itens = [];

  EquipamentoImpressao? equipamentoImpressao;

  TicketImpressaoDTO();


  @override
  String toString() {
    return 'TicketImpressaoDTO{nomeRestaurante: $nomeRestaurante, modulo: $modulo, itens: $itens, comanda: $comanda, equipamentoImpressao: $equipamentoImpressao}';
  }

  factory TicketImpressaoDTO.fromJson(Map<String, dynamic> json) =>
      _$TicketImpressaoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TicketImpressaoDTOToJson(this);

  static List<TicketImpressaoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => TicketImpressaoDTO.fromJson(value)).toList();
  }

  static Map<String, TicketImpressaoDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, TicketImpressaoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = TicketImpressaoDTO.fromJson(value));
    }
    return map;
  }
}