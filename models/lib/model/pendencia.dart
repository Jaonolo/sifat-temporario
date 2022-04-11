part of openapi.api;

class Pendencia {

  String? tipoPendencia;

  //enum tipoPendenciaEnum {  EMISSAO_NOTA,  CANCELAMENTO_NOTA,  };{

  int? idEntidade;

  int? numero;

  DateTime? data;

  Pendencia();

  @override
  String toString() {
    return 'Pendencia[tipoPendencia=$tipoPendencia, idEntidade=$idEntidade, numero=$numero, data=$data, ]';
  }

  Pendencia.fromJson(Map<String, dynamic> json) {
    if (json['tipoPendencia'] == null) {
      tipoPendencia = null;
    } else {
      tipoPendencia = json['tipoPendencia'];
    }
    if (json['idEntidade'] == null) {
      idEntidade = null;
    } else {
      idEntidade = json['idEntidade'];
    }
    if (json['numero'] == null) {
      numero = null;
    } else {
      numero = json['numero'];
    }
    if (json['data'] == null) {
      data = null;
    } else {
      data = DateTime.parse(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (tipoPendencia != null)
      json['tipoPendencia'] = tipoPendencia;
    if (idEntidade != null)
      json['idEntidade'] = idEntidade;
    if (numero != null)
      json['numero'] = numero;
    if (data != null)
      json['data'] = data == null ? null : data!.toIso8601String();
    return json;
  }

  static List<Pendencia> listFromJson(List<dynamic> json) {
    return json.map((value) => Pendencia.fromJson(value)).toList();
  }

  static Map<String, Pendencia> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Pendencia>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Pendencia.fromJson(value));
    }
    return map;
  }
}

