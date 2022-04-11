part of openapi.api;

class SolicitarConfiguracaoDTO {

  String? nomeEstacao;

  String? incricaoFereral;

  int? variacao;

  String? usuario;

  String? senha;

  int? codigoVerificador;

  DateTime? data;

  String? clientSecret;

  SolicitarConfiguracaoDTO();

  @override
  String toString() {
    return 'SolicitarConfiguracaoDTO[nomeEstacao=$nomeEstacao, incricaoFereral=$incricaoFereral, variacao=$variacao, usuario=$usuario, senha=$senha, codigoVerificador=$codigoVerificador, data=$data, clientSecret=$clientSecret, ]';
  }

  SolicitarConfiguracaoDTO.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['nomeEstacao'] == null) {
      nomeEstacao = null;
    } else {
      nomeEstacao = json['nomeEstacao'];
    }
    if (json['incricaoFereral'] == null) {
      incricaoFereral = null;
    } else {
      incricaoFereral = json['incricaoFereral'];
    }
    if (json['variacao'] == null) {
      variacao = null;
    } else {
      variacao = json['variacao'];
    }
    if (json['usuario'] == null) {
      usuario = null;
    } else {
      usuario = json['usuario'];
    }
    if (json['senha'] == null) {
      senha = null;
    } else {
      senha = json['senha'];
    }
    if (json['codigoVerificador'] == null) {
      codigoVerificador = null;
    } else {
      codigoVerificador = json['codigoVerificador'];
    }
    if (json['data'] == null) {
      data = null;
    } else {
      data = DateTime.parse(json['data']);
    }
    if (json['clientSecret'] == null) {
      clientSecret = null;
    } else {
      clientSecret = json['clientSecret'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (nomeEstacao != null)
      json['nomeEstacao'] = nomeEstacao;
    if (incricaoFereral != null)
      json['incricaoFereral'] = incricaoFereral;
    if (variacao != null)
      json['variacao'] = variacao;
    if (usuario != null)
      json['usuario'] = usuario;
    if (senha != null)
      json['senha'] = senha;
    if (codigoVerificador != null)
      json['codigoVerificador'] = codigoVerificador;
    if (data != null)
      json['data'] = data == null ? null : data!.toIso8601String();
    if (clientSecret != null)
      json['clientSecret'] = clientSecret;
    return json;
  }

  static List<SolicitarConfiguracaoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => SolicitarConfiguracaoDTO.fromJson(value))
        .toList();
  }

  static Map<String, SolicitarConfiguracaoDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, SolicitarConfiguracaoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = SolicitarConfiguracaoDTO.fromJson(value));
    }
    return map;
  }
}

