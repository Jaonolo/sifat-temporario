part of openapi.api;

@JsonSerializable()
class TurnoFechamento {

  TurnoFechamentoPK? id = TurnoFechamentoPK();

  ControleRegistro? controleRegistro = ControleRegistro();

  FinalizadoraEmpresa? finalizadoraEmpresa;

  BigDecimal? valorDigitado = BigDecimal.ZERO();

  BigDecimal? valorApurado = BigDecimal.ZERO();

  TurnoFechamento();

  @override
  String toString() {
    return 'TurnoFechamento[id=$id, controleRegistro=$controleRegistro, finalizadoraEmpresa=$finalizadoraEmpresa, valorDigitado=$valorDigitado, valorApurado=$valorApurado, ]';
  }

  factory TurnoFechamento.fromJson(Map<String, dynamic> json) =>
      _$TurnoFechamentoFromJson(json);

  Map<String, dynamic> toJson() => _$TurnoFechamentoToJson(this);

  static List<TurnoFechamento> listFromJson(List<dynamic> json) {
    return json.map((value) => TurnoFechamento.fromJson(value)).toList();
  }

  static Map<String, TurnoFechamento> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, TurnoFechamento>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = TurnoFechamento.fromJson(value));
    }
    return map;
  }
}

