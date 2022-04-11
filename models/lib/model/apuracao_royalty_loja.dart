part of openapi.api;

@JsonSerializable()
class ApuracaoRoyaltyLoja {
  int? id;

  int? idApuracaoRoyalty;

  ApuracaoRoyalty? apuracaoRoyalty;

  int? idEmpresa;

  Empresa? empresa;
  DateTime? data;

  BigDecimal? vendaBruta = BigDecimal.ZERO();

  BigDecimal? desconto = BigDecimal.ZERO();

  BigDecimal? acrescimo = BigDecimal.ZERO();

  BigDecimal? ticketMedio = BigDecimal.ZERO();

  int? quantidadeVendas;

  BigDecimal? taxaServico = BigDecimal.ZERO();

  BigDecimal? taxaEntrega = BigDecimal.ZERO();

  BigDecimal? taxaIfood = BigDecimal.ZERO();

  BigDecimal? vendaTotal = BigDecimal.ZERO();

  BigDecimal? valoresDesconsiderados = BigDecimal.ZERO();

  BigDecimal? baseCalculo = BigDecimal.ZERO();

  BigDecimal? taxaRoyalty = BigDecimal.ZERO();

  BigDecimal? valorRoyalty = BigDecimal.ZERO();

  BigDecimal? valorRoyaltyDesconto = BigDecimal.ZERO();

  BigDecimal? valorRoyaltyTotal = BigDecimal.ZERO();

  BigDecimal? taxaMarketing = BigDecimal.ZERO();

  BigDecimal? valorMarketing = BigDecimal.ZERO();

  BigDecimal? valorMarketingDesconto = BigDecimal.ZERO();

  BigDecimal? valorMarketingTotal = BigDecimal.ZERO();

  //Referente as notas de NFS-e
  int? idNotaRoyalty;

  Nota? notaRoyalty;

  //Referente as notas de NFS-e
  int? idNotaMarketing;

  Nota? notaMarketing;

  ApuracaoRoyaltyLoja();

  @override
  String toString() {
    return 'ApuracaoRoyaltyLoja{id: $id, idApuracaoRoyalty: $idApuracaoRoyalty, apuracaoRoyalty: $apuracaoRoyalty, idEmpresa: $idEmpresa, empresa: $empresa, data: $data, vendaBruta: $vendaBruta, desconto: $desconto, acrescimo: $acrescimo, ticketMedio: $ticketMedio, quantidadeVendas: $quantidadeVendas, taxaServico: $taxaServico, taxaEntrega: $taxaEntrega, taxaIfood: $taxaIfood, vendaTotal: $vendaTotal, valoresDesconsiderados: $valoresDesconsiderados, baseCalculo: $baseCalculo, taxaRoyalty: $taxaRoyalty, valorRoyalty: $valorRoyalty, valorRoyaltyDesconto: $valorRoyaltyDesconto, valorRoyaltyTotal: $valorRoyaltyTotal, taxaMarketing: $taxaMarketing, valorMarketing: $valorMarketing, valorMarketingDesconto: $valorMarketingDesconto, valorMarketingTotal: $valorMarketingTotal, idNotaRoyalty: $idNotaRoyalty, notaRoyalty: $notaRoyalty, idNotaMarketing: $idNotaMarketing, notaMarketing: $notaMarketing}';
  }

  factory ApuracaoRoyaltyLoja.fromJson(Map<String, dynamic> json) =>
      _$ApuracaoRoyaltyLojaFromJson(json);

  Map<String, dynamic> toJson() => _$ApuracaoRoyaltyLojaToJson(this);

  static List<ApuracaoRoyaltyLoja> listFromJson(List<dynamic> json) {
    return json.map((value) => ApuracaoRoyaltyLoja.fromJson(value)).toList();
  }

  static Map<String, ApuracaoRoyaltyLoja> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, ApuracaoRoyaltyLoja> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ApuracaoRoyaltyLoja.fromJson(value));
    }
    return map;
  }
}
