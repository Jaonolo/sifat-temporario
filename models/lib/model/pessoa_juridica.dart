part of openapi.api;

class PessoaJuridica {

  String? pessoaContato;

  String? regimeEstadual;

  //enum regimeEstadualEnum {  NAO_INFORMADO,  SIMPLES,  NORMAL,  };{

  String? regimeFederal;

  //enum regimeFederalEnum {  NAO_INFORMADO,  SIMPLES,  PRESUMIDO,  REAL,  };{

  String? regimeEspecialIssqn;

  //enum regimeEspecialIssqnEnum {  ME,  ESTIMATIVA,  PROFICIONAIS,  COOPERATIVA,  MEI,  };{

  DateTime? validadeIE;

  DateTime? dataAbertura;

  String? indicadorIE;

  //enum indicadorIEEnum {  NAO_INFORMADO,  CONTRIBUINTE,  NAO_CONTRIBUINTE,  CONTRIBUINTE_ISENTO,  };{

  RamoAtividade? ramoAtividade;

  String? inscricaoMunicipal;

  PessoaJuridica();

  @override
  String toString() {
    return 'PessoaJuridica[pessoaContato=$pessoaContato, regimeEstadual=$regimeEstadual, regimeFederal=$regimeFederal, regimeEspecialIssqn=$regimeEspecialIssqn, validadeIE=$validadeIE, dataAbertura=$dataAbertura, indicadorIE=$indicadorIE, ramoAtividade=$ramoAtividade, inscricaoMunicipal=$inscricaoMunicipal, ]';
  }

  PessoaJuridica.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['pessoaContato'] == null) {
      pessoaContato = null;
    } else {
      pessoaContato = json['pessoaContato'];
    }
    if (json['regimeEstadual'] == null) {
      regimeEstadual = null;
    } else {
      regimeEstadual = json['regimeEstadual'];
    }
    if (json['regimeFederal'] == null) {
      regimeFederal = null;
    } else {
      regimeFederal = json['regimeFederal'];
    }
    if (json['regimeEspecialIssqn'] == null) {
      regimeEspecialIssqn = null;
    } else {
      regimeEspecialIssqn = json['regimeEspecialIssqn'];
    }
    if (json['validadeIE'] == null) {
      validadeIE = null;
    } else {
      validadeIE = DateTime.parse(json['validadeIE']);
    }
    if (json['dataAbertura'] == null) {
      dataAbertura = null;
    } else {
      dataAbertura = DateTime.parse(json['dataAbertura']);
    }
    if (json['indicadorIE'] == null) {
      indicadorIE = null;
    } else {
      indicadorIE = json['indicadorIE'];
    }
    if (json['ramoAtividade'] == null) {
      ramoAtividade = null;
    } else {
      ramoAtividade = RamoAtividade.fromJson(json['ramoAtividade']);
    }
    if (json['inscricaoMunicipal'] == null) {
      inscricaoMunicipal = null;
    } else {
      inscricaoMunicipal = json['inscricaoMunicipal'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (pessoaContato != null)
      json['pessoaContato'] = pessoaContato;
    if (regimeEstadual != null)
      json['regimeEstadual'] = regimeEstadual;
    if (regimeFederal != null)
      json['regimeFederal'] = regimeFederal;
    if (regimeEspecialIssqn != null)
      json['regimeEspecialIssqn'] = regimeEspecialIssqn;
    if (validadeIE != null)
      json['validadeIE'] =
      validadeIE == null ? null : validadeIE!.toIso8601String();
    if (dataAbertura != null)
      json['dataAbertura'] =
      dataAbertura == null ? null : dataAbertura!.toIso8601String();
    if (indicadorIE != null)
      json['indicadorIE'] = indicadorIE;
    if (ramoAtividade != null)
      json['ramoAtividade'] = ramoAtividade;
    if (inscricaoMunicipal != null)
      json['inscricaoMunicipal'] = inscricaoMunicipal;
    return json;
  }

  static List<PessoaJuridica> listFromJson(List<dynamic> json) {
    return json.map((value) => PessoaJuridica.fromJson(value)).toList();
  }

  static Map<String, PessoaJuridica> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, PessoaJuridica>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = PessoaJuridica.fromJson(value));
    }
    return map;
  }
}

