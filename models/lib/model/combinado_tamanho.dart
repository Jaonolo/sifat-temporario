part of openapi.api;

class CombinadoTamanho {

  CombinadoTamanhoPK? id;

  Tamanho? tamanho;

  bool? doisSabores;

  bool? tresSabores;

  bool? quatroSabores;

  CombinadoTamanho();

  @override
  String toString() {
    return 'CombinadoTamanho[id=$id, tamanho=$tamanho, doisSabores=$doisSabores, tresSabores=$tresSabores, quatroSabores=$quatroSabores, ]';
  }

  CombinadoTamanho.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = CombinadoTamanhoPK.fromJson(json['id']);
    }
    if (json['tamanho'] == null) {
      tamanho = null;
    } else {
      tamanho = Tamanho.fromJson(json['tamanho']);
    }
    if (json['doisSabores'] == null) {
      doisSabores = null;
    } else {
      doisSabores = json['doisSabores'];
    }
    if (json['tresSabores'] == null) {
      tresSabores = null;
    } else {
      tresSabores = json['tresSabores'];
    }
    if (json['quatroSabores'] == null) {
      quatroSabores = null;
    } else {
      quatroSabores = json['quatroSabores'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (tamanho != null)
      json['tamanho'] = tamanho;
    if (doisSabores != null)
      json['doisSabores'] = doisSabores;
    if (tresSabores != null)
      json['tresSabores'] = tresSabores;
    if (quatroSabores != null)
      json['quatroSabores'] = quatroSabores;
    return json;
  }

  static List<CombinadoTamanho> listFromJson(List<dynamic> json) {
    return json.map((value) => CombinadoTamanho.fromJson(value)).toList();
  }

  static Map<String, CombinadoTamanho> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CombinadoTamanho>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CombinadoTamanho.fromJson(value));
    }
    return map;
  }
}

