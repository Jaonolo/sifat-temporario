part of openapi.api;

@JsonSerializable()
class Endereco {

  int? id;

  int? idPessoa;

  String? descricao;

  String? logradouro;

  String? numero;

  String? complemento;

  String? bairro;

  String? cep;

  String? caixaPostal;

  String? pontoReferencia;

  Cidade? cidade;

  Regiao? regiao;

  bool principal = false;

  int? idConcentrador;

  int? versao;

  bool ativo = true;

  @JsonKey(defaultValue: [])
  List<EnderecoDadosIntegracao> dadosIntegracao = [];

  Endereco();

  @override
  String toString() {
    return 'Endereco[id=$id, idPessoa=$idPessoa, descricao=$descricao, logradouro=$logradouro, numero=$numero, complemento=$complemento, bairro=$bairro, cep=$cep, caixaPostal=$caixaPostal, pontoReferencia=$pontoReferencia, cidade=$cidade, regiao=$regiao, principal=$principal, idConcentrador=$idConcentrador, versao=$versao, dadosIntegracao=$dadosIntegracao, ]';
  }

  factory Endereco.fromJson(Map<String, dynamic> json) =>
      _$EnderecoFromJson(json);

  Map<String, dynamic> toJson() => _$EnderecoToJson(this);

  static List<Endereco> listFromJson(List<dynamic> json) {
    return json.map((value) => Endereco.fromJson(value)).toList();
  }

  static Map<String, Endereco> mapFromJson(Map<String, dynamic> json) {
    Map<String, Endereco> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Endereco.fromJson(value));
    }
    return map;
  }
}

