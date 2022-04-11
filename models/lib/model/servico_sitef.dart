part of openapi.api;

class ServicoSitef {

  int? id;

  int? idEmpresa;

  String? ipServidor;

  String? numeroLoja;

  bool? ativo;

  ServicoSitef();

  @override
  String toString() {
    return 'ServicoSitef[id=$id, idEmpresa=$idEmpresa, ipServidor=$ipServidor, numeroLoja=$numeroLoja, ativo=$ativo, ]';
  }

  ServicoSitef.fromJson(Map<String, dynamic>? json) {
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
    if (json['ipServidor'] == null) {
      ipServidor = null;
    } else {
      ipServidor = json['ipServidor'];
    }
    if (json['numeroLoja'] == null) {
      numeroLoja = null;
    } else {
      numeroLoja = json['numeroLoja'];
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
    if (ipServidor != null)
      json['ipServidor'] = ipServidor;
    if (numeroLoja != null)
      json['numeroLoja'] = numeroLoja;
    if (ativo != null)
      json['ativo'] = ativo;
    return json;
  }

  static List<ServicoSitef> listFromJson(List<dynamic> json) {
    return json.map((value) => ServicoSitef.fromJson(value)).toList();
  }

  static Map<String, ServicoSitef> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ServicoSitef>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ServicoSitef.fromJson(value));
    }
    return map;
  }
}

