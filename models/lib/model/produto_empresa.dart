part of openapi.api;

@JsonSerializable()
class ProdutoEmpresa implements Cloneable {
  int? id;

  int? idEmpresa;

  int? idProduto;

  Produto? produto = Produto();

  bool? controlaLocalEstocado;

  LocalProducao? localProducao1;

  LocalProducao? localProducao2;

  bool? producaoDefinidoComponentes;

  ControleCadastro? controleCadastro;

  InformacaoNutricional? informacaoNutricional;

  bool? tabelaPreco;

  bool? precoVariavel;

  bool? multiplicao;

  bool? fracionamento;

  bool? avisaEstoqueMinimo;

  bool? cobraTaxaServico;

  bool? imprimeFichaConsumo;

  bool? ecommerce;

  bool? estocado;

  bool? itemBalanca;

  bool? itemCotacao;

  bool? montagem;

  bool? enviarCarga;

  @JsonKey(defaultValue: [])
  List<GradeEmpresa> grades = [];

  int? getId;

  int? versao;

  ProdutoEmpresa();

  GradeEmpresa? get gradePadrao =>
      this.grades.firstWhere((ge) {
        if (ge.idGrade != null)
          if (produto!.getGradePadrao != null &&
              produto!.getGradePadrao!.id == ge.idGrade)
            return true;
        return false;
      });

  List<GradeEmpresa> get gradesAtivas =>
      this.grades.where((ge) => ge.ativo! && ge.grade != null &&
          ge.grade!.ativo!).toList();

  @override
  String toString() {
    return 'ProdutoEmpresa[id=$id, idEmpresa=$idEmpresa, idProduto=$idProduto, produto=$produto, controlaLocalEstocado=$controlaLocalEstocado, localProducao1=$localProducao1, localProducao2=$localProducao2, producaoDefinidoComponentes=$producaoDefinidoComponentes, controleCadastro=$controleCadastro, informacaoNutricional=$informacaoNutricional, tabelaPreco=$tabelaPreco, precoVariavel=$precoVariavel, multiplicao=$multiplicao, fracionamento=$fracionamento, avisaEstoqueMinimo=$avisaEstoqueMinimo, cobraTaxaServico=$cobraTaxaServico, imprimeFichaConsumo=$imprimeFichaConsumo, ecommerce=$ecommerce, estocado=$estocado, itemBalanca=$itemBalanca, itemCotacao=$itemCotacao, montagem=$montagem, enviarCarga=$enviarCarga, grades=$grades, getId=$getId, versao=$versao, ]';
  }

  factory ProdutoEmpresa.fromJson(Map<String, dynamic> json) =>
      _$ProdutoEmpresaFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutoEmpresaToJson(this);

  static List<ProdutoEmpresa> listFromJson(List<dynamic> json) {
    return json.map((value) => ProdutoEmpresa.fromJson(value)).toList();
  }

  static Map<String, ProdutoEmpresa> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ProdutoEmpresa>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ProdutoEmpresa.fromJson(value));
    }
    return map;
  }

  @override
  clone() {
    return ProdutoEmpresa.fromJson(jsonDecode(jsonEncode(this.toJson())));
  }
}
