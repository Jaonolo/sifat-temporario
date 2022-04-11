part of openapi.api;

@JsonSerializable()
class ContaClassificacao {
  int? id;

  int? idConta;

  Conta? conta;

  int? idPlanoConta;

  PlanoConta? planoConta;

  BigDecimal? percentualRateio = BigDecimal.ZERO();

  BigDecimal? valorRateio = BigDecimal.ZERO();

  ContaClassificacao();

  @override
  String toString() {
    return 'ContaClassificacao{id: $id, idConta: $idConta, conta: $conta, idPlanoConta: $idPlanoConta, planoConta: $planoConta, percentualRateio: $percentualRateio, valorRateio: $valorRateio}';
  }

  factory ContaClassificacao.fromJson(Map<String, dynamic> json) =>
      _$ContaClassificacaoFromJson(json);

  Map<String, dynamic> toJson() => _$ContaClassificacaoToJson(this);

  static List<ContaClassificacao> listFromJson(List<dynamic> json) {
    return json.map((value) => ContaClassificacao.fromJson(value)).toList();
  }

  static Map<String, ContaClassificacao> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ContaClassificacao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ContaClassificacao.fromJson(value));
    }
    return map;
  }
}
