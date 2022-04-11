part of openapi.api;

@JsonSerializable()
class ContingenciaFiscal {

  int? id;

  int? idEmpresa;

  DateTime? dataInicio;

  DateTime? dataFim;

  String? motivo;

  int? notasPendentesEnvio;

  ContingenciaFiscal();

  @override
  String toString() {
    return 'ContingenciaFiscal{id: $id, idEmpresa: $idEmpresa, dataInicio: $dataInicio, dataFim: $dataFim, motivo: $motivo, notasPendentesEnvio: $notasPendentesEnvio}';
  }

  factory ContingenciaFiscal.fromJson(Map<String, dynamic> json) =>
      _$ContingenciaFiscalFromJson(json);

  Map<String, dynamic> toJson() => _$ContingenciaFiscalToJson(this);

  static List<ContingenciaFiscal> listFromJson(List<dynamic> json) {
    return json.map((value) => ContingenciaFiscal.fromJson(value)).toList();
  }

  static Map<String, ContingenciaFiscal> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ContingenciaFiscal>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ContingenciaFiscal.fromJson(value));
    }
    return map;
  }
}