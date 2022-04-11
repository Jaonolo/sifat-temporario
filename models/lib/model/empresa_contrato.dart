part of openapi.api;

@JsonSerializable()
class EmpresaContrato {

  int? id;

  int? idEmpresa;

  String? tipoContrato;

  //enum tipoContratoEnum {  TRIAL,  GRATIS,  PRATA,  OURO,  DIAMANTE,  };{

  DateTime? vigenciaInicio;

  DateTime? vigenciaFim;

  int? diasTrial;

  int? numeroUsuarios;

  bool? moduloEstoque;

  bool? moduloGrade;

  bool? moduloPacoteProduto;

  bool? moduloObservacaoProduto;

  bool? moduloPromocao;

  bool? moduloFinanceiro;

  bool? moduloFicha;

  bool? moduloMesa;

  bool? moduloDelivery;

  bool? moduloCartao;

  bool? moduloBalcao;

  bool? moduloDriveThru;

  bool? moduloAutoatendimento;

  bool? aplicativoWaychef;

  bool? servicoImpressao;

  bool? integracaoAlfaSync;

  bool? integracaoUnicid;

  bool? modoHibrido;

  bool? venderWaycard;

  String? recorrenciaContrato;

  //enum recorrenciaContratoEnum {  MENSAL,  TRIMESTRAL,  SEMESTRAL,  ANUAL,  };{

  BigDecimal? valorContrato = BigDecimal.ZERO();

  BigDecimal? valorTotalContrato = BigDecimal.ZERO();

  DateTime? dataPrimeiraAssinatura;

  DateTime? vencimentoContrato;

  DateTime? dataContratacao;

  DateTime? dataCancelamento;

  bool? contratoCancelado;

  bool? exibirAletaVencimento;

  @JsonKey(defaultValue: [])
  List<EmpresaContratoExtra> contratoExtra = [];

  int? limiteProdutos;

  BigDecimal? limiteFaturamento = BigDecimal.ZERO();

  BigDecimal? limiteContasReceber = BigDecimal.ZERO();

  BigDecimal? limiteContasPagar = BigDecimal.ZERO();

  bool? nfeEntrada;

  bool? nfeSaida;

  bool? nfeServico;

  bool? multiplosLocaisEstoque;

  bool? controleVendaPrazo;

  bool? cobrancaBancaria;

  bool? dre;

  bool? controleCartoes;

  bool? integracaoNapp;

  bool? integracaoGig;

  EmpresaContrato();

  @override
  String toString() {
    return 'EmpresaContrato[id=$id, idEmpresa=$idEmpresa, tipoContrato=$tipoContrato, vigenciaInicio=$vigenciaInicio, vigenciaFim=$vigenciaFim, diasTrial=$diasTrial, numeroUsuarios=$numeroUsuarios, moduloEstoque=$moduloEstoque, moduloGrade=$moduloGrade, moduloPacoteProduto=$moduloPacoteProduto, moduloObservacaoProduto=$moduloObservacaoProduto, moduloPromocao=$moduloPromocao, moduloFinanceiro=$moduloFinanceiro, moduloFicha=$moduloFicha, moduloMesa=$moduloMesa, moduloDelivery=$moduloDelivery, moduloCartao=$moduloCartao, moduloBalcao=$moduloBalcao, moduloDriveThru=$moduloDriveThru, moduloAutoatendimento=$moduloAutoatendimento, aplicativoWaychef=$aplicativoWaychef, servicoImpressao=$servicoImpressao, integracaoAlfaSync=$integracaoAlfaSync, integracaoUnicid=$integracaoUnicid, modoHibrido=$modoHibrido, venderWaycard=$venderWaycard, recorrenciaContrato=$recorrenciaContrato, valorContrato=$valorContrato, valorTotalContrato=$valorTotalContrato, dataPrimeiraAssinatura=$dataPrimeiraAssinatura, vencimentoContrato=$vencimentoContrato, dataContratacao=$dataContratacao, dataCancelamento=$dataCancelamento, contratoCancelado=$contratoCancelado, exibirAletaVencimento=$exibirAletaVencimento, contratoExtra=$contratoExtra, limiteProdutos=$limiteProdutos, limiteFaturamento=$limiteFaturamento, limiteContasReceber=$limiteContasReceber, limiteContasPagar=$limiteContasPagar, nfeEntrada=$nfeEntrada, nfeSaida=$nfeSaida, nfeServico=$nfeServico, multiplosLocaisEstoque=$multiplosLocaisEstoque, controleVendaPrazo=$controleVendaPrazo, cobrancaBancaria=$cobrancaBancaria, dre=$dre, controleCartoes=$controleCartoes, integracaoNapp=$integracaoNapp, integracaoGig=$integracaoGig ]';
  }

  factory EmpresaContrato.fromJson(Map<String, dynamic> json) =>
      _$EmpresaContratoFromJson(json);

  Map<String, dynamic> toJson() => _$EmpresaContratoToJson(this);

  static List<EmpresaContrato> listFromJson(List<dynamic> json) {
    return json.map((value) => EmpresaContrato.fromJson(value)).toList();
  }

  static Map<String, EmpresaContrato> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EmpresaContrato>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EmpresaContrato.fromJson(value));
    }
    return map;
  }
}
