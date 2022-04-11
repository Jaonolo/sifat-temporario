part of openapi.api;

class TurnoFechamentoPK {

  int? idTurno;

  int? idFinalizadoraEmpresa;

  TurnoFechamentoPK();

  @override
  String toString() {
    return 'TurnoFechamentoPK[idTurno=$idTurno, idFinalizadoraEmpresa=$idFinalizadoraEmpresa, ]';
  }

  TurnoFechamentoPK.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['idTurno'] == null) {
      idTurno = null;
    } else {
      idTurno = json['idTurno'];
    }
    if (json['idFinalizadoraEmpresa'] == null) {
      idFinalizadoraEmpresa = null;
    } else {
      idFinalizadoraEmpresa = json['idFinalizadoraEmpresa'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (idTurno != null)
      json['idTurno'] = idTurno;
    if (idFinalizadoraEmpresa != null)
      json['idFinalizadoraEmpresa'] = idFinalizadoraEmpresa;
    return json;
  }

  static List<TurnoFechamentoPK> listFromJson(List<dynamic> json) {
    return json.map((value) => TurnoFechamentoPK.fromJson(value)).toList();
  }

  static Map<String, TurnoFechamentoPK> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, TurnoFechamentoPK>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = TurnoFechamentoPK.fromJson(value));
    }
    return map;
  }
}

