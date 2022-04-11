part of openapi.api;

class RetornoToken {

  bool? erro;

  String? mensagem;

  RetornoToken();

  @override
  String toString() {
    return 'RetornoToken[erro=$erro, mensagem=$mensagem, ]';
  }

  RetornoToken.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['Erro'] == null) {
      erro = null;
    } else {
      erro = json['Erro'];
    }
    if (json['Mensagem'] == null) {
      mensagem = null;
    } else {
      mensagem = json['Mensagem'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (erro != null)
      json['Erro'] = erro;
    if (mensagem != null)
      json['Mensagem'] = mensagem;
    return json;
  }

  static List<RetornoToken> listFromJson(List<dynamic> json) {
    return json.map((value) => RetornoToken.fromJson(value)).toList();
  }

  static Map<String, RetornoToken> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, RetornoToken>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = RetornoToken.fromJson(value));
    }
    return map;
  }
}

