part of openapi.api;

@JsonSerializable()
class NovaEmpresaDTO {

  Empresa? empresa;

  List<Modulo> modulos = [];

  EstacaoTrabalho? estacaoTrabalho;

  ContratoConfiguracao? contratoConfiguracao;


  NovaEmpresaDTO();

  @override
  String toString() {
    return 'NovaEmpresaDTO[empresa=$empresa, modulos=$modulos, estacaoTrabalho=$estacaoTrabalho, contratoConfiguracao=$contratoConfiguracao ]';
  }

  factory NovaEmpresaDTO.fromJson(Map<String, dynamic> json) =>
      _$NovaEmpresaDTOFromJson(json);

  Map<String, dynamic> toJson() => _$NovaEmpresaDTOToJson(this);

  static List<NovaEmpresaDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => NovaEmpresaDTO.fromJson(value)).toList();
  }

  static Map<String, NovaEmpresaDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, NovaEmpresaDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = NovaEmpresaDTO.fromJson(value));
    }
    return map;
  }
}

