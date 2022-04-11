part of openapi.api;

@JsonSerializable()
class ReceitawsEmpresa {
  String? nome;
  String? uf;
  String? telefone;
  String? bairro;
  String? logradouro;
  String? numero;
  String? cep;
  String? municipio;
  String? fantasia;
  String? cnpj;
  String? complemento;

  ReceitawsEmpresa();

  factory ReceitawsEmpresa.fromJson(Map<String, dynamic> json) =>
      _$ReceitawsEmpresaFromJson(json);

  Map<String, dynamic> toJson() => _$ReceitawsEmpresaToJson(this);
}