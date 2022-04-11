part of openapi.api;

class ClienteReferenciaPK {

  int? idPessoa;

  int? idCliente;

  ClienteReferenciaPK();

  @override
  String toString() {
    return 'ClienteReferenciaPK[idPessoa=$idPessoa, idCliente=$idCliente, ]';
  }

  ClienteReferenciaPK.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['idPessoa'] == null) {
      idPessoa = null;
    } else {
      idPessoa = json['idPessoa'];
    }
    if (json['idCliente'] == null) {
      idCliente = null;
    } else {
      idCliente = json['idCliente'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (idPessoa != null)
      json['idPessoa'] = idPessoa;
    if (idCliente != null)
      json['idCliente'] = idCliente;
    return json;
  }

  static List<ClienteReferenciaPK> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteReferenciaPK.fromJson(value)).toList();
  }

  static Map<String, ClienteReferenciaPK> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ClienteReferenciaPK>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteReferenciaPK.fromJson(value));
    }
    return map;
  }
}

