part of openapi.api;

@JsonSerializable()
class AlfaSync {

  int? id;

  int? idEmpresa;

  Empresa? empresa;

  int? intervaloExecucao;

  bool? sincronizaGrupo;

  bool? sincronizaProduto;

  bool? sincronizaCliente;

  bool? sincronizaFinalizadora;

  bool? sincronizaVenda;

  int? idGrupoPadraoSistema;

  DateTime? sincronizarApartirDe;

  bool? ativo;

  AlfaSync();

  @override
  String toString() {
    return 'AlfaSync[id=$id, idEmpresa=$idEmpresa, empresa=$empresa, intervaloExecucao=$intervaloExecucao, sincronizaGrupo=$sincronizaGrupo, sincronizaProduto=$sincronizaProduto, sincronizaCliente=$sincronizaCliente, sincronizaFinalizadora=$sincronizaFinalizadora, sincronizaVenda=$sincronizaVenda, idGrupoPadraoSistema=$idGrupoPadraoSistema, sincronizarApartirDe=$sincronizarApartirDe, ativo=$ativo, ]';
  }

  factory AlfaSync.fromJson(Map<String, dynamic> json) =>
      _$AlfaSyncFromJson(json);

  Map<String, dynamic> toJson() => _$AlfaSyncToJson(this);

  static List<AlfaSync> listFromJson(List<dynamic> json) {
    return json.map((value) => AlfaSync.fromJson(value)).toList();
  }

  static Map<String, AlfaSync> mapFromJson(Map<String, dynamic> json) {
    Map<String, AlfaSync> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = AlfaSync.fromJson(value));
    }
    return map;
  }
}

