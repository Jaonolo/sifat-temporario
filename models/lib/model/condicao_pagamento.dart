part of openapi.api;

@JsonSerializable()
class CondicaoPagamento {

  int? id;

  int? idEmpresa;

  String? descricao;

  BigDecimal? taxaMensal;

  BigDecimal? valorMinimo;

  FinalizadoraEmpresa? finalizadoraEmpresa;

  String? operacao;

  //enum operacaoEnum {  COMPRA,  VENDA,  };{

  String? acrescimoDesconto;

  //enum acrescimoDescontoEnum {  ACRESCIMO,  DESCONTO,  };{

  BigDecimal? percentualAcrescimoDesconto;

  BigDecimal? percentualEntradaMinima;

  bool? exigeAutorizacao;

  bool? ativo;

  int? versao;

  CondicaoPagamento();

  @override
  String toString() {
    return 'CondicaoPagamento[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, taxaMensal=$taxaMensal, valorMinimo=$valorMinimo, finalizadoraEmpresa=$finalizadoraEmpresa, operacao=$operacao, acrescimoDesconto=$acrescimoDesconto, percentualAcrescimoDesconto=$percentualAcrescimoDesconto, percentualEntradaMinima=$percentualEntradaMinima, exigeAutorizacao=$exigeAutorizacao, ativo=$ativo, versao=$versao, ]';
  }

  factory CondicaoPagamento.fromJson(Map<String, dynamic> json) =>
      _$CondicaoPagamentoFromJson(json);

  Map<String, dynamic> toJson() => _$CondicaoPagamentoToJson(this);

  static List<CondicaoPagamento> listFromJson(List<dynamic> json) {
    return json.map((value) => CondicaoPagamento.fromJson(value)).toList();
  }

  static Map<String, CondicaoPagamento> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CondicaoPagamento>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CondicaoPagamento.fromJson(value));
    }
    return map;
  }
}

