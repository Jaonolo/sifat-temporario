part of openapi.api;

@JsonSerializable()
class ClienteContaConcentrador {
  int? id;
  ClienteConta? clienteConta;
  bool? sincronizado;
  int? idClienteContaCentral;
  String? erro;

  ClienteContaConcentrador();

  @override
  String toString() {
    return 'ClienteContaConcentrador{id: $id, clienteConta: $clienteConta, sincronizado: $sincronizado, idClienteContaCentral: $idClienteContaCentral, erro: $erro}';
  }

  factory ClienteContaConcentrador.fromJson(Map<String, dynamic> json) =>
      _$ClienteContaConcentradorFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteContaConcentradorToJson(this);

  static List<ClienteContaConcentrador> listFromJson(List<dynamic> json) {
    return json
        .map((value) => ClienteContaConcentrador.fromJson(value))
        .toList();
  }

  static Map<String, ClienteContaConcentrador> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, ClienteContaConcentrador> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteContaConcentrador.fromJson(value));
    }
    return map;
  }
}
