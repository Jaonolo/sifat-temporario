part of openapi.api;


@JsonSerializable()
class TotalRecebimentoParcialDTO {
  String? modulo;

  //enum moduloEnum {  GERAL,  MESA,  FICHA,  DELIVERY,  CARTAO,  BALCAO,  DRIVE_THRU,  AUTOATENDIMENTO, };

  BigDecimal? valor;

  TotalRecebimentoParcialDTO();

  @override
  String toString() {
    return 'TotalRecebimentoParcialDTO[ modulo=$modulo, valor=$valor, ]';
  }

  factory TotalRecebimentoParcialDTO.fromJson(Map<String, dynamic> json) =>
      _$TotalRecebimentoParcialDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TotalRecebimentoParcialDTOToJson(this);

  static List<TotalRecebimentoParcialDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => TotalRecebimentoParcialDTO.fromJson(value))
        .toList();
  }

  static Map<String, TotalRecebimentoParcialDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, TotalRecebimentoParcialDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = TotalRecebimentoParcialDTO.fromJson(value));
    }
    return map;
  }
}