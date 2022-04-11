part of openapi.api;

class EmpresaFusoHorario {

  int? idEmpresa;

  String? fusoHorario = 'BRASILIA';

  //enum fusoHorarioEnum {  NORONHA,  BRASILIA,  AMAZONIA,  ACRE,  };{
  EmpresaFusoHorario();

  @override
  String toString() {
    return 'EmpresaFusoHorario[idEmpresa=$idEmpresa, fusoHorario=$fusoHorario, ]';
  }

  EmpresaFusoHorario.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['idEmpresa'] == null) {
      idEmpresa = null;
    } else {
      idEmpresa = json['idEmpresa'];
    }
    if (json['fusoHorario'] == null) {
      fusoHorario = null;
    } else {
      fusoHorario = json['fusoHorario'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (fusoHorario != null)
      json['fusoHorario'] = fusoHorario;
    return json;
  }

  static List<EmpresaFusoHorario> listFromJson(List<dynamic> json) {
    return json.map((value) => EmpresaFusoHorario.fromJson(value)).toList();
  }

  static Map<String, EmpresaFusoHorario> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, EmpresaFusoHorario>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EmpresaFusoHorario.fromJson(value));
    }
    return map;
  }
}

