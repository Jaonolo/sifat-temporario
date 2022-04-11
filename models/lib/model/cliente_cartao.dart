part of openapi.api;

@JsonSerializable()
class ClienteCartao {

  int? id;

  int? idCliente;

  String? numero;

  BandeiraCartao? bandeira;

  String? status;

  //enum statusEnum {  LIBERADO,  BLOQUEADO,  EXPIRADO,  SEM_SALDO,  };{

  DateTime? validade;

  int? vencimento;

  BigDecimal? limite = BigDecimal.ZERO();

  BigDecimal? saldo = BigDecimal.ZERO();

  int? token;

  ClienteCartao();

  @override
  String toString() {
    return 'ClienteCartao[id=$id, idCliente=$idCliente, numero=$numero, bandeira=$bandeira, status=$status, validade=$validade, vencimento=$vencimento, limite=$limite, saldo=$saldo, token=$token, ]';
  }

  factory ClienteCartao.fromJson(Map<String, dynamic> json) =>
      _$ClienteCartaoFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteCartaoToJson(this);

  static List<ClienteCartao> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteCartao.fromJson(value)).toList();
  }

  static Map<String, ClienteCartao> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ClienteCartao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteCartao.fromJson(value));
    }
    return map;
  }
}

