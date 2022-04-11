part of openapi.api;

class ControleRegistro {

  int? idUsuarioAlteracao;

  DateTime? dataAlteracao;

  ControleRegistro();

  @override
  String toString() {
    return 'ControleRegistro[idUsuarioAlteracao=$idUsuarioAlteracao, dataAlteracao=$dataAlteracao, ]';
  }

  ControleRegistro.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['idUsuarioAlteracao'] == null) {
      idUsuarioAlteracao = null;
    } else {
      idUsuarioAlteracao = json['idUsuarioAlteracao'];
    }
    if (json['dataAlteracao'] == null) {
      dataAlteracao = null;
    } else {
      dataAlteracao = DateTime.parse(json['dataAlteracao']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (idUsuarioAlteracao != null)
      json['idUsuarioAlteracao'] = idUsuarioAlteracao;
    if (dataAlteracao != null)
      json['dataAlteracao'] =
      dataAlteracao == null ? null : dataAlteracao!.toIso8601String();
    return json;
  }

  static List<ControleRegistro> listFromJson(List<dynamic> json) {
    return json.map((value) => ControleRegistro.fromJson(value)).toList();
  }

  static Map<String, ControleRegistro> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ControleRegistro>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ControleRegistro.fromJson(value));
    }
    return map;
  }
}

