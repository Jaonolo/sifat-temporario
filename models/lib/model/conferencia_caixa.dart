part of openapi.api;

@JsonSerializable()
class ConferenciaCaixa {

  Turno? turno;

  @JsonKey(defaultValue: [])
  List<Nota> listaNota = [];

  Map<String, BigDecimal> finalizadoraVendas = {};

  Map<String, BigDecimal> produtosVendidos = {};

  @JsonKey(defaultValue: [])
  List<Operacao> listaOperacoes = [];

  @JsonKey(defaultValue: [])
  List<DesdobramentoGarcom> desdobramentoGarcom = [];

  DesdobramentoVenda? desdobramentoVenda;

  @JsonKey(defaultValue: [])
  List<DesdobramentoModulo> desdobramentoModulo = [];

  BigDecimal? saldo = BigDecimal.ZERO();

  @JsonKey(defaultValue: [])
  List<TotalRecebimentoParcialDTO>? totalRecebimentoParcial;

  ConferenciaCaixa();

  @override
  String toString() {
    return 'ConferenciaCaixa[turno=$turno, listaNota=$listaNota, finalizadoraVendas=$finalizadoraVendas, produtosVendidos=$produtosVendidos, listaOperacoes=$listaOperacoes, desdobramentoGarcom=$desdobramentoGarcom, desdobramentoVenda=$desdobramentoVenda, desdobramentoModulo=$desdobramentoModulo, saldo=$saldo, totalRecebimentoParcial=$totalRecebimentoParcial, totalRecebimentoParcial=$totalRecebimentoParcial,  ]';
  }

  factory ConferenciaCaixa.fromJson(Map<String, dynamic> json) =>
      _$ConferenciaCaixaFromJson(json);

  Map<String, dynamic> toJson() => _$ConferenciaCaixaToJson(this);

  static List<ConferenciaCaixa> listFromJson(List<dynamic> json) {
    return json.map((value) => ConferenciaCaixa.fromJson(value)).toList();
  }

  static Map<String, ConferenciaCaixa> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ConferenciaCaixa>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ConferenciaCaixa.fromJson(value));
    }
    return map;
  }
}

