part of openapi.api;

class ProgramaFidelidade {

  int? id;

  int? versao;

  ProgramaFidelidade();

  @override
  String toString() {
    return 'ProgramaFidelidade[id=$id, versao=$versao, ]';
  }

  ProgramaFidelidade.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['versao'] == null) {
      versao = null;
    } else {
      versao = json['versao'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<ProgramaFidelidade> listFromJson(List<dynamic> json) {
    return json.map((value) => ProgramaFidelidade.fromJson(value)).toList();
  }

  static Map<String, ProgramaFidelidade> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ProgramaFidelidade>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ProgramaFidelidade.fromJson(value));
    }
    return map;
  }
}

