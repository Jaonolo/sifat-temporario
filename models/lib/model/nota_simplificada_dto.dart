part of openapi.api;

@JsonSerializable()
class NotaSimplificadaDTO {
  int? idNota;

  String? statusVenda;

  //enum statusVendaEnum {  ABERTA,  FECHADA,  JUNTADA,  RECEBIDA,  CANCELADA,  }

  BigDecimal? valorVenda;

  int? numeroVenda;

  DateTime? data;

  NotaSimplificadaDTO();

  @override
  String toString() {
    return 'NotaSimplificadaDTO{idNota: $idNota, statusVenda: $statusVenda, valorVenda: $valorVenda, numeroVenda: $numeroVenda, data: $data}';
  }

  factory NotaSimplificadaDTO.fromJson(Map<String, dynamic> json) =>
      _$NotaSimplificadaDTOFromJson(json);

  Map<String, dynamic> toJson() => _$NotaSimplificadaDTOToJson(this);

  static List<NotaSimplificadaDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => NotaSimplificadaDTO.fromJson(value)).toList();
  }

  static Map<String, NotaSimplificadaDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, NotaSimplificadaDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = NotaSimplificadaDTO.fromJson(value));
    }
    return map;
  }

}
