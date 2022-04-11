part of openapi.api;

@JsonSerializable()
class Finalizadora {

  int? id;

  int? idEmpresa;

  int? codigo;

  String? descricao;

  String? tipo;

  //enum tipoEnum {  Banco,  Cartão de Crédito,  Cartão de Débito,  Cheque,  Delivery,  Dinheiro,  Faturar,  Outras,  Prazo,  Recibo de Frete (1ª Via),  Recibo de Frete (2ª Via),  TEF,  POS,  Voucher,  };{

  BigDecimal? valorMaximo = BigDecimal.ZERO();

  String? tipoPagamento;

  //enum tipoPagamentoEnum {  VISTA,  PRAZO,  OUTRA,  };{

  String? tipoCartao;

  //enum tipoCartaoEnum {  COMUM,  COMBUSTIVEL,  ISYBUY,  };{

  String? finalizadoraRFB;

  //enum finalizadoraRFBEnum {  DINHEIRO,  CHEQUE,  CARTAO_CREDITO,  CARTAO_DEBITO,  CREDITO_LOJA,  VALE_ALIMENTACAO,  VALE_REFEICAO,  VALE_PRESENTE,  VALE_COMBUSTIVEL,  OUTROS,  };{

  int? versao;

  Finalizadora();

  @override
  String toString() {
    return 'Finalizadora[id=$id, idEmpresa=$idEmpresa, codigo=$codigo, descricao=$descricao, tipo=$tipo, valorMaximo=$valorMaximo, tipoPagamento=$tipoPagamento, tipoCartao=$tipoCartao, finalizadoraRFB=$finalizadoraRFB, versao=$versao, ]';
  }

  factory Finalizadora.fromJson(Map<String, dynamic> json) =>
      _$FinalizadoraFromJson(json);

  Map<String, dynamic> toJson() => _$FinalizadoraToJson(this);

  static List<Finalizadora> listFromJson(List<dynamic> json) {
    return json.map((value) => Finalizadora.fromJson(value)).toList();
  }

  static Map<String, Finalizadora> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Finalizadora>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Finalizadora.fromJson(value));
    }
    return map;
  }
}

