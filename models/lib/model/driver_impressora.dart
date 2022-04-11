part of openapi.api;

class DriverImpressora {

  int? id;

  String? marca;

  //enum marcaEnum {  Nenhuma - ,  Bematech - Todos,  Daruma - Todos,  Elgin - Todos,  Epson - Todos,  Tanca - Todos,  Control ID - Todos,  Sweda - Todos,  Diebold - Todos,  };{

  String? descricao;

  bool? driverProprio;

  int? linhasRodape;

  String? enfatizadoInicio;

  String? enfatizadoFim;

  String? expandidoInicio;

  String? expandidoFim;

  String? expandidoExtraInicio;

  String? expandidoExtraFim;

  String? comprimidoInicio;

  String? comprimidoFim;

  String? ean13Inicio;

  String? ean13Fim;

  String? espacamentoPadrao;

  String? espacamentoDesejado;

  String? fonte;

  String? gaveta;

  String? guilhotina;

  String? beep;

  String? reset;

  String? leituraStatus;

  String? invertidoInicio;

  String? invertidoFim;

  String? qrcodeInicio;

  String? qrcodeFim;

  String? barcodeInicio;

  String? barcodeFim;

  DriverImpressora();

  @override
  String toString() {
    return 'DriverImpressora[id=$id, marca=$marca, descricao=$descricao, driverProprio=$driverProprio, linhasRodape=$linhasRodape, enfatizadoInicio=$enfatizadoInicio, enfatizadoFim=$enfatizadoFim, expandidoInicio=$expandidoInicio, expandidoFim=$expandidoFim, expandidoExtraInicio=$expandidoExtraInicio, expandidoExtraFim=$expandidoExtraFim, comprimidoInicio=$comprimidoInicio, comprimidoFim=$comprimidoFim, ean13Inicio=$ean13Inicio, ean13Fim=$ean13Fim, espacamentoPadrao=$espacamentoPadrao, espacamentoDesejado=$espacamentoDesejado, fonte=$fonte, gaveta=$gaveta, guilhotina=$guilhotina, beep=$beep, reset=$reset, leituraStatus=$leituraStatus, invertidoInicio=$invertidoInicio, invertidoFim=$invertidoFim, qrcodeInicio=$qrcodeInicio, qrcodeFim=$qrcodeFim, barcodeInicio=$barcodeInicio, barcodeFim=$barcodeFim, ]';
  }

