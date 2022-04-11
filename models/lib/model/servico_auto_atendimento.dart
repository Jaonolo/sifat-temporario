part of openapi.api;


@JsonSerializable()
class ServicoAutoAtendimento {

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

  ServicoAutoAtendimento();


  @override
  String toString() {
    return 'ServicoAutoAtendimento{id: $id, idEmpresa: $idEmpresa, ativo: $ativo, token: $token, ticketConsumo: $ticketConsumo, impressaoVenda: $impressaoVenda, avisoTempoOcioso: $avisoTempoOcioso, senhaAtendimento: $senhaAtendimento, idFinalizadoraDebito: $idFinalizadoraDebito, idFinalizadoraCredito: $idFinalizadoraCredito, finalizadoraDebito: $finalizadoraDebito, finalizadoraCredito: $finalizadoraCredito, mensagemFinalAtendimento: $mensagemFinalAtendimento, arquivos: $arquivos}';
  }

  factory ServicoAutoAtendimento.fromJson(Map<String, dynamic> json) =>
      _$ServicoAutoAtendimentoFromJson(json);

  Map<String, dynamic> toJson() => _$ServicoAutoAtendimentoToJson(this);

  static List<ServicoAutoAtendimento> listFromJson(List<dynamic> json) {
    return json.map((value) => ServicoAutoAtendimento.fromJson(value)).toList();
  }

  static Map<String, ServicoAutoAtendimento> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, ServicoAutoAtendimento> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ServicoAutoAtendimento.fromJson(value));
    }
    return map;
  }


}

