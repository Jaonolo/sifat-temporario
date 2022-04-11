part of openapi.api;

@JsonSerializable()
class GradeEmpresaPreco {
  int? id;

  int? idGradeEmpresa;

  GradeEmpresa? gradeEmpresa;

  int? idTabelaPreco;

  TabelaPreco? tabelaPreco;

  BigDecimal? precoVenda = BigDecimal.ZERO();

  BigDecimal? margemLucro = BigDecimal.ZERO();

  bool? ativo = true;

  GradeEmpresaPreco();

  @override
  String toString() {
    return 'GradeEmpresaPreco[id=$id, idGradeEmpresa=$idGradeEmpresa, gradeEmpresa=$gradeEmpresa, idTabelaPreco=$idTabelaPreco, tabelaPreco=$tabelaPreco, precoVenda=$precoVenda, margemLucro=$margemLucro, ativo=$ativo, ]';
  }

  factory GradeEmpresaPreco.fromJson(Map<String, dynamic> json) =>
      _$GradeEmpresaPrecoFromJson(json);

  Map<String, dynamic> toJson() => _$GradeEmpresaPrecoToJson(this);

  static List<GradeEmpresaPreco> listFromJson(List<dynamic> json) {
    return json.map((value) => GradeEmpresaPreco.fromJson(value)).toList();
  }

  static Map<String, GradeEmpresaPreco> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, GradeEmpresaPreco>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = GradeEmpresaPreco.fromJson(value));
    }
    return map;
  }

}