part of openapi.api;

class NotaEvento {

  int? id;

  int? idNota;

  DateTime? data;

  String? eventoNota;

  //enum eventoNotaEnum {  STATUS_EXPEDICAO, STATUS_VENDA, ISENCAO_SERVICO, ISENCAO_FRETE, ACRESCIMO, DESCONTO_PROMOCAO, PRE_DESCONTO, DESCONTO_PRE_DESCONTO, DESCONTO_MANUAL };{

  String? valorAnterior;

  String? valor;

  bool? sincronizado;

  NotaEvento();

  @override
  String toString() {
    return 'NotaEvento[id=$id, idNota=$idNota, data=$data, eventoNota=$eventoNota, valorAnterior=$valorAnterior, valor=$valor, sincronizado=$sincronizado, ]';
  }

  NotaEvento.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idNota'] == null) {
      idNota = null;
    } else {
      idNota = json['idNota'];
    }
    if (json['data'] == null) {
      data = null;
    } else {
      data = DateTime.parse(json['data']);
    }
    if (json['eventoNota'] == null) {
      eventoNota = null;
    } else {
      eventoNota = json['eventoNota'];
    }
    if (json['valorAnterior'] == null) {
      valorAnterior = null;
    } else {
      valorAnterior = json['valorAnterior'];
    }
    if (json['valor'] == null) {
      valor = null;
    } else {
      valor = json['valor'];
    }
    if (json['sincronizado'] == null) {
      sincronizado = null;
    } else {
      sincronizado = json['sincronizado'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idNota != null)
      json['idNota'] = idNota;
    if (data != null)
      json['data'] = data == null ? null : data!.toIso8601String();
    if (eventoNota != null)
      json['eventoNota'] = eventoNota;
    if (valorAnterior != null)
      json['valorAnterior'] = valorAnterior;
    if (valor != null)
      json['valor'] = valor;
    if (sincronizado != null)
      json['sincronizado'] = sincronizado;
    return json;
  }

  static List<NotaEvento> listFromJson(List<dynamic> json) {
    return json.map((value) => NotaEvento.fromJson(value)).toList();
  }

  static Map<String, NotaEvento> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, NotaEvento>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = NotaEvento.fromJson(value));
    }
    return map;
  }
}

