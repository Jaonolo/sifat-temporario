part of openapi.api;

@JsonSerializable()
class ConferenciaCaixaDTO {

  TurnoSimplificadoDTO? turnoSimplificadoDTO;

  ExtratoTurnoDTO? extratoTurnoDTO = ExtratoTurnoDTO();

  List<NotaSimplificadaDTO>? vendas;

  List<NotaSimplificadaDTO>? vendasCanceladas;

  List<TaxaServicoGracomDTO>? taxaServicoGracomDTOList;

  DesdobramentoVendaDTO? desdobramentoVendaDTO;

  List<VendasModuloDTO>? vendasModuloDTOList;

  List<DesdobramentoGrupoProdutosDTO>? desdobramentoGrupoProdutosDTOList;

  List<DesdobramentoProdutoDTO>? pacotesVendidos;

  List<TotalRecebimentoParcialDTO>? totalRecebimentoParcial;

  BigDecimal? saldo = BigDecimal.ZERO();

  int? pendenciaEmissaoFiscal = 0;

  ConferenciaCaixaDTO();


  @override
  String toString() {
    return 'ConferenciaCaixaDTO{turnoSimplificadoDTO: $turnoSimplificadoDTO, extratoTurnoDTO: $extratoTurnoDTO, vendas: $vendas, vendasCanceladas: $vendasCanceladas, taxaServicoGracomDTOList: $taxaServicoGracomDTOList, desdobramentoVendaDTO: $desdobramentoVendaDTO, vendasModuloDTOList: $vendasModuloDTOList, desdobramentoGrupoProdutosDTOList: $desdobramentoGrupoProdutosDTOList, pacotesVendidos: $pacotesVendidos, saldo: $saldo, pendenciaEmissaoFiscal:$pendenciaEmissaoFiscal }';
  }

  factory ConferenciaCaixaDTO.fromJson(Map<String, dynamic> json) =>
      _$ConferenciaCaixaDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ConferenciaCaixaDTOToJson(this);

  static List<ConferenciaCaixaDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => ConferenciaCaixaDTO.fromJson(value)).toList();
  }

  static Map<String, ConferenciaCaixaDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ConferenciaCaixaDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ConferenciaCaixaDTO.fromJson(value));
    }
    return map;
  }

}