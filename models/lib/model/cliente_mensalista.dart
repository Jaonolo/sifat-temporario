part of openapi.api;

class ClienteMensalista {

  String? formaCobranca;

  //enum formaCobrancaEnum {  NENHUMA,  CARTEIRA,  BANCARIA,  DEBITO_CONTA,  };{

  MotivoCancelamento? motivoCancelamento;

  Banco? bancoCobranca;

  String? contaCobranca;

  ClienteMensalista();

  @override
  String toString() {
    return 'ClienteMensalista[formaCobranca=$formaCobranca, motivoCancelamento=$motivoCancelamento, bancoCobranca=$bancoCobranca, contaCobranca=$contaCobranca, ]';
  }

  ClienteMensalista.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['formaCobranca'] == null) {
      formaCobranca = null;
    } else {
      formaCobranca = json['formaCobranca'];
    }
    if (json['motivoCancelamento'] == null) {
      motivoCancelamento = null;
    } else {
      motivoCancelamento =
          MotivoCancelamento.fromJson(json['motivoCancelamento']);
    }
    if (json['bancoCobranca'] == null) {
      bancoCobranca = null;
    } else {
      bancoCobranca = Banco.fromJson(json['bancoCobranca']);
    }
    if (json['contaCobranca'] == null) {
      contaCobranca = null;
    } else {
      contaCobranca = json['contaCobranca'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (formaCobranca != null)
      json['formaCobranca'] = formaCobranca;
    if (motivoCancelamento != null)
      json['motivoCancelamento'] = motivoCancelamento;
    if (bancoCobranca != null)
      json['bancoCobranca'] = bancoCobranca;
    if (contaCobranca != null)
      json['contaCobranca'] = contaCobranca;
    return json;
  }

  static List<ClienteMensalista> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteMensalista.fromJson(value)).toList();
  }

  static Map<String, ClienteMensalista> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ClienteMensalista>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteMensalista.fromJson(value));
    }
    return map;
  }
}

