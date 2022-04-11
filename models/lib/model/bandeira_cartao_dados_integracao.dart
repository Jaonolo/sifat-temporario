part of openapi.api;

@JsonSerializable()
class BandeiraCartaoDadosIntegracao {

  int? id;

  int? idBandeira;

  String? idExterno;

  String? versaoClient;

  String? origem;

  //enum origemEnum {  WAITER,  WAITER_MOBILE,  ALFA_SYNC,  IFOOD,  RAPPI,  WABIZ,  FOURALL,  CONCENTRADOR,  OUTRO,  };{

  int? idClient;

  String? observacao;

  BandeiraCartaoDadosIntegracao();

  @override
  String toString() {
    return 'BandeiraCartaoDadosIntegracao[id=$id, idBandeira=$idBandeira, idExterno=$idExterno, versaoClient=$versaoClient, origem=$origem, idClient=$idClient, observacao=$observacao, ]';
  }

  factory BandeiraCartaoDadosIntegracao.fromJson(Map<String, dynamic> json) =>
      _$BandeiraCartaoDadosIntegracaoFromJson(json);

  Map<String, dynamic> toJson() => _$BandeiraCartaoDadosIntegracaoToJson(this);

  static List<BandeiraCartaoDadosIntegracao> listFromJson(List<dynamic> json) {
    return json.map((value) => BandeiraCartaoDadosIntegracao.fromJson(value))
        .toList();
  }

  static Map<String, BandeiraCartaoDadosIntegracao> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, BandeiraCartaoDadosIntegracao> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = BandeiraCartaoDadosIntegracao.fromJson(value));
    }
    return map;
  }
}

