part of openapi.api;

@JsonSerializable()
class TaxaServicoGracomDTO {

  int? codigo;

  String? nome;

  BigDecimal? valorBaseCalculo;

  BigDecimal? taxaServico;

  TaxaServicoGracomDTO();

  @override
  String toString() {
    return 'TaxaServicoGracomDTO{codigo: $codigo, nome: $nome, valorBaseCalculo: $valorBaseCalculo, taxaServico: $taxaServico}';
  }

  factory TaxaServicoGracomDTO.fromJson(Map<String, dynamic> json) =>
      _$TaxaServicoGracomDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TaxaServicoGracomDTOToJson(this);

  static List<TaxaServicoGracomDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => TaxaServicoGracomDTO.fromJson(value)).toList();
  }

  static Map<String, TaxaServicoGracomDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, TaxaServicoGracomDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = TaxaServicoGracomDTO.fromJson(value));
    }
    return map;
  }
}