part of openapi.api;

@JsonSerializable()
class NotaItem implements Cloneable {
  int? id;

  int? idItemPai;

  int? idNota;

  Nota? nota;

  String? tipo;

  //eBigDecimal tipoEBigDecimal {  ITEM,  OBSERVACAO,  ADICIONAL,  COMBO,  ITEM_COMBO,  COMPOSTO,  ITEM_COMPOSTO,  COMBINADO,  ITEM_COMBINADO,  RODIZIO,  ITEM_RODIZIO,  CESTA,  ITEM_CESTA,  MENU,  GORJETA,  INGRESSO,  };{

  int? idEstacao;

  int? idVendedor;

  Funcionario? vendedor;

  int? idUsuario;

  Usuario? usuario;

  DateTime? dataLancamento;

  int? idTurno;

  int? idProdutoEmpresa;

  ProdutoEmpresa? produtoEmpresa;

  int? idGrade;

  GradeEmpresa? grade;

  int? indice;

  String? descricao;

  BigDecimal? quantidade = BigDecimal.ZERO();

  BigDecimal? precoCusto = BigDecimal.ZERO();

  BigDecimal? precoCMC = BigDecimal.ZERO();

  BigDecimal? precoUnitario = BigDecimal.ZERO();

  BigDecimal? precoTotal = BigDecimal.ZERO();

  BigDecimal? taxaServico = BigDecimal.ZERO();

  BigDecimal? valorServico = BigDecimal.ZERO();

  BigDecimal? valorDesconto = BigDecimal.ZERO();

  BigDecimal? valorDescontoRateio = BigDecimal.ZERO();

  BigDecimal? valorLiquido = BigDecimal.ZERO();

  BigDecimal? valorAcrescimoRateio = BigDecimal.ZERO();

  BigDecimal? valorFreteRateio = BigDecimal.ZERO();

  BigDecimal? valorDespesaAcessoriaRateio = BigDecimal.ZERO();

  Promocao? promocao;

  int? quantidadePromocao = 0;

  BigDecimal? precoPromocao = BigDecimal.ZERO();

  BigDecimal? valorDescontoPromocao = BigDecimal.ZERO();

  @JsonKey(defaultValue: false)
  bool cancelado = false;

  String? motivoCancelamento;

  String? observacao;

  ConsumoItem? consumoItem = ConsumoItem();

  @JsonKey(defaultValue: [])
  List<NotaItem> subitens = [];

  int? idConcentrador;

  int? idTabelaPreco;

  TabelaPreco? tabelaPreco;

  NotaItemFiscal? notaItemFiscal;

  @JsonKey(defaultValue: [])
  List<NotaItemDadosIntegracao> dadosIntegracao = [];

  String? roundingMode = 'HALF_UP';

  //enum roundingModeEBigDecimal {  UP,  DOWN,  CEILING,  FLOOR,  HALF_UP,  HALF_DOWN,  HALF_EVEN,  UNNECESSARY,  }

  BigDecimal? somaTotal = BigDecimal.ZERO();

  NotaItem();

  @override
  String toString() {
    return 'NotaItem[id=$id, idItemPai=$idItemPai, idNota=$idNota, nota=$nota, tipo=$tipo, idEstacao=$idEstacao, idVendedor=$idVendedor, vendedor=$vendedor, idUsuario=$idUsuario, usuario=$usuario, dataLancamento=$dataLancamento, idTurno=$idTurno, idProdutoEmpresa=$idProdutoEmpresa, produtoEmpresa=$produtoEmpresa, idGrade=$idGrade, grade=$grade, indice=$indice, descricao=$descricao, quantidade=$quantidade, precoCusto=$precoCusto, precoCMC=$precoCMC, precoUnitario=$precoUnitario, precoTotal=$precoTotal, taxaServico=$taxaServico, valorServico=$valorServico, valorDesconto=$valorDesconto, valorDescontoRateio=$valorDescontoRateio, valorLiquido=$valorLiquido, valorAcrescimoRateio=$valorAcrescimoRateio, valorFreteRateio=$valorFreteRateio, valorDespesaAcessoriaRateio=$valorDespesaAcessoriaRateio, promocao=$promocao, quantidadePromocao=$quantidadePromocao, precoPromocao=$precoPromocao, valorDescontoPromocao=$valorDescontoPromocao, cancelado=$cancelado, motivoCancelamento=$motivoCancelamento, observacao=$observacao, consumoItem=$consumoItem, subitens=$subitens, idConcentrador=$idConcentrador, idTabelaPreco=$idTabelaPreco, tabelaPreco=$tabelaPreco, notaItemFiscal=$notaItemFiscal, dadosIntegracao=$dadosIntegracao, roundingMode=$roundingMode, somaTotal=$somaTotal, ]';
  }

  factory NotaItem.fromJson(Map<String, dynamic> json) =>
      _$NotaItemFromJson(json);

  Map<String, dynamic> toJson() => _$NotaItemToJson(this);

  static List<NotaItem> listFromJson(List<dynamic> json) {
    return json.map((value) => NotaItem.fromJson(value)).toList();
  }

  static Map<String, NotaItem> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, NotaItem>();
    if (json.isNotEmpty) {
      json.forEach(
              (String key, dynamic value) =>
          map[key] = NotaItem.fromJson(value));
    }
    return map;
  }

  @override
  clone() {
    return NotaItem.fromJson(jsonDecode(jsonEncode(this.toJson())));
  }

  List<NotaItem> getItensVendidos() {
    List<NotaItem> list = [];

    if (this.indice != null && this.indice! > 0) {
      list.add(this);
    }

    subitens.forEach((element) {
      list.addAll(element.getItensVendidos());
    });

    return list;
  }


}
