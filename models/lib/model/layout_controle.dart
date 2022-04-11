part of openapi.api;

@JsonSerializable()
class LayoutControle {
  int? id;

  int? idEmpresa;

  String? descricao;

  List<LayoutControleTempo> layoutControleTempoList = [];

  bool? padrao = false;

  LayoutControle();

  @override
  String toString() {
    return 'LayoutControle{id: $id, idEmpresa: $idEmpresa, descricao: $descricao, layoutControleTempoList: $layoutControleTempoList, padrao: $padrao}';
  }

  factory LayoutControle.fromJson(Map<String, dynamic> json) =>
      _$LayoutControleFromJson(json);

  Map<String, dynamic> toJson() => _$LayoutControleToJson(this);

  static List<LayoutControle> listFromJson(List<dynamic> json) {
    return json.map((value) => LayoutControle.fromJson(value)).toList();
  }

  static Map<String, LayoutControle> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, LayoutControle>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = LayoutControle.fromJson(value));
    }
    return map;
  }
}
