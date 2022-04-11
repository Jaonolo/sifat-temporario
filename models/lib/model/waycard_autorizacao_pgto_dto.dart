part of openapi.api;

@JsonSerializable()
class WaycardAutorizacaoPgtoDTO {

  int? idEmpresa;

  String? codigoAutorizacao;

  String? numeroVenda;

  BigDecimal? valor;

  WaycardAutorizacaoPgtoDTO();

  @override
  String toString() {
    return 'WaycardAutorizacaoPgtoDTO[idEmpresa=$idEmpresa, codigoAutorizacao=$codigoAutorizacao, numeroVenda=$numeroVenda, valor=$valor, ]';
  }

  factory WaycardAutorizacaoPgtoDTO.fromJson(Map<String, dynamic> json) =>
      _$WaycardAutorizacaoPgtoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$WaycardAutorizacaoPgtoDTOToJson(this);

  static List<WaycardAutorizacaoPgtoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => WaycardAutorizacaoPgtoDTO.fromJson(value))
        .toList();
  }

  static Map<String, WaycardAutorizacaoPgtoDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, WaycardAutorizacaoPgtoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = WaycardAutorizacaoPgtoDTO.fromJson(value));
    }
    return map;
  }
}

