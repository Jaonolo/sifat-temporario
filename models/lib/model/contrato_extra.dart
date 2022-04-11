part of openapi.api;

@JsonSerializable()
class ContratoExtra {

  String? pacoteExtra;

  //enum pacoteExtraEnum {  DASHBOARD_WEB,  IFOOD,  ARQUIVAR_XML_VENDA,  SESSAO_EXTRA,  EMISSAO_FISCAL,  WAYCHEF_MOBILE,  SUPORTE_PREMIUM,  CONCENTRADOR,  WAYWALLET,  QUEST,  SITEF,  };{

  String? descricao;

  String? descricaoCompleta;

  bool? gratuito;

  bool? disponivel;

  BigDecimal? valor = BigDecimal.ZERO();

  ContratoExtra();

  @override
  String toString() {
    return 'ContratoExtra[pacoteExtra=$pacoteExtra, descricao=$descricao, descricaoCompleta=$descricaoCompleta, gratuito=$gratuito, disponivel=$disponivel, valor=$valor, ]';
  }

  factory ContratoExtra.fromJson(Map<String, dynamic> json) =>
      _$ContratoExtraFromJson(json);

  Map<String, dynamic> toJson() => _$ContratoExtraToJson(this);

  static List<ContratoExtra> listFromJson(List<dynamic> json) {
    return json.map((value) => ContratoExtra.fromJson(value)).toList();
  }

  static Map<String, ContratoExtra> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ContratoExtra>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ContratoExtra.fromJson(value));
    }
    return map;
  }
}

