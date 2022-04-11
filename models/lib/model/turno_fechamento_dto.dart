part of openapi.api;

@JsonSerializable()
class TurnoFechamentoDTO {

  String? finalizadora;

  BigDecimal? valorApurado;

  BigDecimal? valorDigitado;

  int? idFinalizadoraEmpresa;

  TurnoFechamentoDTO();

  @override
  String toString() {
    return 'TurnoFechamentoDTO{finalizadora: $finalizadora, valorApurado: $valorApurado, valorDigitado: $valorDigitado, idFinalizadoraEmpresa: $idFinalizadoraEmpresa}';
  }

  factory TurnoFechamentoDTO.fromJson(Map<String, dynamic> json) =>
      _$TurnoFechamentoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TurnoFechamentoDTOToJson(this);

  static List<TurnoFechamentoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => TurnoFechamentoDTO.fromJson(value)).toList();
  }

  static Map<String, TurnoFechamentoDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, TurnoFechamentoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = TurnoFechamentoDTO.fromJson(value));
    }
    return map;
  }
}