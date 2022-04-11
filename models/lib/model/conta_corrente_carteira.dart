part of openapi.api;

@JsonSerializable()
class ContaCorrenteCarteira {
  int? id;

  int? idEmpresa;

  Empresa? empresa;

  int? idContaCorrente;

  ContaCorrente? contaCorrente;

  int? carteira;

  String? formaEmissaoBoleto = "EMISSAO_IMPRESSAO_CLIENTE";

  // enum {IMPRESSAO_CLIENTE, EMISSAO_IMPRESSAO_CLIENTE, REMESSA_ARQUIVO}

  String? tipoCobranca = "SIMPLES";

  //enum { SIMPLES ,RAPIDA, INDEXADA,CAUCIONADA,DESCONTADA,DIRETA}

  String? layoutArquivo = "CNAB240";

  String? identifcadorCobranca;

  String? codigoConvenio;

  String? especieTitulo;

  String? siglaTitulo;

  String? instrucaoCobranca1;

  String? instrucaoCobranca2;

  int? nossoNumero;

  bool? aceite = false;

  int? prazoProtesto = 0;

  int? prazoRecebimento = 0;

  BigDecimal? valorTaxaEmissao = BigDecimal.ZERO();

  int? diasTolerancia = 0;

  BigDecimal? moraDiaria = BigDecimal.ZERO();

  BigDecimal? multa = BigDecimal.ZERO();

  BigDecimal? descontoAntecipacao = BigDecimal.ZERO();

  int? diasAntecipacao = 0;

  int? diasRepasse = 0;

  bool? cobrancaRegistrada = true;

  bool? gerarNossoNumero = true;

  String? localPagamento;

  String? mensagemCorpoBoleto;

  String? mensagemAdicional;

  String? mensagemCorpoEmail;

  bool? ativa = true;

  ContaCorrenteCarteira();

  @override
  String toString() {
    return 'ContaCorrenteCarteira{id: $id, idEmpresa: $idEmpresa, empresa: $empresa, idContaCorrente: $idContaCorrente, contaCorrente: $contaCorrente, carteira: $carteira, formaEmissaoBoleto: $formaEmissaoBoleto, tipoCobranca: $tipoCobranca, layoutArquivo: $layoutArquivo, identifcadorCobranca: $identifcadorCobranca, codigoConvenio: $codigoConvenio, especieTitulo: $especieTitulo, siglaTitulo: $siglaTitulo, instrucaoCobranca1: $instrucaoCobranca1, instrucaoCobranca2: $instrucaoCobranca2, nossoNumero: $nossoNumero, aceite: $aceite, prazoProtesto: $prazoProtesto, prazoRecebimento: $prazoRecebimento, valorTaxaEmissao: $valorTaxaEmissao, diasTolerancia: $diasTolerancia, moraDiaria: $moraDiaria, multa: $multa, descontoAntecipacao: $descontoAntecipacao, diasAntecipacao: $diasAntecipacao, diasRepasse: $diasRepasse, cobrancaRegistrada: $cobrancaRegistrada, gerarNossoNumero: $gerarNossoNumero, localPagamento: $localPagamento, mensagemCorpoBoleto: $mensagemCorpoBoleto, mensagemAdicional: $mensagemAdicional, mensagemCorpoEmail: $mensagemCorpoEmail, ativa: $ativa}';
  }

  factory ContaCorrenteCarteira.fromJson(Map<String, dynamic> json) =>
      _$ContaCorrenteCarteiraFromJson(json);

  Map<String, dynamic> toJson() => _$ContaCorrenteCarteiraToJson(this);

  static List<ContaCorrenteCarteira> listFromJson(List<dynamic> json) {
    return json.map((value) => ContaCorrenteCarteira.fromJson(value)).toList();
  }

  static Map<String, ContaCorrenteCarteira> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ContaCorrenteCarteira>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ContaCorrenteCarteira.fromJson(value));
    }
    return map;
  }
}
