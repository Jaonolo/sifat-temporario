part of openapi.api;

class EnderecoEstoque {

  int? id;

  int? idSetor;

  String? endereco;

  String? descricao;

  bool? ativo;

  bool? padrao;

  int? versao;

  EnderecoEstoque();

  @override
  String toString() {
    return 'EnderecoEstoque[id=$id, idSetor=$idSetor, endereco=$endereco, descricao=$descricao, ativo=$ativo, padrao=$padrao, versao=$versao, ]';
  }

  EnderecoEstoque.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idSetor'] == null) {
      idSetor = null;
    } else {
      idSetor = json['idSetor'];
    }
    if (json['endereco'] == null) {
      endereco = null;
    } else {
      endereco = json['endereco'];
    }
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
    if (json['ativo'] == null) {
      ativo = null;
    } else {
      ativo = json['ativo'];
    }
    if (json['padrao'] == null) {
      padrao = null;
    } else {
      padrao = json['padrao'];
    }
    if (json['versao'] == null) {
      versao = null;
    } else {
      versao = json['versao'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idSetor != null)
      json['idSetor'] = idSetor;
    if (endereco != null)
      json['endereco'] = endereco;
    if (descricao != null)
      json['descricao'] = descricao;
    if (ativo != null)
      json['ativo'] = ativo;
    if (padrao != null)
      json['padrao'] = padrao;
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<EnderecoEstoque> listFromJson(List<dynamic> json) {
    return json.map((value) => EnderecoEstoque.fromJson(value)).toList();
  }

  static Map<String, EnderecoEstoque> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EnderecoEstoque>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EnderecoEstoque.fromJson(value));
    }
    return map;
  }
}