  DriverImpressora.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['marca'] == null) {
      marca = null;
    } else {
      marca = json['marca'];
    }
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
    if (json['driverProprio'] == null) {
      driverProprio = null;
    } else {
      driverProprio = json['driverProprio'];
    }
    if (json['linhasRodape'] == null) {
      linhasRodape = null;
    } else {
      linhasRodape = json['linhasRodape'];
    }
    if (json['enfatizadoInicio'] == null) {
      enfatizadoInicio = null;
    } else {
      enfatizadoInicio = json['enfatizadoInicio'];
    }
    if (json['enfatizadoFim'] == null) {
      enfatizadoFim = null;
    } else {
      enfatizadoFim = json['enfatizadoFim'];
    }
    if (json['expandidoInicio'] == null) {
      expandidoInicio = null;
    } else {
      expandidoInicio = json['expandidoInicio'];
    }
    if (json['expandidoFim'] == null) {
      expandidoFim = null;
    } else {
      expandidoFim = json['expandidoFim'];
    }
    if (json['expandidoExtraInicio'] == null) {
      expandidoExtraInicio = null;
    } else {
      expandidoExtraInicio = json['expandidoExtraInicio'];
    }
    if (json['expandidoExtraFim'] == null) {
      expandidoExtraFim = null;
    } else {
      expandidoExtraFim = json['expandidoExtraFim'];
    }
    if (json['comprimidoInicio'] == null) {
      comprimidoInicio = null;
    } else {
      comprimidoInicio = json['comprimidoInicio'];
    }
    if (json['comprimidoFim'] == null) {
      comprimidoFim = null;
    } else {
      comprimidoFim = json['comprimidoFim'];
    }
    if (json['ean13Inicio'] == null) {
      ean13Inicio = null;
    } else {
      ean13Inicio = json['ean13Inicio'];
    }
    if (json['ean13Fim'] == null) {
      ean13Fim = null;
    } else {
      ean13Fim = json['ean13Fim'];
    }
    if (json['espacamentoPadrao'] == null) {
      espacamentoPadrao = null;
    } else {
      espacamentoPadrao = json['espacamentoPadrao'];
    }
    if (json['espacamentoDesejado'] == null) {
      espacamentoDesejado = null;
    } else {
      espacamentoDesejado = json['espacamentoDesejado'];
    }
    if (json['fonte'] == null) {
      fonte = null;
    } else {
      fonte = json['fonte'];
    }
    if (json['gaveta'] == null) {
      gaveta = null;
    } else {
      gaveta = json['gaveta'];
    }
    if (json['guilhotina'] == null) {
      guilhotina = null;
    } else {
      guilhotina = json['guilhotina'];
    }
    if (json['beep'] == null) {
      beep = null;
    } else {
      beep = json['beep'];
    }
    if (json['reset'] == null) {
      reset = null;
    } else {
      reset = json['reset'];
    }
    if (json['leituraStatus'] == null) {
      leituraStatus = null;
    } else {
      leituraStatus = json['leituraStatus'];
    }
    if (json['invertidoInicio'] == null) {
      invertidoInicio = null;
    } else {
      invertidoInicio = json['invertidoInicio'];
    }
    if (json['invertidoFim'] == null) {
      invertidoFim = null;
    } else {
      invertidoFim = json['invertidoFim'];
    }
    if (json['qrcodeInicio'] == null) {
      qrcodeInicio = null;
    } else {
      qrcodeInicio = json['qrcodeInicio'];
    }
    if (json['qrcodeFim'] == null) {
      qrcodeFim = null;
    } else {
      qrcodeFim = json['qrcodeFim'];
    }
    if (json['barcodeInicio'] == null) {
      barcodeInicio = null;
    } else {
      barcodeInicio = json['barcodeInicio'];
    }
    if (json['barcodeFim'] == null) {
      barcodeFim = null;
    } else {
      barcodeFim = json['barcodeFim'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (marca != null)
      json['marca'] = marca;
    if (descricao != null)
      json['descricao'] = descricao;
    if (driverProprio != null)
      json['driverProprio'] = driverProprio;
    if (linhasRodape != null)
      json['linhasRodape'] = linhasRodape;
    if (enfatizadoInicio != null)
      json['enfatizadoInicio'] = enfatizadoInicio;
    if (enfatizadoFim != null)
      json['enfatizadoFim'] = enfatizadoFim;
    if (expandidoInicio != null)
      json['expandidoInicio'] = expandidoInicio;
    if (expandidoFim != null)
      json['expandidoFim'] = expandidoFim;
    if (expandidoExtraInicio != null)
      json['expandidoExtraInicio'] = expandidoExtraInicio;
    if (expandidoExtraFim != null)
      json['expandidoExtraFim'] = expandidoExtraFim;
    if (comprimidoInicio != null)
      json['comprimidoInicio'] = comprimidoInicio;
    if (comprimidoFim != null)
      json['comprimidoFim'] = comprimidoFim;
    if (ean13Inicio != null)
      json['ean13Inicio'] = ean13Inicio;
    if (ean13Fim != null)
      json['ean13Fim'] = ean13Fim;
    if (espacamentoPadrao != null)
      json['espacamentoPadrao'] = espacamentoPadrao;
    if (espacamentoDesejado != null)
      json['espacamentoDesejado'] = espacamentoDesejado;
    if (fonte != null)
      json['fonte'] = fonte;
    if (gaveta != null)
      json['gaveta'] = gaveta;
    if (guilhotina != null)
      json['guilhotina'] = guilhotina;
    if (beep != null)
      json['beep'] = beep;
    if (reset != null)
      json['reset'] = reset;
    if (leituraStatus != null)
      json['leituraStatus'] = leituraStatus;
    if (invertidoInicio != null)
      json['invertidoInicio'] = invertidoInicio;
    if (invertidoFim != null)
      json['invertidoFim'] = invertidoFim;
    if (qrcodeInicio != null)
      json['qrcodeInicio'] = qrcodeInicio;
    if (qrcodeFim != null)
      json['qrcodeFim'] = qrcodeFim;
    if (barcodeInicio != null)
      json['barcodeInicio'] = barcodeInicio;
    if (barcodeFim != null)
      json['barcodeFim'] = barcodeFim;
    return json;
  }

  static List<DriverImpressora> listFromJson(List<dynamic> json) {
    return json.map((value) => DriverImpressora.fromJson(value)).toList();
  }

  static Map<String, DriverImpressora> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, DriverImpressora>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = DriverImpressora.fromJson(value));
    }
    return map;
  }
}

