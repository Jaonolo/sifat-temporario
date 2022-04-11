part of openapi.api;

class ServicoCatraca {

  int? id;

  int? idEstacao;

  String? token;

  String? ip;

  String? marca;

  //enum marcaEnum {  NENHUM,  HENRY,  };{

  String? modelo;

  //enum modeloEnum {  NENHUM,  TODOS,  };{

  int? porta;

  String? pastaEnvio;

  String? pastaRetorno;

  bool? ativo;

  ServicoCatraca();

  @override
  String toString() {
    return 'ServicoCatraca[id=$id, idEstacao=$idEstacao, token=$token, ip=$ip, marca=$marca, modelo=$modelo, porta=$porta, pastaEnvio=$pastaEnvio, pastaRetorno=$pastaRetorno, ativo=$ativo, ]';
  }

  ServicoCatraca.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idEstacao'] == null) {
      idEstacao = null;
    } else {
      idEstacao = json['idEstacao'];
    }
    if (json['token'] == null) {
      token = null;
    } else {
      token = json['token'];
    }
    if (json['ip'] == null) {
      ip = null;
    } else {
      ip = json['ip'];
    }
    if (json['marca'] == null) {
      marca = null;
    } else {
      marca = json['marca'];
    }
    if (json['modelo'] == null) {
      modelo = null;
    } else {
      modelo = json['modelo'];
    }
    if (json['porta'] == null) {
      porta = null;
    } else {
      porta = json['porta'];
    }
    if (json['pastaEnvio'] == null) {
      pastaEnvio = null;
    } else {
      pastaEnvio = json['pastaEnvio'];
    }
    if (json['pastaRetorno'] == null) {
      pastaRetorno = null;
    } else {
      pastaRetorno = json['pastaRetorno'];
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
    if (idEstacao != null)
      json['idEstacao'] = idEstacao;
    if (token != null)
      json['token'] = token;
    if (ip != null)
      json['ip'] = ip;
    if (marca != null)
      json['marca'] = marca;
    if (modelo != null)
      json['modelo'] = modelo;
    if (porta != null)
      json['porta'] = porta;
    if (pastaEnvio != null)
      json['pastaEnvio'] = pastaEnvio;
    if (pastaRetorno != null)
      json['pastaRetorno'] = pastaRetorno;
    if (ativo != null)
      json['ativo'] = ativo;
    return json;
  }

  static List<ServicoCatraca> listFromJson(List<dynamic> json) {
    return json.map((value) => ServicoCatraca.fromJson(value)).toList();
  }

  static Map<String, ServicoCatraca> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ServicoCatraca>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ServicoCatraca.fromJson(value));
    }
    return map;
  }
}

