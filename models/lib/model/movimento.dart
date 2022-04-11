part of openapi.api;

class Movimento {

  int? id;

  int? idEmpresa;

  int? sequencia;

  DateTime? movimento;

  DateTime? dataAbertura;

  DateTime? dataFechamento;

  Usuario? usuarioAbertura;

  Usuario? usuarioFechamento;

  int? idConcentrador;

  Movimento();

  @override
  String toString() {
    return 'Movimento[id=$id, idEmpresa=$idEmpresa, sequencia=$sequencia, movimento=$movimento, dataAbertura=$dataAbertura, dataFechamento=$dataFechamento, usuarioAbertura=$usuarioAbertura, usuarioFechamento=$usuarioFechamento, idConcentrador=$idConcentrador, ]';
  }

  Movimento.fromJson(Map<String, dynamic>? json) {
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
    if (json['sequencia'] == null) {
      sequencia = null;
    } else {
      sequencia = json['sequencia'];
    }
    if (json['movimento'] == null) {
      movimento = null;
    } else {
      movimento = DateTime.parse(json['movimento']);
    }
    if (json['dataAbertura'] == null) {
      dataAbertura = null;
    } else {
      dataAbertura = DateTime.parse(json['dataAbertura']);
    }
    if (json['dataFechamento'] == null) {
      dataFechamento = null;
    } else {
      dataFechamento = DateTime.parse(json['dataFechamento']);
    }
    if (json['usuarioAbertura'] == null) {
      usuarioAbertura = null;
    } else {
      usuarioAbertura = Usuario.fromJson(json['usuarioAbertura']);
    }
    if (json['usuarioFechamento'] == null) {
      usuarioFechamento = null;
    } else {
      usuarioFechamento = Usuario.fromJson(json['usuarioFechamento']);
    }
    if (json['idConcentrador'] == null) {
      idConcentrador = null;
    } else {
      idConcentrador = json['idConcentrador'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (sequencia != null)
      json['sequencia'] = sequencia;
    if (movimento != null)
      json['movimento'] =
      movimento == null ? null : movimento!.toIso8601String();
    if (dataAbertura != null)
      json['dataAbertura'] =
      dataAbertura == null ? null : dataAbertura!.toIso8601String();
    if (dataFechamento != null)
      json['dataFechamento'] =
      dataFechamento == null ? null : dataFechamento!.toIso8601String();
    if (usuarioAbertura != null)
      json['usuarioAbertura'] = usuarioAbertura;
    if (usuarioFechamento != null)
      json['usuarioFechamento'] = usuarioFechamento;
    if (idConcentrador != null)
      json['idConcentrador'] = idConcentrador;
    return json;
  }

  static List<Movimento> listFromJson(List<dynamic> json) {
    return json.map((value) => Movimento.fromJson(value)).toList();
  }

  static Map<String, Movimento> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Movimento>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Movimento.fromJson(value));
    }
    return map;
  }
}

