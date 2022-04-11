part of openapi.api;

class XmlDTO {

  String? xml;

  String? inicioImpressao;

  String? qrCode;

  String? fimImpressao;

  XmlDTO();

  @override
  String toString() {
    return 'XmlDTO[xml=$xml, inicioImpressao=$inicioImpressao, qrCode=$qrCode, fimImpressao=$fimImpressao, ]';
  }

  XmlDTO.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['xml'] == null) {
      xml = null;
    } else {
      xml = json['xml'];
    }
    if (json['inicioImpressao'] == null) {
      inicioImpressao = null;
    } else {
      inicioImpressao = json['inicioImpressao'];
    }
    if (json['qrCode'] == null) {
      qrCode = null;
    } else {
      qrCode = json['qrCode'];
    }
    if (json['fimImpressao'] == null) {
      fimImpressao = null;
    } else {
      fimImpressao = json['fimImpressao'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (xml != null)
      json['xml'] = xml;
    if (inicioImpressao != null)
      json['inicioImpressao'] = inicioImpressao;
    if (qrCode != null)
      json['qrCode'] = qrCode;
    if (fimImpressao != null)
      json['fimImpressao'] = fimImpressao;
    return json;
  }

  static List<XmlDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => XmlDTO.fromJson(value)).toList();
  }

  static Map<String, XmlDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, XmlDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = XmlDTO.fromJson(value));
    }
    return map;
  }
}

