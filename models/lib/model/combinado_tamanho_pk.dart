part of openapi.api;

class CombinadoTamanhoPK {

  int? idMenuCombinado;

  int? idTamanho;

  CombinadoTamanhoPK();

  @override
  String toString() {
    return 'CombinadoTamanhoPK[idMenuCombinado=$idMenuCombinado, idTamanho=$idTamanho, ]';
  }

  CombinadoTamanhoPK.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['idMenuCombinado'] == null) {
      idMenuCombinado = null;
    } else {
      idMenuCombinado = json['idMenuCombinado'];
    }
    if (json['idTamanho'] == null) {
      idTamanho = null;
    } else {
      idTamanho = json['idTamanho'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (idMenuCombinado != null)
      json['idMenuCombinado'] = idMenuCombinado;
    if (idTamanho != null)
      json['idTamanho'] = idTamanho;
    return json;
  }

  static List<CombinadoTamanhoPK> listFromJson(List<dynamic> json) {
    return json.map((value) => CombinadoTamanhoPK.fromJson(value)).toList();
  }

  static Map<String, CombinadoTamanhoPK> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, CombinadoTamanhoPK>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CombinadoTamanhoPK.fromJson(value));
    }
    return map;
  }
}

