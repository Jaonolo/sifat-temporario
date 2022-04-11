part of openapi.api;

@JsonSerializable()
class CentroCusto {
  int? id;

  int? idEmpresa;

  Empresa? empresa;

  String? descricao;

  String? codigo;

  int? idCentroCustoRaiz;

  CentroCusto? centroCustoRaiz;

  int? idCentroCustoPai;

  CentroCusto? centroCustoPai;

  @JsonKey(defaultValue: [])
  List<CentroCusto> subitens = [];

  CentroCusto();


  @override
  String toString() {
    return 'CentroCusto{id: $id, idEmpresa: $idEmpresa, empresa: $empresa, descricao: $descricao, codigo: $codigo, idCentroCustoRaiz: $idCentroCustoRaiz, centroCustoRaiz: $centroCustoRaiz, idCentroCustoPai: $idCentroCustoPai, centroCustoPai: $centroCustoPai, subitens: $subitens}';
  }

  factory CentroCusto.fromJson(Map<String, dynamic> json) =>
      _$CentroCustoFromJson(json);

  Map<String, dynamic> toJson() => _$CentroCustoToJson(this);

  static List<CentroCusto> listFromJson(List<dynamic> json) {
    return json.map((value) => CentroCusto.fromJson(value)).toList();
  }

  static Map<String, CentroCusto> mapFromJson(Map<String, dynamic> json) {
    Map<String, CentroCusto> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CentroCusto.fromJson(value));
    }
    return map;
  }
}
