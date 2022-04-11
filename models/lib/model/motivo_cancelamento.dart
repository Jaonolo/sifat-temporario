part of openapi.api;

class MotivoCancelamento {

  int? id;

  int? idEmpresa;

  String? descricao;

  String? escopo;

  //enum escopoEnum {  MENSALISTA,  VENDA,  };{

  int? getId;

  int? versao;

  MotivoCancelamento();

  @override
  String toString() {
    return 'MotivoCancelamento[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, escopo=$escopo, getId=$getId, versao=$versao, ]';
  }

  MotivoCancelamento.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idEmpresa'] == null) {
      idEmpresa = null;
    } else {
      idEmpresa = json['idEmpresa'];
    }
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
    if (json['escopo'] == null) {
      escopo = null;
    } else {
      escopo = json['escopo'];
    }
    if (json['get_id'] == null) {
      getId = null;
    } else {
      getId = json['get_id'];
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
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (descricao != null)
      json['descricao'] = descricao;
    if (escopo != null)
      json['escopo'] = escopo;
    if (getId != null)
      json['get_id'] = getId;
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<MotivoCancelamento> listFromJson(List<dynamic> json) {
    return json.map((value) => MotivoCancelamento.fromJson(value)).toList();
  }

  static Map<String, MotivoCancelamento> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, MotivoCancelamento>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = MotivoCancelamento.fromJson(value));
    }
    return map;
  }
}

