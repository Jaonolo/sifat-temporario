part of openapi.api;

@JsonSerializable()
class Produto {

  int? id;

  int? idEmpresa;

  int? codigoInterno;

  String? codigo;

  String? descricao;

  String? descricaoAbreviada;

  String? referencia;

  String? detalhes;

  String? mixPreco;

  //enum mixPrecoEnum {  NENHUM,  MIX_SEM_PRECO,  MIX_COM_PRECO_OPCIONAL,  MIX_COM_PRECO_OBRIGATORIO,  };{

  String? unidade;

  //enum unidadeEnum {  AMPOLA,  BALDE,  BANDEJ,  BARRA,  BISNAG,  BLOCO,  BOBINA,  BOMB,  CAPS,  CART,  CENTO,  CJ,  CM,  CM2,  CX,  CX10,  CX100,  CX15,  CX2,  CX20,  CX25,  CX3,  CX5,  CX50,  DISP,  DUZIA,  EMBAL,  FARDO,  FOLHA,  FRASCO,  GALAO,  GF,  GRAMAS,  JOGO,  K,  KG,  KIT,  LATA,  LITRO,  M,  M2,  M3,  MILHEI,  ML,  MWH,  PACOTE,  PALETE,  PARES,  PC,  POTE,  RESMA,  ROLO,  SACO,  SACOLA,  TAMBOR,  TANQUE,  TON,  TUBO,  UN,  UNID,  VASIL,  VIDRO,  };{

  String? tipo;

  //enum tipoEnum {  Produto para revenda,  Imobilizado,  Matéria prima,  Uso ou consumo,  Serviço,  Produto fabricação própria,  Embalagem,  Venda com derivados,  Outros,  };{

  ProdutoMarca? marca;

  int? idGrupo;

  ProdutoGrupo? grupo;

  ProdutoFamilia? familia;

  String? unidadeCompra;

  //enum unidadeCompraEnum {  AMPOLA,  BALDE,  BANDEJ,  BARRA,  BISNAG,  BLOCO,  BOBINA,  BOMB,  CAPS,  CART,  CENTO,  CJ,  CM,  CM2,  CX,  CX10,  CX100,  CX15,  CX2,  CX20,  CX25,  CX3,  CX5,  CX50,  DISP,  DUZIA,  EMBAL,  FARDO,  FOLHA,  FRASCO,  GALAO,  GF,  GRAMAS,  JOGO,  K,  KG,  KIT,  LATA,  LITRO,  M,  M2,  M3,  MILHEI,  ML,  MWH,  PACOTE,  PALETE,  PARES,  PC,  POTE,  RESMA,  ROLO,  SACO,  SACOLA,  TAMBOR,  TANQUE,  TON,  TUBO,  UN,  UNID,  VASIL,  VIDRO,  };{

  BigDecimal? quantidadeCompra = BigDecimal.ZERO();

  int? validadeDias;

  int? garantiaDias;

  DateTime? dataForaLinha;

  BigDecimal? largura = BigDecimal.ZERO();

  BigDecimal? altura = BigDecimal.ZERO();

  BigDecimal? comprimento = BigDecimal.ZERO();

  BigDecimal? cubagem = BigDecimal.ZERO();

  int? volumes;

  BigDecimal? pesoBruto = BigDecimal.ZERO();

  String? pacote;

  //enum pacoteEnum {  Nenhum,  Combo,  Composto,  Rodízio,  Cesta/Kit,  Adicionais,  };{

  String? grade;

  //enum gradeEnum {  Nenhuma,  Tamanho,  Código,  Cor,  Tamanho e Cor,  Lote,  Série,  Lote e Série,  };{

  ProdutoFiscal? fiscal;

  @JsonKey(defaultValue: [])
  List<Grade> grades = [];

  @JsonKey(defaultValue: [])
  List<ProdutoMenu> menus = [];

  @JsonKey(defaultValue: [])
  List<ProdutoArquivo> arquivos = [];

  int? versao;

  Produto();

  @override
  String toString() {
    return 'Produto[id=$id, idEmpresa=$idEmpresa, codigoInterno=$codigoInterno, codigo=$codigo, descricao=$descricao, descricaoAbreviada=$descricaoAbreviada, referencia=$referencia, detalhes=$detalhes, unidade=$unidade, tipo=$tipo, marca=$marca, idGrupo=$idGrupo, grupo=$grupo, familia=$familia, dataForaLinha=$dataForaLinha, pacote=$pacote, grade=$grade, fiscal=$fiscal, grades=$grades, menus=$menus, versao=$versao, ]';
  }

  factory Produto.fromJson(Map<String, dynamic> json) =>
      _$ProdutoFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutoToJson(this);

  static List<Produto> listFromJson(List<dynamic> json) {
    return json.map((value) => Produto.fromJson(value)).toList();
  }

  static Map<String, Produto> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Produto>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Produto.fromJson(value));
    }
    return map;
  }

  ProdutoArquivo? arquivoPrincipal() {
    ProdutoArquivo? principal;
    this.arquivos.forEach((element) {
      if (element.principal!)
        principal = element;
    });
    return principal;
  }

  Grade? get getGradePadrao {
    return grades.firstWhere((grade) => grade.padrao!);
  }

}

