part of openapi.api;

class EstacaoLeitor {

  String? modelo = 'NENHUM';

  //enum modeloEnum {  NENHUM,  GERTEC,  DATALOGIC,  SYMBOL,  };{

  String? portaSerial;

  //enum portaSerialEnum {  COM1,  COM2,  COM3,  COM4,  COM5,  COM6,  COM7,  COM8,  COM9,  };{

  String? settings;

  int? handshaking;

  EstacaoLeitor();

  @override
  String toString() {
    return 'EstacaoLeitor[modelo=$modelo, portaSerial=$portaSerial, settings=$settings, handshaking=$handshaking, ]';
  }

  EstacaoLeitor.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['modelo'] == null) {
      modelo = null;
    } else {
      modelo = json['modelo'];
    }
    if (json['portaSerial'] == null) {
      portaSerial = null;
    } else {
      portaSerial = json['portaSerial'];
    }
    if (json['settings'] == null) {
      settings = null;
    } else {
      settings = json['settings'];
    }
    if (json['handshaking'] == null) {
      handshaking = null;
    } else {
      handshaking = json['handshaking'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (modelo != null)
      json['modelo'] = modelo;
    if (portaSerial != null)
      json['portaSerial'] = portaSerial;
    if (settings != null)
      json['settings'] = settings;
    if (handshaking != null)
      json['handshaking'] = handshaking;
    return json;
  }

  static List<EstacaoLeitor> listFromJson(List<dynamic> json) {
    return json.map((value) => EstacaoLeitor.fromJson(value)).toList();
  }

  static Map<String, EstacaoLeitor> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EstacaoLeitor>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EstacaoLeitor.fromJson(value));
    }
    return map;
  }
}

