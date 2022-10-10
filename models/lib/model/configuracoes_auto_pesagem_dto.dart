part of openapi.api;

@JsonSerializable()
class ConfiguracoesAutoPesagemDTO {
  ClientAutoPesagem? clientAutoPesagem;

  EstacaoTrabalho? estacaoTrabalho;

  Empresa? empresa;

  ConfiguracoesAutoPesagemDTO();


  @override
  String toString() {
    return 'ConfiguracoesAutoPesagemDTO{clientAutoPesagem: $clientAutoPesagem, estacaoTrabalho: $estacaoTrabalho, empresa: $empresa}';
  }

  factory ConfiguracoesAutoPesagemDTO.fromJson(Map<String, dynamic> json) =>
      _$ConfiguracoesAutoPesagemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ConfiguracoesAutoPesagemDTOToJson(this);

  static List<ConfiguracoesAutoPesagemDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => ConfiguracoesAutoPesagemDTO.fromJson(value)).toList();
  }

  static Map<String, ConfiguracoesAutoPesagemDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ConfiguracoesAutoPesagemDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ConfiguracoesAutoPesagemDTO.fromJson(value));
    }
    return map;
  }

}
