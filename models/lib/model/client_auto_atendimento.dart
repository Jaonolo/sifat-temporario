part of openapi.api;


@JsonSerializable()
class ClientAutoAtendimento {

  int? id;
  int? idEmpresa;
  @JsonKey(defaultValue: false)
  bool ativo = true;
  String? token;
  TicketConsumo ticketConsumo = TicketConsumo.INDIVIDUAL;
  ImpressaoVenda impressaoVenda = ImpressaoVenda.IMPRIME;
  int? avisoTempoOcioso;
  SenhaAtendimento senhaAtendimento = SenhaAtendimento.NAO_UTILIZA;
  int? idFinalizadoraDebito;
  int? idFinalizadoraCredito;
  FinalizadoraEmpresa? finalizadoraDebito;
  FinalizadoraEmpresa? finalizadoraCredito;
  String? mensagemFinalAtendimento;
  @JsonKey(defaultValue: [])
  List<ArquivoAutoAtendimento> arquivos = [];

  ClientAutoAtendimento();


  @override
  String toString() {
    return 'ClientAutoAtendimento{id: $id, idEmpresa: $idEmpresa, ativo: $ativo, token: $token, ticketConsumo: $ticketConsumo, impressaoVenda: $impressaoVenda, avisoTempoOcioso: $avisoTempoOcioso, senhaAtendimento: $senhaAtendimento, idFinalizadoraDebito: $idFinalizadoraDebito, idFinalizadoraCredito: $idFinalizadoraCredito, finalizadoraDebito: $finalizadoraDebito, finalizadoraCredito: $finalizadoraCredito, mensagemFinalAtendimento: $mensagemFinalAtendimento, arquivos: $arquivos}';
  }

  factory ClientAutoAtendimento.fromJson(Map<String, dynamic> json) =>
      _$ClientAutoAtendimentoFromJson(json);

  Map<String, dynamic> toJson() => _$ClientAutoAtendimentoToJson(this);

  static List<ClientAutoAtendimento> listFromJson(List<dynamic> json) {
    return json.map((value) => ClientAutoAtendimento.fromJson(value)).toList();
  }

  static Map<String, ClientAutoAtendimento> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, ClientAutoAtendimento> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClientAutoAtendimento.fromJson(value));
    }
    return map;
  }


}

