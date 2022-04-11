part of openapi.api;

@JsonSerializable()
class TotalFinalizadoraDTO {

  int? idFinalizadora;

  int? codigo;

  String? descricao;

  BigDecimal? total;

  TotalFinalizadoraDTO();

  @override
  String toString() {
    return 'TotalFinalizadoraDTO{idFinalizadora: $idFinalizadora, codigo: $codigo, descricao: $descricao, total: $total}';
  }

  factory TotalFinalizadoraDTO.fromJson(Map<String, dynamic> json) =>
      _$TotalFinalizadoraDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TotalFinalizadoraDTOToJson(this);

  static List<TotalFinalizadoraDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => TotalFinalizadoraDTO.fromJson(value)).toList();
  }

  static Map<String, TotalFinalizadoraDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, TotalFinalizadoraDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = TotalFinalizadoraDTO.fromJson(value));
    }
    return map;
  }
}