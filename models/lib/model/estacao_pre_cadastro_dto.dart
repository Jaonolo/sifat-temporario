part of openapi.api;

@JsonSerializable()
class EstacaoPreCadastroDTO {

  int? numeroCaixa;

  @JsonKey(defaultValue: [])
  List<EmissorFiscal> emissorFiscalList = [];

  @JsonKey(defaultValue: [])
  List<Modulo> moduloList = [];

  @JsonKey(defaultValue: [])
  List<EquipamentoImpressao> equipamentoImpressaoList = [];

  @JsonKey(defaultValue: [])
  List<LocalProducao> localProducaoList = [];

  bool? modoHibrido;

  EstacaoPreCadastroDTO();

  @override
  String toString() {
    return 'EstacaoPreCadastroDTO[numeroCaixa=$numeroCaixa, emissorFiscalList=$emissorFiscalList, moduloList=$moduloList, equipamentoImpressaoList=$equipamentoImpressaoList, localProducaoList=$localProducaoList, modoHibrido=$modoHibrido, ]';
  }

  factory EstacaoPreCadastroDTO.fromJson(Map<String, dynamic> json) =>
      _$EstacaoPreCadastroDTOFromJson(json);

  Map<String, dynamic> toJson() => _$EstacaoPreCadastroDTOToJson(this);

  static List<EstacaoPreCadastroDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => EstacaoPreCadastroDTO.fromJson(value)).toList();
  }

  static Map<String, EstacaoPreCadastroDTO> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, EstacaoPreCadastroDTO> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EstacaoPreCadastroDTO.fromJson(value));
    }
    return map;
  }
}

