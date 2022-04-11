part of openapi.api;

@JsonSerializable()
class LocalEstocado {

  int? id;

  int? idGrade;

  int? idEndereco;

  BigDecimal? estoque = BigDecimal.ZERO();

  BigDecimal? estoqueAlocado = BigDecimal.ZERO();

  bool? padraoVenda;

  LocalEstocado();

  @override
  String toString() {
    return 'LocalEstocado[id=$id, idGrade=$idGrade, idEndereco=$idEndereco, estoque=$estoque, estoqueAlocado=$estoqueAlocado, padraoVenda=$padraoVenda, ]';
  }

  factory LocalEstocado.fromJson(Map<String, dynamic> json) =>
      _$LocalEstocadoFromJson(json);

  Map<String, dynamic> toJson() => _$LocalEstocadoToJson(this);

  static List<LocalEstocado> listFromJson(List<dynamic> json) {
    return json.map((value) => LocalEstocado.fromJson(value)).toList();
  }

  static Map<String, LocalEstocado> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, LocalEstocado>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = LocalEstocado.fromJson(value));
    }
    return map;
  }
}

