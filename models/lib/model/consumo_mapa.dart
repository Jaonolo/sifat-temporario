part of openapi.api;

class ConsumoMapa {

  int? id;

  Nota? nota;

  int? idEmpresa;

  String? modulo;

  //enum moduloEnum {  GERAL,  MESA,  FICHA,  DELIVERY,  CARTAO,  BALCAO,  DRIVE_THRU,  };{

  int? comanda;

  int? idConcentrador;

  ConsumoMapa();

  @override
  String toString() {
    return 'ConsumoMapa[id=$id, nota=$nota, idEmpresa=$idEmpresa, modulo=$modulo, comanda=$comanda, idConcentrador=$idConcentrador, ]';
  }

  ConsumoMapa.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['nota'] == null) {
      nota = null;
    } else {
      nota = Nota.fromJson(json['nota']);
    }
    if (json['idEmpresa'] == null) {
      idEmpresa = null;
    } else {
      idEmpresa = json['idEmpresa'];
    }
    if (json['modulo'] == null) {
      modulo = null;
    } else {
      modulo = json['modulo'];
    }
    if (json['comanda'] == null) {
      comanda = null;
    } else {
      comanda = json['comanda'];
    }
    if (json['idConcentrador'] == null) {
      idConcentrador = null;
    } else {
      idConcentrador = json['idConcentrador'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (nota != null)
      json['nota'] = nota;
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (modulo != null)
      json['modulo'] = modulo;
    if (comanda != null)
      json['comanda'] = comanda;
    if (idConcentrador != null)
      json['idConcentrador'] = idConcentrador;
    return json;
  }

  static List<ConsumoMapa> listFromJson(List<dynamic> json) {
    return json.map((value) => ConsumoMapa.fromJson(value)).toList();
  }

  static Map<String, ConsumoMapa> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ConsumoMapa>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ConsumoMapa.fromJson(value));
    }
    return map;
  }
}

