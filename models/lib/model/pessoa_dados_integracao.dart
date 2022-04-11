part of openapi.api;

class PessoaDadosIntegracao {

  int? id;

  int? idPessoa;

  int? idClient;

  String? idExterno;

  String? versaoClient;

  String? origem;

  //enum origemEnum {  WAITER,  WAITER_MOBILE,  ALFA_SYNC,  IFOOD,  RAPPI,  WABIZ,  FOURALL,  CONCENTRADOR,  OUTRO,  };{
  PessoaDadosIntegracao();

  @override
  String toString() {
    return 'PessoaDadosIntegracao[id=$id, idPessoa=$idPessoa, idClient=$idClient, idExterno=$idExterno, versaoClient=$versaoClient, origem=$origem, ]';
  }

  PessoaDadosIntegracao.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idPessoa'] == null) {
      idPessoa = null;
    } else {
      idPessoa = json['idPessoa'];
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
    if (idPessoa != null)
      json['idPessoa'] = idPessoa;
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

  static List<PessoaDadosIntegracao> listFromJson(List<dynamic> json) {
    return json.map((value) => PessoaDadosIntegracao.fromJson(value)).toList();
  }

  static Map<String, PessoaDadosIntegracao> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, PessoaDadosIntegracao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = PessoaDadosIntegracao.fromJson(value));
    }
    return map;
  }
}

