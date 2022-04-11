part of openapi.api;

@JsonSerializable()
class Cliente {

  int? idPessoa;

  Pessoa? pessoa = Pessoa();

  String? senha;

  bool? mensagemEletronica;

  bool? restricaoAcesso;

  Classificacao? classificacao;

  String? observacao;

  String? historico;

  String? tipoContribuinte;

  //enum tipoContribuinteEnum {  CONSUMIDOR_FINAL,  CONTRIBUINTE_ICMS,  };{

  int? versao;

  @JsonKey(defaultValue: [])
  List<ClienteAutorizado> autorizados = [];

  @JsonKey(defaultValue: [])
  List<ClienteOcorrencia> ocorrencias = [];

  ClienteVinculo? vinculo;

  ClienteCrediario? crediario;

  ClienteMensalista? mensalista;

  ControleCadastro? controleCadastro;

  Cliente();

  @override
  String toString() {
    return 'Cliente[idPessoa=$idPessoa, pessoa=$pessoa, senha=$senha, mensagemEletronica=$mensagemEletronica, restricaoAcesso=$restricaoAcesso, classificacao=$classificacao, observacao=$observacao, historico=$historico, tipoContribuinte=$tipoContribuinte, versao=$versao, autorizados=$autorizados, ocorrencias=$ocorrencias, vinculo=$vinculo, crediario=$crediario, mensalista=$mensalista, controleCadastro=$controleCadastro, ]';
  }

  factory Cliente.fromJson(Map<String, dynamic> json) =>
      _$ClienteFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteToJson(this);

  static List<Cliente> listFromJson(List<dynamic> json) {
    return json.map((value) => Cliente.fromJson(value)).toList();
  }

  static Map<String, Cliente> mapFromJson(Map<String, dynamic> json) {
    Map<String, Cliente> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Cliente.fromJson(value));
    }
    return map;
  }
}

