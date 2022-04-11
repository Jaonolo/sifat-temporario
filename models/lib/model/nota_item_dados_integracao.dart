part of openapi.api;

class NotaItemDadosIntegracao {

  int? id;

  int? idNotaItem;

  String? idExterno;

  String? versaoClient;

  String? origem;

  //enum origemEnum {  WAITER,  WAITER_MOBILE,  ALFA_SYNC,  IFOOD,  RAPPI,  WABIZ,  FOURALL,  CONCENTRADOR,  OUTRO,  };{

  int? idClient;

  String? observacao;

  NotaItemDadosIntegracao();

  @override
  String toString() {
    return 'NotaItemDadosIntegracao[id=$id, idNotaItem=$idNotaItem, idExterno=$idExterno, versaoClient=$versaoClient, origem=$origem, idClient=$idClient, observacao=$observacao, ]';
  }

  NotaItemDadosIntegracao.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idNotaItem'] == null) {
      idNotaItem = null;
    } else {
      idNotaItem = json['idNotaItem'];
    }
    if (json['idExterno'] == null) {
      idExterno = null;
    } else {
      idExterno = json['idExterno'];
    }
    if (json['versaoClient'] == null) {
      versaoClient = null;
    } else {
      versaoClient = json['versaoClient'];
    }
    if (json['origem'] == null) {
      origem = null;
    } else {
      origem = json['origem'];
    }
    if (json['idClient'] == null) {
      idClient = null;
    } else {
      idClient = json['idClient'];
    }
    if (json['observacao'] == null) {
      observacao = null;
    } else {
      observacao = json['observacao'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idNotaItem != null)
      json['idNotaItem'] = idNotaItem;
    if (idExterno != null)
      json['idExterno'] = idExterno;
    if (versaoClient != null)
      json['versaoClient'] = versaoClient;
    if (origem != null)
      json['origem'] = origem;
    if (idClient != null)
      json['idClient'] = idClient;
    if (observacao != null)
      json['observacao'] = observacao;
    return json;
  }

  static List<NotaItemDadosIntegracao> listFromJson(List<dynamic> json) {
    return json.map((value) => NotaItemDadosIntegracao.fromJson(value))
        .toList();
  }

  static Map<String, NotaItemDadosIntegracao> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, NotaItemDadosIntegracao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = NotaItemDadosIntegracao.fromJson(value));
    }
    return map;
  }
}

