part of openapi.api;

@JsonSerializable()
class ConfiguracoesAutoAtendimentoDTO {

  ClientAutoAtendimento? clientAutoAtendimento;
  EstacaoTrabalho? estacaoTrabalho;
  Empresa? empresa;


  ConfiguracoesAutoAtendimentoDTO();

  @override
  String toString() {
    return 'ConfiguracoesAutoAtendimentoDTO{clientAutoAtendimento: $clientAutoAtendimento, estacaoTrabalho: $estacaoTrabalho, empresa: $empresa}';
  }

  factory ConfiguracoesAutoAtendimentoDTO.fromJson(Map<String, dynamic> json) =>
      _$ConfiguracoesAutoAtendimentoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ConfiguracoesAutoAtendimentoDTOToJson(this);

  static List<ConfiguracoesAutoAtendimentoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => ConfiguracoesAutoAtendimentoDTO.fromJson(value))
        .toList();
  }

  static Map<String, ConfiguracoesAutoAtendimentoDTO> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, ConfiguracoesAutoAtendimentoDTO> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ConfiguracoesAutoAtendimentoDTO.fromJson(value));
    }
    return map;
  }
}