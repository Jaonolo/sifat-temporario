part of openapi.api;

@JsonSerializable()
class ClienteQuestDTO {

  Cliente? cliente;

  Participante? participante;

  NotaQuest? notaQuest;

  @JsonKey(defaultValue: [])
  List<Campanha> campanhas = [];

  @JsonKey(defaultValue: [])
  List<HistoricoCompras> historicoCompras = [];

  ClienteQuestDTO();

  @override
  String toString() {
    return 'ClienteQuestDTO[cliente=$cliente, participante=$participante, notaQuest=$notaQuest, campanhas=$campanhas, historicoCompras=$historicoCompras, ]';
  }

  factory ClienteQuestDTO.fromJson(Map<String, dynamic> json) =>
      _$ClienteQuestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteQuestDTOToJson(this);

  static List<ClienteQuestDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteQuestDTO.fromJson(value)).toList();
  }

  static Map<String, ClienteQuestDTO> mapFromJson(Map<String, dynamic> json) {
    Map<String, ClienteQuestDTO> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteQuestDTO.fromJson(value));
    }
    return map;
  }
}

