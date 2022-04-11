part of openapi.api;

class EnvioPreCadastro {

  String? cnpjParceiro;

  String? cpfCnpjParticipante;

  String? primeiroNome;

  String? numeroCelular;

  String? email;

  int? dDDCelular;

  EnvioPreCadastro();

  @override
  String toString() {
    return 'EnvioPreCadastro[cnpjParceiro=$cnpjParceiro, cpfCnpjParticipante=$cpfCnpjParticipante, primeiroNome=$primeiroNome, numeroCelular=$numeroCelular, email=$email, dDDCelular=$dDDCelular, ]';
  }

  EnvioPreCadastro.fromJson(Map<String, dynamic> json) {
    if (json['CnpjParceiro'] == null) {
      cnpjParceiro = null;
    } else {
      cnpjParceiro = json['CnpjParceiro'];
    }
    if (json['CpfCnpjParticipante'] == null) {
      cpfCnpjParticipante = null;
    } else {
      cpfCnpjParticipante = json['CpfCnpjParticipante'];
    }
    if (json['PrimeiroNome'] == null) {
      primeiroNome = null;
    } else {
      primeiroNome = json['PrimeiroNome'];
    }
    if (json['NumeroCelular'] == null) {
      numeroCelular = null;
    } else {
      numeroCelular = json['NumeroCelular'];
    }
    if (json['Email'] == null) {
      email = null;
    } else {
      email = json['Email'];
    }
    if (json['DDDCelular'] == null) {
      dDDCelular = null;
    } else {
      dDDCelular = json['DDDCelular'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (cnpjParceiro != null)
      json['CnpjParceiro'] = cnpjParceiro;
    if (cpfCnpjParticipante != null)
      json['CpfCnpjParticipante'] = cpfCnpjParticipante;
    if (primeiroNome != null)
      json['PrimeiroNome'] = primeiroNome;
    if (numeroCelular != null)
      json['NumeroCelular'] = numeroCelular;
    if (email != null)
      json['Email'] = email;
    if (dDDCelular != null)
      json['DDDCelular'] = dDDCelular;
    return json;
  }

  static List<EnvioPreCadastro> listFromJson(List<dynamic> json) {
    return json.map((value) => EnvioPreCadastro.fromJson(value)).toList();
  }

  static Map<String, EnvioPreCadastro> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EnvioPreCadastro>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EnvioPreCadastro.fromJson(value));
    }
    return map;
  }
}

