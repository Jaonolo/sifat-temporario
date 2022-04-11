part of openapi.api;

@JsonSerializable()
class CanalVenda {
  int? id;

  int? idEmpresa;

  Empresa? empresa;

  String? descricao;

  int? idTabelaPreco;

  TabelaPreco? tabelaPreco;

  bool padrao = false;

  @JsonKey(defaultValue: [])
  List<CanalVendaEmpresa> empresas = [];

  CanalVenda();

  @override
  String toString() {
    return 'CanalVenda[id=$id, idEmpresa=$idEmpresa, empresa=$empresa, descricao=$descricao, idTabelaPreco=$idTabelaPreco, tabelaPreco=$tabelaPreco, padrao=$padrao, empresas=$empresas, ]';
  }

  factory CanalVenda.fromJson(Map<String, dynamic> json) =>
      _$CanalVendaFromJson(json);

  Map<String, dynamic> toJson() => _$CanalVendaToJson(this);

  static List<CanalVenda> listFromJson(List<dynamic> json) {
    return json.map((value) => CanalVenda.fromJson(value)).toList();
  }

  static Map<String, CanalVenda> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CanalVenda>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CanalVenda.fromJson(value));
    }
    return map;
  }

}
