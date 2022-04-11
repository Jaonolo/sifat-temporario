part of openapi.api;

@JsonSerializable()
class Lojista {

  int? idPessoa;

  Pessoa? pessoa;

  @JsonKey(defaultValue: [])
  List<BandeiraCartao> bandeiras = [];

  int? versao;

  ControleCadastro? controleCadastro;

  Lojista();

  @override
  String toString() {
    return 'Lojista[idPessoa=$idPessoa, pessoa=$pessoa, bandeiras=$bandeiras, versao=$versao, controleCadastro=$controleCadastro, ]';
  }

  factory Lojista.fromJson(Map<String, dynamic> json) =>
      _$LojistaFromJson(json);

  Map<String, dynamic> toJson() => _$LojistaToJson(this);

  static List<Lojista> listFromJson(List<dynamic> json) {
    return json.map((value) => Lojista.fromJson(value)).toList();
  }

  static Map<String, Lojista> mapFromJson(Map<String, dynamic> json) {
    Map<String, Lojista> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Lojista.fromJson(value));
    }
    return map;
  }
}

