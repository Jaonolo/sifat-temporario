part of openapi.api;

@JsonSerializable()
class ClienteFatura {
  int? id;

  DateTime? dataEmissao;

  int? idCliente;

  Cliente? cliente;

  BigDecimal? valor = BigDecimal.ZERO();

  int? idNota;

  Nota? nota;

  int? numeroFatura;

  String? observacao;

  DateTime? dataCancelamento;

  @JsonKey(defaultValue: [])
  List<Conta> contas = [];

  @JsonKey(defaultValue: [])
  List<ClienteConta> clienteContas = [];

  ClienteFatura();

  @override
  String toString() {
    return 'ClienteFatura{id: $id, dataEmissao: $dataEmissao, idCliente: $idCliente, cliente: $cliente, valor: $valor, idNota: $idNota, nota: $nota, numeroFatura: $numeroFatura, observacao: $observacao, dataCancelamento: $dataCancelamento, contas: $contas, clienteContas: $clienteContas}';
  }

  factory ClienteFatura.fromJson(Map<String, dynamic> json) =>
      _$ClienteFaturaFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteFaturaToJson(this);

  static List<ClienteFatura> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteFatura.fromJson(value)).toList();
  }

  static Map<String, ClienteFatura> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ClienteFatura>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteFatura.fromJson(value));
    }
    return map;
  }
}
