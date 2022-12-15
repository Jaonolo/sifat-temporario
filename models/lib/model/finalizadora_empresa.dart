part of openapi.api;

@JsonSerializable()
class FinalizadoraEmpresa {
  int? id;

  int? idFinalizadora;

  Finalizadora? finalizadora;

  int? idEmpresa;

  bool? ativo;

  bool? tef;

  bool? waycard = false;

  bool? permiteTroco;

  bool? vinculaCliente;

  bool? capturaDados;

  bool? solicitaSupervisor;

  bool? exigeAutorizacao;

  bool? comprovanteVinculado;

  bool? permiteDesconto;

  bool? pagaComissao;

  bool? trocaDevolucao;

  bool? imprimeCupomFiscal;

  bool? chequeTroco;

  EspecieTitulo? especieTitulo;

  int? sugestaoDias;

  int? sugestaoParcelas;

  int? maximoParcelas;

  BigDecimal? valorMinimoParcela = BigDecimal.ZERO();

  IdentificacaoCarteiraDigital? identificacaoCarteiraDigital;

  FinalizadoraEmpresa();

  @override
  String toString() {
    return 'FinalizadoraEmpresa[id=$id, idFinalizadora=$idFinalizadora, finalizadora=$finalizadora, idEmpresa=$idEmpresa, ativo=$ativo, tef=$tef, waycard=$waycard,  permiteTroco=$permiteTroco, vinculaCliente=$vinculaCliente, capturaDados=$capturaDados, solicitaSupervisor=$solicitaSupervisor, exigeAutorizacao=$exigeAutorizacao, comprovanteVinculado=$comprovanteVinculado, permiteDesconto=$permiteDesconto, pagaComissao=$pagaComissao, trocaDevolucao=$trocaDevolucao, imprimeCupomFiscal=$imprimeCupomFiscal, chequeTroco=$chequeTroco, especieTitulo=$especieTitulo, sugestaoDias=$sugestaoDias, sugestaoParcelas=$sugestaoParcelas, maximoParcelas=$maximoParcelas, valorMinimoParcela=$valorMinimoParcela, ]';
  }

  factory FinalizadoraEmpresa.fromJson(Map<String, dynamic> json) =>
      _$FinalizadoraEmpresaFromJson(json);

  Map<String, dynamic> toJson() => _$FinalizadoraEmpresaToJson(this);

  static List<FinalizadoraEmpresa> listFromJson(List<dynamic> json) {
    return json.map((value) => FinalizadoraEmpresa.fromJson(value)).toList();
  }

  static Map<String, FinalizadoraEmpresa> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, FinalizadoraEmpresa>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = FinalizadoraEmpresa.fromJson(value));
    }
    return map;
  }
}
