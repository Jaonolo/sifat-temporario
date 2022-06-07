part of openapi.api;

@JsonSerializable()
class ApuracaoRoyalty {
  int? id;

  int? idEmpresa;

  Empresa? empresa;

  int? idUsuario;

  Usuario? usuario;

  DateTime? dataApuracao;

  int? numero;

  DateTime? dataInicial;

  DateTime? dataFinal;

  bool? considerarTaxaServico;

  bool? considerarTaxaEntrega;

  bool? considerarTaxaIfood;

  bool? faturado;

  BigDecimal? valorRoyalty;

  BigDecimal? valorMarketing;

  @JsonKey(defaultValue: [])
  List<ApuracaoRoyaltyLoja> lojas = [];

  @JsonKey(defaultValue: [])
  List<Conta> contas = [];

  ApuracaoRoyalty();

  @override
  String toString() {
    return 'ApuracaoRoyalty{id: $id, idEmpresa: $idEmpresa, empresa: $empresa, idUsuario: $idUsuario, usuario: $usuario, dataApuracao: $dataApuracao, numero: $numero, dataInicial: $dataInicial, dataFinal: $dataFinal, considerarTaxaServico: $considerarTaxaServico, considerarTaxaEntrega: $considerarTaxaEntrega, considerarTaxaIfood: $considerarTaxaIfood, faturado: $faturado, valorRoyalty: $valorRoyalty, valorMarketing: $valorMarketing, lojas: $lojas, contas: $contas}';
  }

  factory ApuracaoRoyalty.fromJson(Map<String, dynamic> json) =>
      _$ApuracaoRoyaltyFromJson(json);

  Map<String, dynamic> toJson() => _$ApuracaoRoyaltyToJson(this);

  static List<ApuracaoRoyalty> listFromJson(List<dynamic> json) {
    return json.map((value) => ApuracaoRoyalty.fromJson(value)).toList();
  }

  static Map<String, ApuracaoRoyalty> mapFromJson(Map<String, dynamic> json) {
    Map<String, ApuracaoRoyalty> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ApuracaoRoyalty.fromJson(value));
    }
    return map;
  }
}
