part of openapi.api;

@JsonSerializable()
class DesdobramentoVenda {

  BigDecimal? totalAcrescimo = BigDecimal.ZERO();

  BigDecimal? acrescimoManual = BigDecimal.ZERO();

  BigDecimal? acrescimoTaxaServico = BigDecimal.ZERO();

  BigDecimal? acrescimoTaxaEntrega = BigDecimal.ZERO();

  BigDecimal? totalDesconto = BigDecimal.ZERO();

  BigDecimal? descontoManual = BigDecimal.ZERO();

  BigDecimal? descontoPromocao = BigDecimal.ZERO();

  BigDecimal? isencaoTaxaServico = BigDecimal.ZERO();

  BigDecimal? isencaoTaxaEntrega = BigDecimal.ZERO();

  BigDecimal? totalDeducao = BigDecimal.ZERO();

  BigDecimal? cancelamento = BigDecimal.ZERO();

  BigDecimal? vendaBruta = BigDecimal.ZERO();

  DesdobramentoVenda();

  @override
  String toString() {
    return 'DesdobramentoVenda[totalAcrescimo=$totalAcrescimo, acrescimoManual=$acrescimoManual, acrescimoTaxaServico=$acrescimoTaxaServico, acrescimoTaxaEntrega=$acrescimoTaxaEntrega, totalDesconto=$totalDesconto, descontoManual=$descontoManual, descontoPromocao=$descontoPromocao, isencaoTaxaServico=$isencaoTaxaServico, isencaoTaxaEntrega=$isencaoTaxaEntrega, totalDeducao=$totalDeducao, cancelamento=$cancelamento, vendaBruta=$vendaBruta, ]';
  }

  factory DesdobramentoVenda.fromJson(Map<String, dynamic> json) =>
      _$DesdobramentoVendaFromJson(json);

  Map<String, dynamic> toJson() => _$DesdobramentoVendaToJson(this);

  static List<DesdobramentoVenda> listFromJson(List<dynamic> json) {
    return json.map((value) => DesdobramentoVenda.fromJson(value)).toList();
  }

  static Map<String, DesdobramentoVenda> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, DesdobramentoVenda>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = DesdobramentoVenda.fromJson(value));
    }
    return map;
  }
}

