part of openapi.api;

@JsonSerializable()
class CardapioMenu {
  int? id;

  String? tipo;

  //enum tipoEnum {  ITEM,  GRUPO,  COMBINADO,  };{

  String? precoCombinado;

  //enum precoCombinadoEnum {  MAIOR_PRECO,  MEDIA_PRECO,  };{

  int? idProdutoEmpresa;

  ProdutoEmpresa? produto;

  int? idProdutoGrupo;

  ProdutoGrupo? grupo;

  int? indice;

  String? descricao;

  String? backcolor;

  String? fontColor;

  bool? fontBold;

  bool? fontItalic;

  int? fontSize;

  String? icon;

  @JsonKey(defaultValue: [])
  List<TabelaPreco> tabelaPrecos = [];

  @JsonKey(defaultValue: [])
  List<CombinadoTamanho> combinadoTamanhos = [];

  @JsonKey(defaultValue: [])
  List<ProdutoEmpresa> combinadoSabores = [];

  @JsonKey(defaultValue: [])
  List<ProdutoEmpresa> itens = [];

  BibliotecaIcone? icone;

  CardapioMenu();

  @override
  String toString() {
    return 'CardapioMenu[id=$id, tipo=$tipo, precoCombinado=$precoCombinado, idProdutoEmpresa=$idProdutoEmpresa, produto=$produto, idProdutoGrupo=$idProdutoGrupo, grupo=$grupo, indice=$indice, descricao=$descricao, backcolor=$backcolor, fontColor=$fontColor, fontBold=$fontBold, fontItalic=$fontItalic, fontSize=$fontSize, icon=$icon, tabelaPrecos=$tabelaPrecos, combinadoTamanhos=$combinadoTamanhos, combinadoSabores=$combinadoSabores, ]';
  }

  factory CardapioMenu.fromJson(Map<String, dynamic> json) =>
      _$CardapioMenuFromJson(json);

  Map<String, dynamic> toJson() => _$CardapioMenuToJson(this);

  static List<CardapioMenu> listFromJson(List<dynamic> json) {
    return json.map((value) => CardapioMenu.fromJson(value)).toList();
  }

  static Map<String, CardapioMenu> mapFromJson(Map<String, dynamic> json) {
    Map<String, CardapioMenu> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CardapioMenu.fromJson(value));
    }
    return map;
  }
}
