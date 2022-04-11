part of openapi.api;

class Gerenciador {

  int? id;

  int? idEmpresa;

  Empresa? empresa;

  String? tipoGerenciador;

  //enum tipoGerenciadorEnum {  GERIMPRESSAO,  GERBOMBAS,  GERMICROTERMINAL,  GERCATRACA,  ALFA_SYNC,  CONCENTRADOR,  };{

  DateTime? ultimaExecucao;

  String? token;

  Gerenciador();

  @override
  String toString() {
    return 'Gerenciador[id=$id, idEmpresa=$idEmpresa, empresa=$empresa, tipoGerenciador=$tipoGerenciador, ultimaExecucao=$ultimaExecucao, token=$token, ]';
  }

  Gerenciador.fromJson(Map<String, dynamic> json) {
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
    if (json['empresa'] == null) {
      empresa = null;
    } else {
      empresa = Empresa.fromJson(json['empresa']);
    }
    if (json['tipoGerenciador'] == null) {
      tipoGerenciador = null;
    } else {
      tipoGerenciador = json['tipoGerenciador'];
    }
    if (json['ultimaExecucao'] == null) {
      ultimaExecucao = null;
    } else {
      ultimaExecucao = DateTime.parse(json['ultimaExecucao']);
    }
    if (json['token'] == null) {
      token = null;
    } else {
      token = json['token'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (empresa != null)
      json['empresa'] = empresa;
    if (tipoGerenciador != null)
      json['tipoGerenciador'] = tipoGerenciador;
    if (ultimaExecucao != null)
      json['ultimaExecucao'] =
      ultimaExecucao == null ? null : ultimaExecucao!.toIso8601String();
    if (token != null)
      json['token'] = token;
    return json;
  }

  static List<Gerenciador> listFromJson(List<dynamic> json) {
    return json.map((value) => Gerenciador.fromJson(value)).toList();
  }

  static Map<String, Gerenciador> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Gerenciador>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Gerenciador.fromJson(value));
    }
    return map;
  }
}

