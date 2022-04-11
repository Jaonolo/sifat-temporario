part of openapi.api;

@JsonSerializable()
class LoginAutoAtendimentoDTO {

  ServicoAutoAtendimento? servicoAutoAtendimento;
  EstacaoTrabalho? estacaoTrabalho;
  Empresa? empresa;


  LoginAutoAtendimentoDTO();

  @override
  String toString() {
    return 'LoginAutoAtendimentoDTO{servicoAutoAtendimento: $servicoAutoAtendimento, estacaoTrabalho: $estacaoTrabalho, empresa: $empresa}';
  }

  factory LoginAutoAtendimentoDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginAutoAtendimentoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginAutoAtendimentoDTOToJson(this);

  static List<LoginAutoAtendimentoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => LoginAutoAtendimentoDTO.fromJson(value))
        .toList();
  }

  static Map<String, LoginAutoAtendimentoDTO> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, LoginAutoAtendimentoDTO> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = LoginAutoAtendimentoDTO.fromJson(value));
    }
    return map;
  }
}