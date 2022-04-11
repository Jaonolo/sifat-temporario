part of openapi.api;

@JsonSerializable()
class ProdutoMenuComponenteEmpresaPreco {
  int? id;

  int? idProdutoMenuComponenteEmpresa;

  int? idTabelaPreco;

  TabelaPreco? tabelaPreco;

  BigDecimal? valorComponente = BigDecimal.ZERO();

  ProdutoMenuComponenteEmpresaPreco();

  @override
  String toString() {
    return 'MenuProdutoComponenteEmpresaPreco[id=$id, idProdutoMenuComponenteEmpresa=$idProdutoMenuComponenteEmpresa, idTabelaPreco=$idTabelaPreco, tabelaPreco=$tabelaPreco, valorComponente=$valorComponente, ]';
  }

  factory ProdutoMenuComponenteEmpresaPreco.fromJson(
      Map<String, dynamic> json) =>
      _$ProdutoMenuComponenteEmpresaPrecoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProdutoMenuComponenteEmpresaPrecoToJson(this);

  static List<ProdutoMenuComponenteEmpresaPreco> listFromJson(
      List<dynamic> json) {
    return json.map((value) =>
        ProdutoMenuComponenteEmpresaPreco.fromJson(value)).toList();
  }

  static Map<String, ProdutoMenuComponenteEmpresaPreco> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ProdutoMenuComponenteEmpresaPreco>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ProdutoMenuComponenteEmpresaPreco.fromJson(value));
    }
    return map;
  }
}