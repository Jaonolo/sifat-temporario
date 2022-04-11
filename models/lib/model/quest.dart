part of openapi.api;

class Quest {

  int? id;

  int? idEmpresa;

  String? usuario;

  String? senha;

  int? idFinalizadoraEmpresa;

  FinalizadoraEmpresa? finalizadoraEmpresa;

  bool? ativo;

  Quest();

  @override
  String toString() {
    return 'Quest[id=$id, idEmpresa=$idEmpresa, usuario=$usuario, senha=$senha, idFinalizadoraEmpresa=$idFinalizadoraEmpresa, finalizadoraEmpresa=$finalizadoraEmpresa, ativo=$ativo, ]';
  }

  Quest.fromJson(Map<String, dynamic>? json) {
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
    if (json['usuario'] == null) {
      usuario = null;
    } else {
      usuario = json['usuario'];
    }
    if (json['senha'] == null) {
      senha = null;
    } else {
      senha = json['senha'];
    }
    if (json['idFinalizadoraEmpresa'] == null) {
      idFinalizadoraEmpresa = null;
    } else {
      idFinalizadoraEmpresa = json['idFinalizadoraEmpresa'];
    }
    if (json['finalizadoraEmpresa'] == null) {
      finalizadoraEmpresa = null;
    } else {
      finalizadoraEmpresa =
          FinalizadoraEmpresa.fromJson(json['finalizadoraEmpresa']);
    }
    if (json['ativo'] == null) {
      ativo = null;
    } else {
      ativo = json['ativo'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (usuario != null)
      json['usuario'] = usuario;
    if (senha != null)
      json['senha'] = senha;
    if (idFinalizadoraEmpresa != null)
      json['idFinalizadoraEmpresa'] = idFinalizadoraEmpresa;
    if (finalizadoraEmpresa != null)
      json['finalizadoraEmpresa'] = finalizadoraEmpresa;
    if (ativo != null)
      json['ativo'] = ativo;
    return json;
  }

  static List<Quest> listFromJson(List<dynamic> json) {
    return json.map((value) => Quest.fromJson(value)).toList();
  }

  static Map<String, Quest> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Quest>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Quest.fromJson(value));
    }
    return map;
  }
}

