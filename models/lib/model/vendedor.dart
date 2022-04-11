part of openapi.api;

@JsonSerializable()
class Vendedor {

  int? codigoVenda;

  String? identfid;

  BigDecimal? percentualComissao;

  TabelaPreco? tabelaPreco;

  String? tipoComissao;

  //enum tipoComissaoEnum {  FIXO,  PRODUTO,  TABELA_PRECO,  };{
  Vendedor();

  @override
  String toString() {
    return 'Vendedor[codigoVenda=$codigoVenda, identfid=$identfid, percentualComissao=$percentualComissao, tabelaPreco=$tabelaPreco, tipoComissao=$tipoComissao, ]';
  }

  factory Vendedor.fromJson(Map<String, dynamic> json) =>
      _$VendedorFromJson(json);

  Map<String, dynamic> toJson() => _$VendedorToJson(this);

  static List<Vendedor> listFromJson(List<dynamic> json) {
    return json.map((value) => Vendedor.fromJson(value)).toList();
  }

  static Map<String, Vendedor> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Vendedor>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Vendedor.fromJson(value));
    }
    return map;
  }
}

