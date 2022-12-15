part of openapi.api;

@JsonSerializable()
class TransacaoCartao {
  int? id;

  int? idEmpresa;

  DateTime? data;

  BigDecimal? valor = BigDecimal.ZERO();

  int? numeroParcelas = 1;

  String? codigoAutorizacao;

  String? nsu;

  bool? sucesso;

  int? idBandeira;

  String? viaCliente;

  String? viaCaixa;

  BandeiraCartao? bandeira;

  String? transacaoSituacao;

  int? idTransacaoCancelamento;

  String? hashUnica;

  String? orderId;

  String? documentoCarteiraDigital;

  TransacaoCartao();

  @override
  String toString() {
    return 'TransacaoCartao[id=$id, idEmpresa=$idEmpresa, data=$data, valor=$valor, numeroParcelas=$numeroParcelas, codigoAutorizacao=$codigoAutorizacao, nsu=$nsu, sucesso=$sucesso, idBandeira=$idBandeira, bandeira=$bandeira, viaCliente=$viaCliente, viaCaixa=$viaCaixa, orderId=$orderId]';
  }

  factory TransacaoCartao.fromJson(Map<String, dynamic> json) =>
      _$TransacaoCartaoFromJson(json);

  Map<String, dynamic> toJson() => _$TransacaoCartaoToJson(this);

  static List<TransacaoCartao> listFromJson(List<dynamic> json) {
    return json.map((value) => TransacaoCartao.fromJson(value)).toList();
  }

  static Map<String, TransacaoCartao> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, TransacaoCartao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = TransacaoCartao.fromJson(value));
    }
    return map;
  }
}
