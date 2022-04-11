part of openapi.api;

class Observacao {

  int? id;

  int? idEmpresa;

  int? codigo;

  String? descricao;

  bool? ativo;

  int? getId;

  int? versao;

  Observacao();

  @override
  String toString() {
    return 'Observacao[id=$id, idEmpresa=$idEmpresa, codigo=$codigo, descricao=$descricao, ativo=$ativo, getId=$getId, versao=$versao, ]';
  }

  Observacao.fromJson(Map<String, dynamic>? json) {
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
    if (json['codigo'] == null) {
      codigo = null;
    } else {
      codigo = json['codigo'];
    }
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
    if (json['ativo'] == null) {
      ativo = null;
    } else {
      ativo = json['ativo'];
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
    if (codigo != null)
      json['codigo'] = codigo;
    if (descricao != null)
      json['descricao'] = descricao;
    if (ativo != null)
      json['ativo'] = ativo;
    if (getId != null)
      json['get_id'] = getId;
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<Observacao> listFromJson(List<dynamic> json) {
    return json.map((value) => Observacao.fromJson(value)).toList();
  }

  static Map<String, Observacao> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Observacao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Observacao.fromJson(value));
    }
    return map;
  }
}

