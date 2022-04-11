part of openapi.api;

class InlineObject {

  String? clientKey;

  String? clientSecret;

  String? versao;

  String? username;

  String? password;

  String? nomeEstacao;

  String? pin;

  InlineObject();

  @override
  String toString() {
    return 'InlineObject[clientKey=$clientKey, clientSecret=$clientSecret, versao=$versao, username=$username, password=$password, nomeEstacao=$nomeEstacao, pin=$pin, ]';
  }

  InlineObject.fromJson(Map<String, dynamic> json) {
    if (json['clientKey'] == null) {
      clientKey = null;
    } else {
      clientKey = json['clientKey'];
    }
    if (json['clientSecret'] == null) {
      clientSecret = null;
    } else {
      clientSecret = json['clientSecret'];
    }
    if (json['versao'] == null) {
      versao = null;
    } else {
      versao = json['versao'];
    }
    if (json['username'] == null) {
      username = null;
    } else {
      username = json['username'];
    }
    if (json['password'] == null) {
      password = null;
    } else {
      password = json['password'];
    }
    if (json['nomeEstacao'] == null) {
      nomeEstacao = null;
    } else {
      nomeEstacao = json['nomeEstacao'];
    }
    if (json['pin'] == null) {
      pin = null;
    } else {
      pin = json['pin'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (clientKey != null)
      json['clientKey'] = clientKey;
    if (clientSecret != null)
      json['clientSecret'] = clientSecret;
    if (versao != null)
      json['versao'] = versao;
    if (username != null)
      json['username'] = username;
    if (password != null)
      json['password'] = password;
    if (nomeEstacao != null)
      json['nomeEstacao'] = nomeEstacao;
    if (pin != null)
      json['pin'] = pin;
    return json;
  }

  static List<InlineObject> listFromJson(List<dynamic> json) {
    return json.map((value) => InlineObject.fromJson(value)).toList();
  }

  static Map<String, InlineObject> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, InlineObject>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = InlineObject.fromJson(value));
    }
    return map;
  }
}

