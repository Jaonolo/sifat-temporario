part of openapi.api;

@JsonSerializable()
class ClienteCrediario {

  int? diaVencimento;

  BigDecimal? limiteCredito;

  BigDecimal? limiteDisponivel;

  BigDecimal? saldoHaver;

  String? referenciaPessoal;

  String? referenciaComercial;

  String? tipoFaturamento = "MENSAL";

  //enum tipoFaturamentoEnum {  NAO_FATURA,  SEMANAL,  QUINZENAL,  MENSAL,  };{

  bool? caucao;

  String? contrato;

  int? idStatusCredito;

  StatusCredito? statusCredito;

  ClienteCrediario();

  @override
  String toString() {
    return 'ClienteCrediario[diaVencimento=$diaVencimento, limiteCredito=$limiteCredito, limiteDisponivel=$limiteDisponivel; saldoHaver=$saldoHaver, referenciaPessoal=$referenciaPessoal, referenciaComercial=$referenciaComercial, tipoFaturamento=$tipoFaturamento, caucao=$caucao, contrato=$contrato, idStatusCredito=$idStatusCredito, statusCredito=$statusCredito, ]';
  }

  factory ClienteCrediario.fromJson(Map<String, dynamic> json) =>
      _$ClienteCrediarioFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteCrediarioToJson(this);

  static List<ClienteCrediario> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteCrediario.fromJson(value)).toList();
  }

  static Map<String, ClienteCrediario> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ClienteCrediario>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteCrediario.fromJson(value));
    }
    return map;
  }
}

