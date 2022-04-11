part of openapi.api;

@JsonSerializable()
class PessoaFisica {

  DateTime? dataNascimento;

  String? numeroCnh;

  String? categoriaCnh;

  DateTime? validadeCnh;

  String? naturalidade;

  String? nomePai;

  String? nomeMae;

  String? genero;

  //enum generoEnum {  FEMININO,  MASCULINO,  AMBOS,  OUTROS,  };{

  bool? casaPropria;

  int? tempoMoradia;

  String? estadoCivil;

  //enum estadoCivilEnum {  SOLTEIRO,  CASADO,  DESQUITADO,  VIUVO,  OUTROS,  };{

  String? profissao;

  BigDecimal? rendaMensal = BigDecimal.ZERO();

  String? trabalhoEmpresa;

  String? trabalhoSetor;

  String? trabalhoEndereco;

  String? trabalhoTelefone;

  DateTime? trabalhoAdmissao;

  Pessoa? conjuge;

  PessoaFisica();

  @override
  String toString() {
    return 'PessoaFisica[dataNascimento=$dataNascimento, numeroCnh=$numeroCnh, categoriaCnh=$categoriaCnh, validadeCnh=$validadeCnh, naturalidade=$naturalidade, nomePai=$nomePai, nomeMae=$nomeMae, genero=$genero, casaPropria=$casaPropria, tempoMoradia=$tempoMoradia, estadoCivil=$estadoCivil, profissao=$profissao, rendaMensal=$rendaMensal, trabalhoEmpresa=$trabalhoEmpresa, trabalhoSetor=$trabalhoSetor, trabalhoEndereco=$trabalhoEndereco, trabalhoTelefone=$trabalhoTelefone, trabalhoAdmissao=$trabalhoAdmissao, conjuge=$conjuge, ]';
  }

  factory PessoaFisica.fromJson(Map<String, dynamic> json) =>
      _$PessoaFisicaFromJson(json);

  Map<String, dynamic> toJson() => _$PessoaFisicaToJson(this);

  static List<PessoaFisica> listFromJson(List<dynamic> json) {
    return json.map((value) => PessoaFisica.fromJson(value)).toList();
  }

  static Map<String, PessoaFisica> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, PessoaFisica>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = PessoaFisica.fromJson(value));
    }
    return map;
  }
}

