part of openapi.api;

class Telefone {

  int? id;

  int? idPessoa;

  String? descricao;

  String? telefone;

  String? tipo;

  //enum tipoEnum {  RESIDENCIAL,  COMERCIAL,  CELULAR,  OUTRO,  };{

  bool? principal = false;

  int? idConcentrador;

  int? versao;

  Telefone();

  @override
  String toString() {
    return 'Telefone[id=$id, idPessoa=$idPessoa, descricao=$descricao, telefone=$telefone, tipo=$tipo, principal=$principal, idConcentrador=$idConcentrador, versao=$versao, ]';
  }

  Telefone.fromJson(Map<String, dynamic> json) {
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
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
    if (json['telefone'] == null) {
      telefone = null;
    } else {
      telefone = json['telefone'];
    }
    if (json['tipo'] == null) {
      tipo = null;
    } else {
      tipo = json['tipo'];
    }
    if (json['principal'] == null) {
      principal = null;
    } else {
      principal = json['principal'];
    }
    if (json['idConcentrador'] == null) {
      idConcentrador = null;
    } else {
      idConcentrador = json['idConcentrador'];
    }
    if (json['versao'] == null) {
      versao = null;
    } else {
      versao = json['versao'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idPessoa != null)
      json['idPessoa'] = idPessoa;
    if (descricao != null)
      json['descricao'] = descricao;
    if (telefone != null)
      json['telefone'] = telefone;
    if (tipo != null)
      json['tipo'] = tipo;
    if (principal != null)
      json['principal'] = principal;
    if (idConcentrador != null)
      json['idConcentrador'] = idConcentrador;
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<Telefone> listFromJson(List<dynamic> json) {
    return json.map((value) => Telefone.fromJson(value)).toList();
  }

  static Map<String, Telefone> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Telefone>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Telefone.fromJson(value));
    }
    return map;
  }
}

