part of openapi.api;

class EnderecoDadosIntegracao {

  int? id;

  int? idEndereco;

  int? idClient;

  String? idExterno;

  String? versaoClient;

  String? origem;

  //enum origemEnum {  WAITER,  WAITER_MOBILE,  ALFA_SYNC,  IFOOD,  RAPPI,  WABIZ,  FOURALL,  CONCENTRADOR,  OUTRO,  };{
  EnderecoDadosIntegracao();

  @override
  String toString() {
    return 'EnderecoDadosIntegracao[id=$id, idEndereco=$idEndereco, idClient=$idClient, idExterno=$idExterno, versaoClient=$versaoClient, origem=$origem, ]';
  }

  EnderecoDadosIntegracao.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idEndereco'] == null) {
      idEndereco = null;
    } else {
      idEndereco = json['idEndereco'];
    }
    if (json['idClient'] == null) {
      idClient = null;
    } else {
      idClient = json['idClient'];
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
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idEndereco != null)
      json['idEndereco'] = idEndereco;
    if (idClient != null)
      json['idClient'] = idClient;
    if (idExterno != null)
      json['idExterno'] = idExterno;
    if (versaoClient != null)
      json['versaoClient'] = versaoClient;
    if (origem != null)
      json['origem'] = origem;
    return json;
  }

  static List<EnderecoDadosIntegracao> listFromJson(List<dynamic> json) {
    return json.map((value) => EnderecoDadosIntegracao.fromJson(value))
        .toList();
  }

  static Map<String, EnderecoDadosIntegracao> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, EnderecoDadosIntegracao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EnderecoDadosIntegracao.fromJson(value));
    }
    return map;
  }
}

