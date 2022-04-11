part of openapi.api;

class InlineObject1 {

  String? clientKey;

  String? clientSecret;

  String? inscricaoFederal;

  String? versao;

  String? instalacaoKey;

  String? client;

  //enum clientEnum {  ALFA_SYNC,  WAITER,  WAITER_MOBILE,  CONCENTRADOR,  ERP,  API,  GERENCIADOR_IMPRESSAO,  };{
  InlineObject1();

  @override
  String toString() {
    return 'InlineObject1[clientKey=$clientKey, clientSecret=$clientSecret, inscricaoFederal=$inscricaoFederal, versao=$versao, instalacaoKey=$instalacaoKey, aplicativo=$client, ]';
  }

  InlineObject1.fromJson(Map<String, dynamic> json) {
    if (json['clientKey'] == null) {
      clientKey = null;
    } else {
      clientKey = json['clientKey'];
    }
    if (json['clientSecret'] == null) {
      clientSecret = null;
    } else {
      clientSecret = json['clientSecret'];
    }
    if (json['inscricaoFederal'] == null) {
      inscricaoFederal = null;
    } else {
      inscricaoFederal = json['inscricaoFederal'];
    }
    if (json['versao'] == null) {
      versao = null;
    } else {
      versao = json['versao'];
    }
    if (json['instalacaoKey'] == null) {
      instalacaoKey = null;
    } else {
      instalacaoKey = json['instalacaoKey'];
    }
    if (json['client'] == null) {
      client = null;
    } else {
      client = json['client'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (clientKey != null)
      json['clientKey'] = clientKey;
    if (clientSecret != null)
      json['clientSecret'] = clientSecret;
    if (inscricaoFederal != null)
      json['inscricaoFederal'] = inscricaoFederal;
    if (versao != null)
      json['versao'] = versao;
    if (instalacaoKey != null)
      json['instalacaoKey'] = instalacaoKey;
    if (client != null)
      json['client'] = client;
    return json;
  }

  static List<InlineObject1> listFromJson(List<dynamic> json) {
    return json.map((value) => InlineObject1.fromJson(value)).toList();
  }

  static Map<String, InlineObject1> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, InlineObject1>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = InlineObject1.fromJson(value));
    }
    return map;
  }
}

