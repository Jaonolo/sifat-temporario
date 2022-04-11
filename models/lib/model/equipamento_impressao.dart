part of openapi.api;

@JsonSerializable()
class EquipamentoImpressao {

  int? id;

  int? idEmpresa;

  Empresa? empresa;

  String? descricao;

  String? tipoDispositivo;

  //enum tipoDispositivoEnum {  IMPRESSORA,  IMPRESSORA_TCP_IP,  MONITOR,  };{

  DriverImpressora? driver;

  String? path;

  String? ipAddress;

  EquipamentoImpressao();

  @override
  String toString() {
    return 'EquipamentoImpressao{id: $id, idEmpresa: $idEmpresa, empresa: $empresa, descricao: $descricao, tipoDispositivo: $tipoDispositivo, driver: $driver, path: $path, ipAddress: $ipAddress}';
  }

  factory EquipamentoImpressao.fromJson(Map<String, dynamic> json) =>
      _$EquipamentoImpressaoFromJson(json);

  Map<String, dynamic> toJson() => _$EquipamentoImpressaoToJson(this);

  static List<EquipamentoImpressao> listFromJson(List<dynamic> json) {
    return json.map((value) => EquipamentoImpressao.fromJson(value)).toList();
  }

  static Map<String, EquipamentoImpressao> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, EquipamentoImpressao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EquipamentoImpressao.fromJson(value));
    }
    return map;
  }
}

