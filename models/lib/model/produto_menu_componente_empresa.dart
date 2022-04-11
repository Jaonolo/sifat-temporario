part of openapi.api;

@JsonSerializable()
class ProdutoMenuComponenteEmpresa {

  int? id;

  int? idProdutoMenuComponente;

  int? idEmpresa;

  int? idGradeEmpresa;

  GradeEmpresa? gradeEmpresa;

  List<ProdutoMenuComponenteEmpresaPreco> precos = [];

  ProdutoMenuComponenteEmpresa();

  @override
  String toString() {
    return 'ProdutoMenuComponenteEmpresa[id=$id, idProdutoMenuComponente=$idProdutoMenuComponente, idEmpresa=$idEmpresa, idGradeEmpresa=$idGradeEmpresa, gradeEmpresa=$gradeEmpresa, precos=$precos,  ]';
  }

  factory ProdutoMenuComponenteEmpresa.fromJson(Map<String, dynamic> json) =>
      _$ProdutoMenuComponenteEmpresaFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutoMenuComponenteEmpresaToJson(this);

  static List<ProdutoMenuComponenteEmpresa> listFromJson(List<dynamic> json) {
    return json.map((value) => ProdutoMenuComponenteEmpresa.fromJson(value))
        .toList();
  }

  static Map<String, ProdutoMenuComponenteEmpresa> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ProdutoMenuComponenteEmpresa>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ProdutoMenuComponenteEmpresa.fromJson(value));
    }
    return map;
  }
}

