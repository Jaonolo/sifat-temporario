part of openapi.api;

class ClienteOcorrencia {

  int? id;

  int? idCliente;

  DateTime? dataEmissao;

  String? ocorrencia;

  ClienteOcorrencia();

  @override
  String toString() {
    return 'ClienteOcorrencia[id=$id, idCliente=$idCliente, dataEmissao=$dataEmissao, ocorrencia=$ocorrencia, ]';
  }

  ClienteOcorrencia.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idCliente'] == null) {
      idCliente = null;
    } else {
      idCliente = json['idCliente'];
    }
    if (json['dataEmissao'] == null) {
      dataEmissao = null;
    } else {
      dataEmissao = DateTime.parse(json['dataEmissao']);
    }
    if (json['ocorrencia'] == null) {
      ocorrencia = null;
    } else {
      ocorrencia = json['ocorrencia'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idCliente != null)
      json['idCliente'] = idCliente;
    if (dataEmissao != null)
      json['dataEmissao'] =
      dataEmissao == null ? null : dataEmissao!.toIso8601String();
    if (ocorrencia != null)
      json['ocorrencia'] = ocorrencia;
    return json;
  }

  static List<ClienteOcorrencia> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteOcorrencia.fromJson(value)).toList();
  }

  static Map<String, ClienteOcorrencia> mapFromJson(Map<String, dynamic> json) {
    Map<String, ClienteOcorrencia> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteOcorrencia.fromJson(value));
    }
    return map;
  }
}

