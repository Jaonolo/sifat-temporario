part of openapi.api;

@JsonSerializable()
class NotaDadosIntegrador {

  int? id;

  int? idNota;

  String? idExterno;

  String? versaoClient;

  OrigemIntegracao? origem;

  //enum origemEnum {  WAITER,  WAITER_MOBILE,  ALFA_SYNC,  IFOOD,  RAPPI,  WABIZ,  FOURALL,  CONCENTRADOR,  OUTRO,  };{

  int? idClient;

  String? observacao;

  NotaDadosIntegrador();

  @override
  String toString() {
    return 'NotaDadosIntegrador[id=$id, idNota=$idNota, idExterno=$idExterno, versaoClient=$versaoClient, origem=$origem, idClient=$idClient, observacao=$observacao, ]';
  }


  factory NotaDadosIntegrador.fromJson(Map<String, dynamic> json) =>
      _$NotaDadosIntegradorFromJson(json);

  Map<String, dynamic> toJson() => _$NotaDadosIntegradorToJson(this);

  static List<NotaDadosIntegrador> listFromJson(List<dynamic> json) {
    return json.map((value) => NotaDadosIntegrador.fromJson(value)).toList();
  }

  static Map<String, NotaDadosIntegrador> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, NotaDadosIntegrador>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = NotaDadosIntegrador.fromJson(value));
    }
    return map;
  }
}

