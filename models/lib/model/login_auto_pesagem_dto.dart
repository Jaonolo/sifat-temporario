part of openapi.api;

@JsonSerializable()
class LoginAutoPesagemDTO {
  ServicoAutoPesagem? servicoAutoPesagem;

  EstacaoTrabalho? estacaoTrabalho;

  Empresa? empresa;

  LoginAutoPesagemDTO();

  @override
  String toString() {
    return 'LoginAutoPesagemDTO[servicoAutoPesagem=$ServicoAutoPesagem, estacaoTrabalho=$estacaoTrabalho, empresa=$empresa, ]';
  }


  factory LoginAutoPesagemDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginAutoPesagemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginAutoPesagemDTOToJson(this);

  static List<LoginAutoPesagemDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => LoginAutoPesagemDTO.fromJson(value)).toList();
  }

  static Map<String, LoginAutoPesagemDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, LoginAutoPesagemDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = LoginAutoPesagemDTO.fromJson(value));
    }
    return map;
  }

}
