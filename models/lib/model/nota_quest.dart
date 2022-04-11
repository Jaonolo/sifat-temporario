part of openapi.api;

@JsonSerializable()
class NotaQuest {

  int? id;

  int? idParticipanteQuest;

  Cliente? participanteQuest;

  int? idTransacao;

  BigDecimal? pontos = BigDecimal.ZERO();

  String? token;

  String? status;

  //enum statusEnum {  PENDENTE,  ACUMULADO,  RESGATADO,  ESTORNADO,  };{
  NotaQuest();

  @override
  String toString() {
    return 'NotaQuest[id=$id, idParticipanteQuest=$idParticipanteQuest, participanteQuest=$participanteQuest, idTransacao=$idTransacao, pontos=$pontos, token=$token, status=$status, ]';
  }

  factory NotaQuest.fromJson(Map<String, dynamic> json) =>
      _$NotaQuestFromJson(json);

  Map<String, dynamic> toJson() => _$NotaQuestToJson(this);

  static List<NotaQuest> listFromJson(List<dynamic> json) {
    return json.map((value) => NotaQuest.fromJson(value)).toList();
  }

  static Map<String, NotaQuest> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, NotaQuest>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = NotaQuest.fromJson(value));
    }
    return map;
  }
}

