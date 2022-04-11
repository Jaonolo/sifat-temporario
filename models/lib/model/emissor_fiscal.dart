part of openapi.api;

class EmissorFiscal {

  int? id;

  int? idEmpresa;

  String? modeloFiscal;

  //enum modeloFiscalEnum {  NENHUM,  NFE,  CFE,  NFCE,  };{

  String? serie;

  int? numero;

  String? marca;

  //enum marcaEnum {  NENHUM,  DIMEP,  EPSON,  ELGIN,  NITERE,  CONTROL_ID,  };{

  String? modelo;

  String? situacao;

  //enum situacaoEnum {  ATIVO,  CESSADO,  };{

  String? codigoAtivacao;

  String? autoridadeCertificadora;

  int? versaoLayout;

  EmissorFiscal();

  @override
  String toString() {
    return 'EmissorFiscal[id=$id, idEmpresa=$idEmpresa, modeloFiscal=$modeloFiscal, serie=$serie, numero=$numero, marca=$marca, modelo=$modelo, situacao=$situacao, codigoAtivacao=$codigoAtivacao, autoridadeCertificadora=$autoridadeCertificadora, versaoLayout=$versaoLayout, ]';
  }

  EmissorFiscal.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idEmpresa'] == null) {
      idEmpresa = null;
    } else {
      idEmpresa = json['idEmpresa'];
    }
    if (json['modeloFiscal'] == null) {
      modeloFiscal = null;
    } else {
      modeloFiscal = json['modeloFiscal'];
    }
    if (json['serie'] == null) {
      serie = null;
    } else {
      serie = json['serie'];
    }
    if (json['numero'] == null) {
      numero = null;
    } else {
      numero = json['numero'];
    }
    if (json['marca'] == null) {
      marca = null;
    } else {
      marca = json['marca'];
    }
    if (json['modelo'] == null) {
      modelo = null;
    } else {
      modelo = json['modelo'];
    }
    if (json['situacao'] == null) {
      situacao = null;
    } else {
      situacao = json['situacao'];
    }
    if (json['codigoAtivacao'] == null) {
      codigoAtivacao = null;
    } else {
      codigoAtivacao = json['codigoAtivacao'];
    }
    if (json['autoridadeCertificadora'] == null) {
      autoridadeCertificadora = null;
    } else {
      autoridadeCertificadora = json['autoridadeCertificadora'];
    }
    if (json['versaoLayout'] == null) {
      versaoLayout = null;
    } else {
      versaoLayout = json['versaoLayout'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (modeloFiscal != null)
      json['modeloFiscal'] = modeloFiscal;
    if (serie != null)
      json['serie'] = serie;
    if (numero != null)
      json['numero'] = numero;
    if (marca != null)
      json['marca'] = marca;
    if (modelo != null)
      json['modelo'] = modelo;
    if (situacao != null)
      json['situacao'] = situacao;
    if (codigoAtivacao != null)
      json['codigoAtivacao'] = codigoAtivacao;
    if (autoridadeCertificadora != null)
      json['autoridadeCertificadora'] = autoridadeCertificadora;
    if (versaoLayout != null)
      json['versaoLayout'] = versaoLayout;
    return json;
  }

  static List<EmissorFiscal> listFromJson(List<dynamic> json) {
    return json.map((value) => EmissorFiscal.fromJson(value)).toList();
  }

  static Map<String, EmissorFiscal> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EmissorFiscal>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EmissorFiscal.fromJson(value));
    }
    return map;
  }
}

