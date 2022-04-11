part of openapi.api;

class Pais {

  int? id;

  String? nome;

  String? sigla;

  int? ddi;

  Pais();

  @override
  String toString() {
    return 'Pais[id=$id, nome=$nome, sigla=$sigla, ddi=$ddi, ]';
  }

  Pais.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['nome'] == null) {
      nome = null;
    } else {
      nome = json['nome'];
    }
    if (json['sigla'] == null) {
      sigla = null;
    } else {
      sigla = json['sigla'];
    }
    if (json['ddi'] == null) {
      ddi = null;
    } else {
      ddi = json['ddi'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (nome != null)
      json['nome'] = nome;
    if (sigla != null)
      json['sigla'] = sigla;
    if (ddi != null)
      json['ddi'] = ddi;
    return json;
  }

  static List<Pais> listFromJson(List<dynamic> json) {
    return json.map((value) => Pais.fromJson(value)).toList();
  }

  static Map<String, Pais> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Pais>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Pais.fromJson(value));
    }
    return map;
  }
}

