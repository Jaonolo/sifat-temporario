part of openapi.api;

class Evento {

  int? id;

  int? idEmpresa;

  String? descricao;

  DateTime? dataInicio;

  DateTime? dataTermino;

  bool? ativo;

  Evento();

  @override
  String toString() {
    return 'Evento[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, dataInicio=$dataInicio, dataTermino=$dataTermino, ativo=$ativo, ]';
  }

  Evento.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idEmpresa'] == null) {
      idEmpresa = null;
    } else {
      idEmpresa = json['idEmpresa'];
    }
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
    if (json['dataInicio'] == null) {
      dataInicio = null;
    } else {
      dataInicio = DateTime.parse(json['dataInicio']);
    }
    if (json['dataTermino'] == null) {
      dataTermino = null;
    } else {
      dataTermino = DateTime.parse(json['dataTermino']);
    }
    if (json['ativo'] == null) {
      ativo = null;
    } else {
      ativo = json['ativo'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (descricao != null)
      json['descricao'] = descricao;
    if (dataInicio != null)
      json['dataInicio'] =
      dataInicio == null ? null : dataInicio!.toIso8601String();
    if (dataTermino != null)
      json['dataTermino'] =
      dataTermino == null ? null : dataTermino!.toIso8601String();
    if (ativo != null)
      json['ativo'] = ativo;
    return json;
  }

  static List<Evento> listFromJson(List<dynamic> json) {
    return json.map((value) => Evento.fromJson(value)).toList();
  }

  static Map<String, Evento> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Evento>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Evento.fromJson(value));
    }
    return map;
  }
}

