part of openapi.api;

class EmpresaFiscal {

  String? certificadoDigital;

  String? nomeCertificado;

  String? senhaCertificado;

  String? codigoSegurancaContribuinte;

  int? identificadorRFB;

  String? ambienteEnum;

  //enum ambienteEnumEnum {  HOMOLOGACAO,  PRODUCAO,  };{
  EmpresaFiscal();

  @override
  String toString() {
    return 'EmpresaFiscal[certificadoDigital=$certificadoDigital, nomeCertificado=$nomeCertificado, senhaCertificado=$senhaCertificado, codigoSegurancaContribuinte=$codigoSegurancaContribuinte, identificadorRFB=$identificadorRFB, ambienteEnum=$ambienteEnum, ]';
  }

  EmpresaFiscal.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['certificadoDigital'] == null) {
      certificadoDigital = null;
    } else {
      certificadoDigital = json['certificadoDigital'];
    }
    if (json['nomeCertificado'] == null) {
      nomeCertificado = null;
    } else {
      nomeCertificado = json['nomeCertificado'];
    }
    if (json['senhaCertificado'] == null) {
      senhaCertificado = null;
    } else {
      senhaCertificado = json['senhaCertificado'];
    }
    if (json['codigoSegurancaContribuinte'] == null) {
      codigoSegurancaContribuinte = null;
    } else {
      codigoSegurancaContribuinte = json['codigoSegurancaContribuinte'];
    }
    if (json['identificadorRFB'] == null) {
      identificadorRFB = null;
    } else {
      identificadorRFB = json['identificadorRFB'];
    }
    if (json['ambienteEnum'] == null) {
      ambienteEnum = null;
    } else {
      ambienteEnum = json['ambienteEnum'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (certificadoDigital != null)
      json['certificadoDigital'] = certificadoDigital;
    if (nomeCertificado != null)
      json['nomeCertificado'] = nomeCertificado;
    if (senhaCertificado != null)
      json['senhaCertificado'] = senhaCertificado;
    if (codigoSegurancaContribuinte != null)
      json['codigoSegurancaContribuinte'] = codigoSegurancaContribuinte;
    if (identificadorRFB != null)
      json['identificadorRFB'] = identificadorRFB;
    if (ambienteEnum != null)
      json['ambienteEnum'] = ambienteEnum;
    return json;
  }

  static List<EmpresaFiscal> listFromJson(List<dynamic> json) {
    return json.map((value) => EmpresaFiscal.fromJson(value)).toList();
  }

  static Map<String, EmpresaFiscal> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EmpresaFiscal>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EmpresaFiscal.fromJson(value));
    }
    return map;
  }
}

