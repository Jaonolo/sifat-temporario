part of openapi.api;

@JsonSerializable()
class ProdutoGrupo implements Cloneable {
  int? id;

  int? idEmpresa;

  String? descricao;

  bool? ecommerce;

  int? idGrupoPai;

  bool? padraoSistema;

  @JsonKey(defaultValue: [])
  List<ProdutoGrupo> subgrupos = [];

  @JsonKey(defaultValue: [])
  List<ProdutoEmpresa> produtos = [];

  int? versao;

  ProdutoGrupo();

  @override
  String toString() {
    return 'ProdutoGrupo[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, ecommerce=$ecommerce, idGrupoPai=$idGrupoPai, padraoSistema=$padraoSistema, subgrupos=$subgrupos, produtos=$produtos, versao=$versao, ]';
  }


  factory ProdutoGrupo.fromJson(Map<String, dynamic> json) =>
      _$ProdutoGrupoFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutoGrupoToJson(this);

  static List<ProdutoGrupo> listFromJson(List<dynamic> json) {
    return json.map((value) => ProdutoGrupo.fromJson(value)).toList();
  }

  static Map<String, ProdutoGrupo> mapFromJson(Map<String, dynamic> json) {
    Map<String, ProdutoGrupo> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ProdutoGrupo.fromJson(value));
    }
    return map;
  }

  @override
  clone() {
    return ProdutoGrupo.fromJson(jsonDecode(jsonEncode(this.toJson())));
  }
}
