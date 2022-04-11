part of openapi.api;

@JsonSerializable()
class ClienteConta {

  int? id;
  int? idCliente;
  Cliente? cliente;
  int? idAutorizado;
  ClienteAutorizado? autorizado;
  DateTime? dataLancamento;
  String? tipoOperacao;

  // enum{ DEBITO , CREDITO}
  BigDecimal? valor;
  BigDecimal? saldo;
  bool? confirmado;
  int? idNota;
  Nota? nota;
  int? idOperacaoCaixa;
  Operacao? operacaoCaixa;
  int? idTurno;
  Turno? turno;
  int? idClienteFatura;
  ClienteFatura? clienteFatura;
  String? observacao;
  ClienteContaConcentrador? clienteContaConcentrador;

  ClienteConta();


  @override
  String toString() {
    return 'ClienteConta{id: $id, idCliente: $idCliente, cliente: $cliente, idAutorizado: $idAutorizado, autorizado: $autorizado, dataLancamento: $dataLancamento, tipoOperacao: $tipoOperacao, valor: $valor, saldo: $saldo, confirmado: $confirmado, idNota: $idNota, nota: $nota, idOperacaoCaixa: $idOperacaoCaixa, operacaoCaixa: $operacaoCaixa, idTurno: $idTurno, turno: $turno, idClienteFatura: $idClienteFatura, clienteFatura: $clienteFatura, observacao: $observacao, clienteContaConcentrador: $clienteContaConcentrador}';
  }

  factory ClienteConta.fromJson(Map<String, dynamic> json) =>
      _$ClienteContaFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteContaToJson(this);

  static List<ClienteConta> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteConta.fromJson(value)).toList();
  }

  static Map<String, ClienteConta> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ClienteConta>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteConta.fromJson(value));
    }
    return map;
  }
}