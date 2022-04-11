part of openapi.api;

@JsonSerializable()
class ContratoConfiguracao {

  String? tipoContrato;

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

  bool? ativo;

  int? indice;

  BigDecimal? valorMensal;
  BigDecimal? valorTrimestral;
  BigDecimal? valorSemestral;
  BigDecimal? valorAnual;

  BigDecimal? valorUsuarioAdicional;

  int? limiteProdutos;

  BigDecimal? limiteFaturamento;

  BigDecimal? limiteContasReceber;

  BigDecimal? limiteContasPagar;

  int? limiteNfeSaida;

  bool? nfeEntrada;


  ContratoConfiguracao();

  @override
  String toString() {
    return 'ContratoConfiguracao{tipoContrato: $tipoContrato, diasTrial: $diasTrial, numeroUsuarios: $numeroUsuarios, moduloEstoque: $moduloEstoque, moduloGrade: $moduloGrade, moduloPacoteProduto: $moduloPacoteProduto, moduloObservacaoProduto: $moduloObservacaoProduto, moduloPromocao: $moduloPromocao, moduloFinanceiro: $moduloFinanceiro, moduloFicha: $moduloFicha, moduloMesa: $moduloMesa, moduloDelivery: $moduloDelivery, moduloCartao: $moduloCartao, moduloBalcao: $moduloBalcao, moduloDriveThru: $moduloDriveThru, moduloAutoatendimento: $moduloAutoatendimento, aplicativoWaychef: $aplicativoWaychef, servicoImpressao: $servicoImpressao, ativo: $ativo, indice: $indice, valorMensal: $valorMensal, valorTrimestral: $valorTrimestral, valorSemestral: $valorSemestral, valorAnual: $valorAnual, valorUsuarioAdicional: $valorUsuarioAdicional, limiteProdutos: $limiteProdutos, limiteFaturamento: $limiteFaturamento, limiteContasReceber: $limiteContasReceber, limiteContasPagar: $limiteContasPagar, limiteNfeSaida: $limiteNfeSaida, nfeEntrada: $nfeEntrada}';
  }

  factory ContratoConfiguracao.fromJson(Map<String, dynamic> json) =>
      _$ContratoConfiguracaoFromJson(json);

  Map<String, dynamic> toJson() => _$ContratoConfiguracaoToJson(this);


}

