part of openapi.api;

class OperacaoFinalizadoraPK {

  int? idOperacao;

  int? idFinalizadoraEmpresa;

  OperacaoFinalizadoraPK();

  @override
  String toString() {
    return 'OperacaoFinalizadoraPK[idOperacao=$idOperacao, idFinalizadoraEmpresa=$idFinalizadoraEmpresa, ]';
  }

  OperacaoFinalizadoraPK.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['idOperacao'] == null) {
      idOperacao = null;
    } else {
      idOperacao = json['idOperacao'];
    }
    if (json['idFinalizadoraEmpresa'] == null) {
      idFinalizadoraEmpresa = null;
    } else {
      idFinalizadoraEmpresa = json['idFinalizadoraEmpresa'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (idOperacao != null)
      json['idOperacao'] = idOperacao;
    if (idFinalizadoraEmpresa != null)
      json['idFinalizadoraEmpresa'] = idFinalizadoraEmpresa;
    return json;
  }

  static List<OperacaoFinalizadoraPK> listFromJson(List<dynamic> json) {
    return json.map((value) => OperacaoFinalizadoraPK.fromJson(value)).toList();
  }

  static Map<String, OperacaoFinalizadoraPK> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, OperacaoFinalizadoraPK>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = OperacaoFinalizadoraPK.fromJson(value));
    }
    return map;
  }
}

