part of openapi.api;

@JsonSerializable()
class ContaCentroCusto {
  int? id;

  int? idConta;

  Conta? conta;

  int? idCentroCusto;

  CentroCusto? centroCusto;

  BigDecimal? percentualRateio = BigDecimal.ZERO();

  BigDecimal? valorRateio = BigDecimal.ZERO();

  ContaCentroCusto();

  @override
  String toString() {
    return 'ContaCentroCusto{id: $id, idConta: $idConta, conta: $conta, idCentroCusto: $idCentroCusto, centroCusto: $centroCusto, percentualRateio: $percentualRateio, valorRateio: $valorRateio}';
  }

  factory ContaCentroCusto.fromJson(Map<String, dynamic> json) =>
      _$ContaCentroCustoFromJson(json);

  Map<String, dynamic> toJson() => _$ContaCentroCustoToJson(this);

  static List<ContaCentroCusto> listFromJson(List<dynamic> json) {
    return json.map((value) => ContaCentroCusto.fromJson(value)).toList();
  }

  static Map<String, ContaCentroCusto> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ContaCentroCusto>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ContaCentroCusto.fromJson(value));
    }
    return map;
  }
}
