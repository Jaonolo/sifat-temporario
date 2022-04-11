part of openapi.api;

@JsonSerializable()
class TabelaPreco {
  int? id;

  int? idEmpresa;

  Empresa? empresa;

  int? codigo;

  String? descricao;

  bool padrao = false;

  bool ativo = true;

  @JsonKey(defaultValue: [])
  List<Empresa> empresas = [];

  TabelaPreco();

  @override
  String toString() {
    return 'TabelaPreco[id=$id, idEmpresa=$idEmpresa, empresa=$empresa, codigo=$codigo, descricao=$descricao, padrao=$padrao, ativo=$ativo, empresas=$empresas, ]';
  }

  factory TabelaPreco.fromJson(Map<String, dynamic> json) =>
      _$TabelaPrecoFromJson(json);

  Map<String, dynamic> toJson() => _$TabelaPrecoToJson(this);

  static List<TabelaPreco> listFromJson(List<dynamic> json) {
    return json.map((value) => TabelaPreco.fromJson(value)).toList();
  }

  static Map<String, TabelaPreco> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, TabelaPreco>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = TabelaPreco.fromJson(value));
    }
    return map;
  }

}

