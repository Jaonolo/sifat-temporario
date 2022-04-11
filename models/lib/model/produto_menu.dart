part of openapi.api;

@JsonSerializable()
class ProdutoMenu implements Cloneable {

  int? id;

  int? idEmpresa;

  String? descricao;

  bool? compartilhado;

  String? tipo;

  //enum tipoEnum {  OBSERVACAO,  COMPONENTE_FIXO,  COMPONENTE_EXTRA,  };{

  int? indice;

  int? quantidadeMinima;

  int? quantidadeMaxima;

  BigDecimal? valorTotal = BigDecimal.ZERO();

  @JsonKey(defaultValue: [])
  List<ProdutoMenuComponente> componentes = [];

  int? versao;

  ProdutoMenu();

  @override
  String toString() {
    return 'ProdutoMenu[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, compartilhado=$compartilhado, tipo=$tipo, indice=$indice, quantidadeMinima=$quantidadeMinima, quantidadeMaxima=$quantidadeMaxima, valorTotal=$valorTotal, componentes=$componentes, versao=$versao, ]';
  }

  factory ProdutoMenu.fromJson(Map<String, dynamic> json) =>
      _$ProdutoMenuFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutoMenuToJson(this);

  static List<ProdutoMenu> listFromJson(List<dynamic> json) {
    return json.map((value) => ProdutoMenu.fromJson(value)).toList();
  }

  static Map<String, ProdutoMenu> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ProdutoMenu>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ProdutoMenu.fromJson(value));
    }
    return map;
  }

  @override
  clone() {
    return ProdutoMenu.fromJson(jsonDecode(jsonEncode(this.toJson())));
  }
}

