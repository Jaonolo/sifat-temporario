part of openapi.api;

@JsonSerializable()
class Empresa {
  int? id;

  Pessoa? pessoa;

  int? numeroLoja;

  bool? codificacaoEAN;

  String? sugestaoCodigo = "MENOR_CODIGO";

  //enum sugestaoCodigoEnum {  SEM_SUGESTAO,  MENOR_CODIGO,  MAIOR_CODIGO,  };{

  String? tipoEmpresa = "MATRIZ";

  //enum tipoEmpresaEnum {  PLATAFORMA,  INTEGRADOR,  HOLDING,  FRANQUIA,  FRANQUEADO,  MATRIZ,  FILIAL,  };{

  int? idMatriz;

  Empresa? matriz;

  int? idIntegrador;

  Empresa? integrador;

  String? licencaChave;

  ControleCadastro? controleCadastro = ControleCadastro();

  CondicaoPagamento? condicaoPagamentoPadrao;

  StatusCredito? statusCreditoPadrao;

  EmpresaVenda? venda = EmpresaVenda();

  EmpresaFiscal? fiscal;

  EmpresaIntegrador? empresaIntegrador = EmpresaIntegrador();

  int? contadorVenda = 0;

  String? modoValorizacaoEstoque = 'BASICO';

  //enum modoValorizacaoEstoqueEnum {  BASICO,  AVANCADO,  };{

  BigDecimal? taxaRoyalty = BigDecimal.ZERO();

  BigDecimal? taxaMarketing = BigDecimal.ZERO();

  int? versao;

  CredenciaisIfood? credenciaisIfood;

  String? segmento;

  //enum segmentoEnum {  SORVETERIAS_ACAITERIA,  LANCHONETES,  RESTAURANTES,  CAFETERIAS,  CHURRASCARIAS,  PADARIAS,  PIZZARIAS,  TABACARIAS,  FRIOS_LATICINIOS,  EMPORIOS,  MARMITARIA,  OUTROS,  };{

  bool? mixImportado;

  @JsonKey(defaultValue: [])
  List<EmpresaContrato> empresaContratos = [];

  EmpresaFusoHorario? fusoHorario;

  int? idConsultor;

  int? idRegiao;

  bool? confirmado;

  bool? testando;

  DateTime? vencimentoTeste;

  int? idFlowdesk;

  String? ondeNosConheceu;

  //enum ondeNosConheceuEnum {  Google,  Facebook,  Instagram,  Site,  Indicação,  Vi em um estabelecimento,  Outro,  };{

  EmpresaContrato? empresaContrato;

  EmpresaContrato? proximoContrato;

  String? controleTurno = 'POR_USUARIO';

  Empresa();

  @override
  String toString() {
    return 'Empresa[id=$id, pessoa=$pessoa, numeroLoja=$numeroLoja, codificacaoEAN=$codificacaoEAN, sugestaoCodigo=$sugestaoCodigo, tipoEmpresa=$tipoEmpresa, idMatriz=$idMatriz, matriz=$matriz, idIntegrador=$idIntegrador, integrador=$integrador, licencaChave=$licencaChave, controleCadastro=$controleCadastro, condicaoPagamentoPadrao=$condicaoPagamentoPadrao, statusCreditoPadrao=$statusCreditoPadrao, venda=$venda, fiscal=$fiscal, empresaIntegrador=$EmpresaIntegrador contadorVenda=$contadorVenda, modoValorizacaoEstoque=$modoValorizacaoEstoque, taxaRoyalty=$taxaRoyalty, taxaMarketing=$taxaMarketing, versao=$versao, credenciaisIfood=$credenciaisIfood, segmento=$segmento, mixImportado=$mixImportado, empresaContratos=$empresaContratos, fusoHorario=$fusoHorario, idConsultor=$idConsultor, idRegiao=$idRegiao, confirmado=$confirmado, testando=$testando, vencimentoTeste=$vencimentoTeste, idFlowdesk=$idFlowdesk, ondeNosConheceu=$ondeNosConheceu, empresaContrato=$empresaContrato, proximoContrato=$proximoContrato, ]';
  }

  factory Empresa.fromJson(Map<String, dynamic> json) =>
      _$EmpresaFromJson(json);

  Map<String, dynamic> toJson() => _$EmpresaToJson(this);

  static List<Empresa> listFromJson(List<dynamic> json) {
    return json.map((value) => Empresa.fromJson(value)).toList();
  }

  static Map<String, Empresa> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Empresa>();
    if (json.isNotEmpty) {
      json.forEach(
              (String key, dynamic value) =>
          map[key] = Empresa.fromJson(value));
    }
    return map;
  }
}
