part of openapi.api;

@JsonSerializable()
class DadosSessaoDTO {

  String? nomeUsuario;

  String? nomeEstacao;

  Servico? servico;

  Clients? tipoClient;

  DateTime? dataAbertura;

  DateTime? dataUltimaAtualizacao;

  String? token;


  DadosSessaoDTO();


  @override
  String toString() {
    return 'DadosSessaoDTO{nomeUsuario: $nomeUsuario, nomeEstacao: $nomeEstacao, servico: $servico, tipoClient: $tipoClient, dataAbertura: $dataAbertura, dataUltimaAtualizacao: $dataUltimaAtualizacao, token: $token}';
  }

  factory DadosSessaoDTO.fromJson(Map<String, dynamic> json) =>
      _$DadosSessaoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DadosSessaoDTOToJson(this);

  static List<DadosSessaoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => DadosSessaoDTO.fromJson(value)).toList();
  }

  static Map<String, DadosSessaoDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, DadosSessaoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = DadosSessaoDTO.fromJson(value));
    }
    return map;
  }
}