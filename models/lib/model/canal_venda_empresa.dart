part of openapi.api;

@JsonSerializable()
class CanalVendaEmpresa {
  int? id;

  int? idEmpresa;

  Empresa? empresa;

  int? idCanalVenda;

  CanalVenda? canalVenda;

  bool? ativo = true;

  CanalVendaEmpresa();

  @override
  String toString() {
    return 'CanalVendaEmpresa[id=$id, idEmpresa=$idEmpresa, empresa=$empresa, idCanalVenda=$idCanalVenda, canalVenda=$canalVenda, ativo=$ativo, ]';
  }

  factory CanalVendaEmpresa.fromJson(Map<String, dynamic> json) =>
      _$CanalVendaEmpresaFromJson(json);

  Map<String, dynamic> toJson() => _$CanalVendaEmpresaToJson(this);

  static List<CanalVendaEmpresa> listFromJson(List<dynamic> json) {
    return json.map((value) => CanalVendaEmpresa.fromJson(value)).toList();
  }

  static Map<String, CanalVendaEmpresa> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CanalVendaEmpresa>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CanalVendaEmpresa.fromJson(value));
    }
    return map;
  }

}