part of openapi.api;

@JsonSerializable()
class VendasModuloDTO {

  String? tipoModulo;

  //enum tipoModuloEnum {  GERAL,  MESA,  FICHA,  DELIVERY,  CARTAO,  BALCAO,  DRIVE_THRU,  };{

  BigDecimal? vendasProdutos;

  BigDecimal? valorServico;

  VendasModuloDTO();

  @override
  String toString() {
    return 'VendasModuloDTO{tipoModulo: $tipoModulo, vendasProdutos: $vendasProdutos, valorServico: $valorServico}';
  }

  factory VendasModuloDTO.fromJson(Map<String, dynamic> json) =>
      _$VendasModuloDTOFromJson(json);

  Map<String, dynamic> toJson() => _$VendasModuloDTOToJson(this);

  static List<VendasModuloDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => VendasModuloDTO.fromJson(value)).toList();
  }

  static Map<String, VendasModuloDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, VendasModuloDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = VendasModuloDTO.fromJson(value));
    }
    return map;
  }
}