part of openapi.api;

@JsonSerializable()
class ClienteAutorizado {

  int? id;

  int? idPessoa;

  Pessoa? pessoa;

  int? idCliente;

  Cliente? cliente;

  String? tipoVinculado;

  bool? ativo;

  ClienteAutorizado();

  @override
  String toString() {
    return 'ClienteAutorizado[id=$id, idPessoa=$idPessoa, pessoa=$pessoa, idCliente=$idCliente, cliente=$cliente, tipoVinculado=$tipoVinculado, ativo=$ativo, ]';
  }

  factory ClienteAutorizado.fromJson(Map<String, dynamic> json) =>
      _$ClienteAutorizadoFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteAutorizadoToJson(this);

  static List<ClienteAutorizado> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteAutorizado.fromJson(value)).toList();
  }

  static Map<String, ClienteAutorizado> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ClienteAutorizado>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteAutorizado.fromJson(value));
    }
    return map;
  }
}

