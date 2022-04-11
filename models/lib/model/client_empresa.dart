part of openapi.api;

@JsonSerializable()
class ClientEmpresa {

  int? id;

  String? clientSecret;

  bool? ativo;

  int? idEmpresa;

  int? idClient;

  Client? client;

  DateTime? ultimaComunicacao;

  ClientEmpresa();

  @override
  String toString() {
    return 'ClientEmpresa[id=$id, clientSecret=$clientSecret, ativo=$ativo, idEmpresa=$idEmpresa, idClient=$idClient, aplicativo=$client, ultimaComunicacao=$ultimaComunicacao, ]';
  }

  factory ClientEmpresa.fromJson(Map<String, dynamic> json) =>
      _$ClientEmpresaFromJson(json);

  Map<String, dynamic> toJson() => _$ClientEmpresaToJson(this);

  static List<ClientEmpresa> listFromJson(List<dynamic> json) {
    return json.map((value) => ClientEmpresa.fromJson(value)).toList();
  }

  static Map<String, ClientEmpresa> mapFromJson(Map<String, dynamic> json) {
    Map<String, ClientEmpresa> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClientEmpresa.fromJson(value));
    }
    return map;
  }
}

