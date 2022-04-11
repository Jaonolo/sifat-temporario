part of openapi.api;

@JsonSerializable()
class TurnoSimplificadoDTO {
  int? idTurno;

  int? idUsuario;

  int? loja;

  DateTime? dataAbertura;

  DateTime? dataEncerramento;

  int? sequenciaTurno;

  String? operador;

  String? observacao;

  TurnoSimplificadoDTO();

  @override
  String toString() {
    return 'TurnoSimplificado{idTurno: $idTurno, idUsuario: $idUsuario, loja: $loja, dataAbertura: $dataAbertura, dataEncerramento: $dataEncerramento, sequenciaTurno: $sequenciaTurno, operador: $operador, observacao: $observacao, }';
  }

  factory TurnoSimplificadoDTO.fromJson(Map<String, dynamic> json) =>
      _$TurnoSimplificadoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TurnoSimplificadoDTOToJson(this);

  static List<TurnoSimplificadoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => TurnoSimplificadoDTO.fromJson(value)).toList();
  }

  static Map<String, TurnoSimplificadoDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, TurnoSimplificadoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = TurnoSimplificadoDTO.fromJson(value));
    }
    return map;
  }
}