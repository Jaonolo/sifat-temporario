part of openapi.api;

class ServicoFourAll {

  int? id;

  int? idEstacao;

  String? token;

  bool? notificacaoPopup;

  bool? notificacaoSom;

  bool? notificacaoImpressora;

  bool? autoConfirmacao;

  int? idFinalizadoraEmpresaPadrao;

  String? enderecoModulo;

  bool? ativo;

  ServicoFourAll();

  @override
  String toString() {
    return 'ServicoFourAll[id=$id, idEstacao=$idEstacao, token=$token, notificacaoPopup=$notificacaoPopup, notificacaoSom=$notificacaoSom, notificacaoImpressora=$notificacaoImpressora, autoConfirmacao=$autoConfirmacao, idFinalizadoraEmpresaPadrao=$idFinalizadoraEmpresaPadrao, enderecoModulo=$enderecoModulo, ativo=$ativo, ]';
  }

  ServicoFourAll.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idEstacao'] == null) {
      idEstacao = null;
    } else {
      idEstacao = json['idEstacao'];
    }
    if (json['token'] == null) {
      token = null;
    } else {
      token = json['token'];
    }
    if (json['notificacaoPopup'] == null) {
      notificacaoPopup = null;
    } else {
      notificacaoPopup = json['notificacaoPopup'];
    }
    if (json['notificacaoSom'] == null) {
      notificacaoSom = null;
    } else {
      notificacaoSom = json['notificacaoSom'];
    }
    if (json['notificacaoImpressora'] == null) {
      notificacaoImpressora = null;
    } else {
      notificacaoImpressora = json['notificacaoImpressora'];
    }
    if (json['autoConfirmacao'] == null) {
      autoConfirmacao = null;
    } else {
      autoConfirmacao = json['autoConfirmacao'];
    }
    if (json['idFinalizadoraEmpresaPadrao'] == null) {
      idFinalizadoraEmpresaPadrao = null;
    } else {
      idFinalizadoraEmpresaPadrao = json['idFinalizadoraEmpresaPadrao'];
    }
    if (json['enderecoModulo'] == null) {
      enderecoModulo = null;
    } else {
      enderecoModulo = json['enderecoModulo'];
    }
    if (json['ativo'] == null) {
      ativo = null;
    } else {
      ativo = json['ativo'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idEstacao != null)
      json['idEstacao'] = idEstacao;
    if (token != null)
      json['token'] = token;
    if (notificacaoPopup != null)
      json['notificacaoPopup'] = notificacaoPopup;
    if (notificacaoSom != null)
      json['notificacaoSom'] = notificacaoSom;
    if (notificacaoImpressora != null)
      json['notificacaoImpressora'] = notificacaoImpressora;
    if (autoConfirmacao != null)
      json['autoConfirmacao'] = autoConfirmacao;
    if (idFinalizadoraEmpresaPadrao != null)
      json['idFinalizadoraEmpresaPadrao'] = idFinalizadoraEmpresaPadrao;
    if (enderecoModulo != null)
      json['enderecoModulo'] = enderecoModulo;
    if (ativo != null)
      json['ativo'] = ativo;
    return json;
  }

  static List<ServicoFourAll> listFromJson(List<dynamic> json) {
    return json.map((value) => ServicoFourAll.fromJson(value)).toList();
  }

  static Map<String, ServicoFourAll> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ServicoFourAll>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ServicoFourAll.fromJson(value));
    }
    return map;
  }
}

