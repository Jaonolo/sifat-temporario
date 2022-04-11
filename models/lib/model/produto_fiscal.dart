part of openapi.api;

class ProdutoFiscal {

  String? codigoNcm;

  Ncm? ncm;

  String? codigoCest;

  Cest? cest;

  String? especie;

  //enum especieEnum {  VEICULO_NOVO,  MEDICAMENTO,  ARMAMENTO,  COMBUSTIVEL,  LUBRIFICANTE,  GUARDA_VOLUME,  GORGETA_GARCOM, BEBIDA_ALCOOLICA,  OUTRAS,  };{

  int? codigoOrigemMercadoria;

  OrigemMercadoria? origemMercadoria;

  String? codigoEanGtin;

  ProdutoFiscal();

  @override
  String toString() {
    return 'ProdutoFiscal[codigoNcm=$codigoNcm, ncm=$ncm, codigoCest=$codigoCest, cest=$cest, especie=$especie, codigoOrigemMercadoria=$codigoOrigemMercadoria, origemMercadoria=$origemMercadoria, codigoEanGtin=$codigoEanGtin, ]';
  }

  ProdutoFiscal.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['codigoNcm'] == null) {
      codigoNcm = null;
    } else {
      codigoNcm = json['codigoNcm'];
    }
    if (json['ncm'] == null) {
      ncm = null;
    } else {
      ncm = Ncm.fromJson(json['ncm']);
    }
    if (json['codigoCest'] == null) {
      codigoCest = null;
    } else {
      codigoCest = json['codigoCest'];
    }
    if (json['cest'] == null) {
      cest = null;
    } else {
      cest = Cest.fromJson(json['cest']);
    }
    if (json['especie'] == null) {
      especie = null;
    } else {
      especie = json['especie'];
    }
    if (json['codigoOrigemMercadoria'] == null) {
      codigoOrigemMercadoria = null;
    } else {
      codigoOrigemMercadoria = json['codigoOrigemMercadoria'];
    }
    if (json['origemMercadoria'] == null) {
      origemMercadoria = null;
    } else {
      origemMercadoria = OrigemMercadoria.fromJson(json['origemMercadoria']);
    }
    if (json['codigoEanGtin'] == null) {
      codigoEanGtin = null;
    } else {
      codigoEanGtin = json['codigoEanGtin'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (codigoNcm != null)
      json['codigoNcm'] = codigoNcm;
    if (ncm != null)
      json['ncm'] = ncm;
    if (codigoCest != null)
      json['codigoCest'] = codigoCest;
    if (cest != null)
      json['cest'] = cest;
    if (especie != null)
      json['especie'] = especie;
    if (codigoOrigemMercadoria != null)
      json['codigoOrigemMercadoria'] = codigoOrigemMercadoria;
    if (origemMercadoria != null)
      json['origemMercadoria'] = origemMercadoria;
    if (codigoEanGtin != null)
      json['codigoEanGtin'] = codigoEanGtin;
    return json;
  }

  static List<ProdutoFiscal> listFromJson(List<dynamic> json) {
    return json.map((value) => ProdutoFiscal.fromJson(value)).toList();
  }

  static Map<String, ProdutoFiscal> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ProdutoFiscal>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ProdutoFiscal.fromJson(value));
    }
    return map;
  }
}

