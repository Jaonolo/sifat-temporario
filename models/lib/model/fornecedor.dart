part of openapi.api;

class Fornecedor {

  int? idPessoa;

  Pessoa? pessoa;

  bool? mensagemEletronica;

  String? tipo;

  //enum tipoEnum {  Comum,  Transportador,  Escritório contábil,  };{

  Classificacao? classificacao;

  String? observacao;

  String? historico;

  int? versao;

  FornecedorVinculo? vinculo;

  ControleCadastro? controleCadastro;

  Fornecedor();

  @override
  String toString() {
    return 'Fornecedor[idPessoa=$idPessoa, pessoa=$pessoa, mensagemEletronica=$mensagemEletronica, tipo=$tipo, classificacao=$classificacao, observacao=$observacao, historico=$historico, versao=$versao, vinculo=$vinculo, controleCadastro=$controleCadastro, ]';
  }

  Fornecedor.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['idPessoa'] == null) {
      idPessoa = null;
    } else {
      idPessoa = json['idPessoa'];
    }
    if (json['pessoa'] == null) {
      pessoa = null;
    } else {
      pessoa = Pessoa.fromJson(json['pessoa']);
    }
    if (json['mensagemEletronica'] == null) {
      mensagemEletronica = null;
    } else {
      mensagemEletronica = json['mensagemEletronica'];
    }
    if (json['tipo'] == null) {
      tipo = null;
    } else {
      tipo = json['tipo'];
    }
    if (json['classificacao'] == null) {
      classificacao = null;
    } else {
      classificacao = Classificacao.fromJson(json['classificacao']);
    }
    if (json['observacao'] == null) {
      observacao = null;
    } else {
      observacao = json['observacao'];
    }
    if (json['historico'] == null) {
      historico = null;
    } else {
      historico = json['historico'];
    }
    if (json['versao'] == null) {
      versao = null;
    } else {
      versao = json['versao'];
    }
    if (json['vinculo'] == null) {
      vinculo = null;
    } else {
      vinculo = FornecedorVinculo.fromJson(json['vinculo']);
    }
    if (json['controleCadastro'] == null) {
      controleCadastro = null;
    } else {
      controleCadastro = ControleCadastro.fromJson(json['controleCadastro']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (idPessoa != null)
      json['idPessoa'] = idPessoa;
    if (pessoa != null)
      json['pessoa'] = pessoa;
    if (mensagemEletronica != null)
      json['mensagemEletronica'] = mensagemEletronica;
    if (tipo != null)
      json['tipo'] = tipo;
    if (classificacao != null)
      json['classificacao'] = classificacao;
    if (observacao != null)
      json['observacao'] = observacao;
    if (historico != null)
      json['historico'] = historico;
    if (versao != null)
      json['versao'] = versao;
    if (vinculo != null)
      json['vinculo'] = vinculo;
    if (controleCadastro != null)
      json['controleCadastro'] = controleCadastro;
    return json;
  }

  static List<Fornecedor> listFromJson(List<dynamic> json) {
    return json.map((value) => Fornecedor.fromJson(value)).toList();
  }

  static Map<String, Fornecedor> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Fornecedor>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Fornecedor.fromJson(value));
    }
    return map;
  }
}

