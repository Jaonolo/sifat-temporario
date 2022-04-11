part of openapi.api;

@JsonSerializable()
class DesdobramentoVendaDTO {

  BigDecimal? vendaBruta;

  // Acrescimos
  BigDecimal? acrescimo;

  BigDecimal? taxaServico;

  BigDecimal? taxaEntrega;

  // Desconto
  BigDecimal? desconto;

  BigDecimal? promocao;

  BigDecimal? isencaoTaxaServico;

  BigDecimal? isencaoTaxaEntrega;

  DesdobramentoVendaDTO();

  @override
  String toString() {
    return 'DesdobramentoVendaDTO{vendaBruta: $vendaBruta, acrescimo: $acrescimo, taxaServico: $taxaServico, taxaEntrega: $taxaEntrega, desconto: $desconto, promocao: $promocao, isencaoTaxaServico: $isencaoTaxaServico, isencaoTaxaEntrega: $isencaoTaxaEntrega}';
  }

  factory DesdobramentoVendaDTO.fromJson(Map<String, dynamic> json) =>
      _$DesdobramentoVendaDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DesdobramentoVendaDTOToJson(this);

  static List<DesdobramentoVendaDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => DesdobramentoVendaDTO.fromJson(value)).toList();
  }

  static Map<String, DesdobramentoVendaDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, DesdobramentoVendaDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = DesdobramentoVendaDTO.fromJson(value));
    }
    return map;
  }
}