part of openapi.api;

class Cfop {

  int? cfop;

  String? descricao;

  bool? nfe;

  bool? comunicacao;

  bool? transportadora;

  bool? devolucao;

  Cfop();

  @override
  String toString() {
    return 'Cfop[cfop=$cfop, descricao=$descricao, nfe=$nfe, comunicacao=$comunicacao, transportadora=$transportadora, devolucao=$devolucao, ]';
  }

  Cfop.fromJson(Map<String, dynamic> json) {
    if (json['cfop'] == null) {
      cfop = null;
    } else {
      cfop = json['cfop'];
    }
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
    if (json['nfe'] == null) {
      nfe = null;
    } else {
      nfe = json['nfe'];
    }
    if (json['comunicacao'] == null) {
      comunicacao = null;
    } else {
      comunicacao = json['comunicacao'];
    }
    if (json['transportadora'] == null) {
      transportadora = null;
    } else {
      transportadora = json['transportadora'];
    }
    if (json['devolucao'] == null) {
      devolucao = null;
    } else {
      devolucao = json['devolucao'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (cfop != null) {
      json['cfop'] = cfop;
    }
    if (descricao != null) {
      json['descricao'] = descricao;
    }
    if (nfe != null) {
      json['nfe'] = nfe;
    }
    if (comunicacao != null) {
      json['comunicacao'] = comunicacao;
    }
    if (transportadora != null) {
      json['transportadora'] = transportadora;
    }
    if (devolucao != null) {
      json['devolucao'] = devolucao;
    }
    return json;
  }

  static List<Cfop> listFromJson(List<dynamic> json) {
    return json.map((value) => Cfop.fromJson(value)).toList();
  }

  static Map<String, Cfop> mapFromJson(Map<String, dynamic> json) {
    Map<String, Cfop> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Cfop.fromJson(value));
    }
    return map;
  }
}

