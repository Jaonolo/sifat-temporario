part of openapi.api;

@JsonSerializable()
class GradeEmpresa implements Cloneable {

  int? id;

  int? idGrade;

  Grade? grade;

  int? idProdutoEmpresa;

  ProdutoEmpresa? produtoEmpresa;

  String? lote;

  String? serie;

  Promocao? promocao;

  BigDecimal? precoCustoCompra = BigDecimal.ZERO();

  BigDecimal? precoCustoContabil = BigDecimal.ZERO();

  BigDecimal? precoCustoFixo = BigDecimal.ZERO();

  BigDecimal? precoCMC = BigDecimal.ZERO();

  BigDecimal? precoCustoAnterior = BigDecimal.ZERO();

  BigDecimal? precoCustoMedio = BigDecimal.ZERO();

  BigDecimal? precoCustoPromocional = BigDecimal.ZERO();

  BigDecimal? precoCustoMontagem = BigDecimal.ZERO();

  BigDecimal? precoUnitario = BigDecimal.ZERO();

  BigDecimal? precoPromocional = BigDecimal.ZERO();

  BigDecimal? percentualComissaoVendedor = BigDecimal.ZERO();

  BigDecimal? percentualDesconto = BigDecimal.ZERO();

  BigDecimal? percentualDescontoSupervisor = BigDecimal.ZERO();

  BigDecimal? estoqueMinimo = BigDecimal.ZERO();

  BigDecimal? estoqueMaximo = BigDecimal.ZERO();

  BigDecimal? proporcaoBaixa = BigDecimal.ZERO();

  BigDecimal? percentualQuebra = BigDecimal.ZERO();

  @JsonKey(defaultValue: [])
  List<GradeEmpresaPreco> precos = [];

  bool? ativo;

  GradeEmpresa();

  BigDecimal precoVenda(int idTabelaPreco) {
    BigDecimal preco = BigDecimal.ZERO();
    precos.forEach((element) {
      if (element.ativo! && element.tabelaPreco!.ativo) {
        if (element.idTabelaPreco == idTabelaPreco) {
          preco = element.precoVenda ?? BigDecimal.ZERO();
        }
      }
    });
    return preco;
  }

  //Pega o preco de venda da tabelaPreco padrao **Usado autoPesagem**
  BigDecimal get getPrecoVenda {
    GradeEmpresaPreco gep = precos.firstWhere((gep) =>
    gep.tabelaPreco != null && gep.tabelaPreco!.padrao,
        orElse: () => GradeEmpresaPreco());

    if (gep.precoVenda != null)
      return gep.precoVenda!;


    return BigDecimal.ZERO();
  }


  @override
  String toString() {
    return 'GradeEmpresa[id=$id, idGrade=$idGrade, grade=$grade, idProdutoEmpresa=$idProdutoEmpresa, produtoEmpresa=$produtoEmpresa, lote=$lote, serie=$serie, promocao=$promocao, precoCustoCompra=$precoCustoCompra, precoCustoContabil=$precoCustoContabil, precoCustoFixo=$precoCustoFixo, precoCMC=$precoCMC, precoCustoAnterior=$precoCustoAnterior, precoCustoMedio=$precoCustoMedio, precoCustoPromocional=$precoCustoPromocional, precoCustoMontagem=$precoCustoMontagem, precoUnitario=$precoUnitario, precoPromocional=$precoPromocional, percentualComissaoVendedor=$percentualComissaoVendedor, percentualDesconto=$percentualDesconto, percentualDescontoSupervisor=$percentualDescontoSupervisor, estoqueMinimo=$estoqueMinimo, estoqueMaximo=$estoqueMaximo, proporcaoBaixa=$proporcaoBaixa, percentualQuebra=$percentualQuebra, precos=$precos ativo=$ativo, ]';
  }

  factory GradeEmpresa.fromJson(Map<String, dynamic> json) =>
      _$GradeEmpresaFromJson(json);

  Map<String, dynamic> toJson() => _$GradeEmpresaToJson(this);

  static List<GradeEmpresa> listFromJson(List<dynamic> json) {
    return json.map((value) =>
        GradeEmpresa.fromJson(value)).toList();
  }

  static Map<String, GradeEmpresa> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, GradeEmpresa>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = GradeEmpresa.fromJson(value));
    }
    return map;
  }

  @override
  clone() {
    return GradeEmpresa.fromJson(jsonDecode(jsonEncode(this.toJson())));
  }
}

