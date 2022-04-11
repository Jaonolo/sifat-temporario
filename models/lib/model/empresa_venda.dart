part of openapi.api;

@JsonSerializable()
class EmpresaVenda {
  BigDecimal? confirmarValorSuperior = BigDecimal.ZERO();

  BigDecimal? confirmarQuantidadeSuperior = BigDecimal.ZERO();

  bool? informarObservacaoItem;

  String? impressaoVenda = 'IMPRIME';

  //enum impressaoVendaEnum {  NAO_IMPRIME,  PERGUNTA,  IMPRIME,  };{

  BigDecimal? percentualDescontoVenda = BigDecimal.ZERO();

  BigDecimal? percentualDescontoItem = BigDecimal.ZERO();

  String? descontoExcedenteVenda = 'APENAS_AVISAR';

  //enum descontoExcedenteVendaEnum {  NAO_VENDER,  VENDER_NORMALMENTE,  APENAS_AVISAR,  VENDER_SUPERVISOR,  };{

  String? descontoExcedenteItem = 'APENAS_AVISAR';

  //enum descontoExcedenteItemEnum {  NAO_VENDER,  VENDER_NORMALMENTE,  APENAS_AVISAR,  VENDER_SUPERVISOR,  };{

  String? origemDesconto = 'GERAL';

  //enum origemDescontoEnum {  GERAL,  CADASTRO_PRODUTO  };

  bool? imporMaximoDescontoItemSupervisor;

  String? codigoBalanca = 'PESO_PRODUTO';

  //enum codigoBalancaEnum {  PESO_PRODUTO,  PRECO_PRODUTO,  };{

  int? digitosProduto = 0;

  String? vendaPromocao = 'VALOR_LIQUIDO';

  //enum vendaPromocaoEnum {  VALOR_LIQUIDO,  DESCONTO_ITEM,  };{

  String? mensagemRodape;

  EmpresaVenda();

  @override
  String toString() {
    return 'EmpresaVenda[confirmarValorSuperior=$confirmarValorSuperior, confirmarQuantidadeSuperior=$confirmarQuantidadeSuperior, informarObservacaoItem=$informarObservacaoItem, impressaoVenda=$impressaoVenda, percentualDescontoVenda=$percentualDescontoVenda, descontoExcedenteVenda=$descontoExcedenteVenda, descontoExcedenteItem=$descontoExcedenteItem, imporMaximoDescontoItemSupervisor=$imporMaximoDescontoItemSupervisor, codigoBalanca=$codigoBalanca, digitosProduto=$digitosProduto, vendaPromocao=$vendaPromocao, mensagemRodape=$mensagemRodape, ]';
  }

  factory EmpresaVenda.fromJson(Map<String, dynamic> json) =>
      _$EmpresaVendaFromJson(json);

  Map<String, dynamic> toJson() => _$EmpresaVendaToJson(this);

  static List<EmpresaVenda> listFromJson(List<dynamic> json) {
    return json.map((value) => EmpresaVenda.fromJson(value)).toList();
  }

  static Map<String, EmpresaVenda> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EmpresaVenda>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EmpresaVenda.fromJson(value));
    }
    return map;
  }
}
