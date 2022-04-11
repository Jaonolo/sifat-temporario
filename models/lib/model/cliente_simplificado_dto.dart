part of openapi.api;

@JsonSerializable()
class ClienteSimplificadoDTO {
  int? id;

  String? apelido;

  String? endereco;

  String? telefone;

  ClienteSimplificadoDTO();

  @override
  String toString() {
    return 'ClienteSimplificadoDTO{id: $id, apelido: $apelido, endereco: $endereco, telefone: $telefone}';
  }

  factory ClienteSimplificadoDTO.fromJson(Map<String, dynamic> json) =>
      _$ClienteSimplificadoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteSimplificadoDTOToJson(this);

  static List<ClienteSimplificadoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteSimplificadoDTO.fromJson(value)).toList();
  }

  static Map<String, ClienteSimplificadoDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ClienteSimplificadoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteSimplificadoDTO.fromJson(value));
    }
    return map;
  }
}
