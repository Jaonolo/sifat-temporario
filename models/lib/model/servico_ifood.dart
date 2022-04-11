part of openapi.api;

class ServicoIfood {

  int? id;

  int? idEstacao;

  String? token;

  DateTime? dataAtivacao;

  bool? notificacaoPopup;

  bool? notificacaoSom;

  bool? notificacaoImpressora;

  bool? autoConfirmacao;

  int? merchantID;

  String? usuario;

  String? senha;

  int? idFinalizadoraEmpresaPadrao;

  String? clientID;

  String? clientSecret;

  bool? ativo;

  ServicoIfood();

  @override
  String toString() {
    return 'ServicoIfood[id=$id, idEstacao=$idEstacao, token=$token, dataAtivacao=$dataAtivacao, notificacaoPopup=$notificacaoPopup, notificacaoSom=$notificacaoSom, notificacaoImpressora=$notificacaoImpressora, autoConfirmacao=$autoConfirmacao, merchantID=$merchantID, usuario=$usuario, senha=$senha, idFinalizadoraEmpresaPadrao=$idFinalizadoraEmpresaPadrao, clientID=$clientID, clientSecret=$clientSecret, ativo=$ativo, ]';
  }

  ServicoIfood.fromJson(Map<String, dynamic>? json) {
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
    if (json['dataAtivacao'] == null) {
      dataAtivacao = null;
    } else {
      dataAtivacao = DateTime.parse(json['dataAtivacao']);
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
    if (json['merchantID'] == null) {
      merchantID = null;
    } else {
      merchantID = json['merchantID'];
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
    if (json['idFinalizadoraEmpresaPadrao'] == null) {
      idFinalizadoraEmpresaPadrao = null;
    } else {
      idFinalizadoraEmpresaPadrao = json['idFinalizadoraEmpresaPadrao'];
    }
    if (json['clientID'] == null) {
      clientID = null;
    } else {
      clientID = json['clientID'];
    }
    if (json['clientSecret'] == null) {
      clientSecret = null;
    } else {
      clientSecret = json['clientSecret'];
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
    if (dataAtivacao != null)
      json['dataAtivacao'] =
      dataAtivacao == null ? null : dataAtivacao!.toIso8601String();
    if (notificacaoPopup != null)
      json['notificacaoPopup'] = notificacaoPopup;
    if (notificacaoSom != null)
      json['notificacaoSom'] = notificacaoSom;
    if (notificacaoImpressora != null)
      json['notificacaoImpressora'] = notificacaoImpressora;
    if (autoConfirmacao != null)
      json['autoConfirmacao'] = autoConfirmacao;
    if (merchantID != null)
      json['merchantID'] = merchantID;
    if (usuario != null)
      json['usuario'] = usuario;
    if (senha != null)
      json['senha'] = senha;
    if (idFinalizadoraEmpresaPadrao != null)
      json['idFinalizadoraEmpresaPadrao'] = idFinalizadoraEmpresaPadrao;
    if (clientID != null)
      json['clientID'] = clientID;
    if (clientSecret != null)
      json['clientSecret'] = clientSecret;
    if (ativo != null)
      json['ativo'] = ativo;
    return json;
  }

  static List<ServicoIfood> listFromJson(List<dynamic> json) {
    return json.map((value) => ServicoIfood.fromJson(value)).toList();
  }

  static Map<String, ServicoIfood> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ServicoIfood>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ServicoIfood.fromJson(value));
    }
    return map;
  }
}

