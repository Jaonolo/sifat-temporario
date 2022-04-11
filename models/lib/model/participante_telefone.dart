part of openapi.api;

class ParticipanteTelefone {

  String? numero;

  int? DDD;

  ParticipanteTelefone();

  @override
  String toString() {
    return 'ParticipanteTelefone[numero=$numero, DDD=$DDD, ]';
  }

  ParticipanteTelefone.fromJson(Map<String, dynamic> json) {
    if (json['Numero'] == null) {
      numero = null;
    } else {
      numero = json['Numero'];
    }
    if (json['DDD'] == null) {
      DDD = null;
    } else {
      DDD = json['DDD'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (numero != null)
      json['Numero'] = numero;
    if (DDD != null)
      json['DDD'] = DDD;
    return json;
  }

  static List<ParticipanteTelefone> listFromJson(List<dynamic> json) {
    return json.map((value) => ParticipanteTelefone.fromJson(value)).toList();
  }

  static Map<String, ParticipanteTelefone> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ParticipanteTelefone>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ParticipanteTelefone.fromJson(value));
    }
    return map;
  }
}

