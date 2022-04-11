part of openapi.api;

class ControleCadastro {

  int? idEmpresaCadastro;

  int? idUsuarioCadastro;

  DateTime? dataCadastro;

  DateTime? dataAlteracao;

  DateTime? dataInatividade;

  bool? ativo;

  ControleCadastro();

  @override
  String toString() {
    return 'ControleCadastro[idEmpresaCadastro=$idEmpresaCadastro, idUsuarioCadastro=$idUsuarioCadastro, dataCadastro=$dataCadastro, dataAlteracao=$dataAlteracao, dataInatividade=$dataInatividade, ativo=$ativo, ]';
  }

  ControleCadastro.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['idEmpresaCadastro'] == null) {
      idEmpresaCadastro = null;
    } else {
      idEmpresaCadastro = json['idEmpresaCadastro'];
    }
    if (json['idUsuarioCadastro'] == null) {
      idUsuarioCadastro = null;
    } else {
      idUsuarioCadastro = json['idUsuarioCadastro'];
    }
    if (json['dataCadastro'] == null) {
      dataCadastro = null;
    } else {
      dataCadastro = DateTime.parse(json['dataCadastro']);
    }
    if (json['dataAlteracao'] == null) {
      dataAlteracao = null;
    } else {
      dataAlteracao = DateTime.parse(json['dataAlteracao']);
    }
    if (json['dataInatividade'] == null) {
      dataInatividade = null;
    } else {
      dataInatividade = DateTime.parse(json['dataInatividade']);
    }
    if (json['ativo'] == null) {
      ativo = null;
    } else {
      ativo = json['ativo'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (idEmpresaCadastro != null)
      json['idEmpresaCadastro'] = idEmpresaCadastro;
    if (idUsuarioCadastro != null)
      json['idUsuarioCadastro'] = idUsuarioCadastro;
    if (dataCadastro != null)
      json['dataCadastro'] =
      dataCadastro == null ? null : dataCadastro!.toIso8601String();
    if (dataAlteracao != null)
      json['dataAlteracao'] =
      dataAlteracao == null ? null : dataAlteracao!.toIso8601String();
    if (dataInatividade != null)
      json['dataInatividade'] =
      dataInatividade == null ? null : dataInatividade!.toIso8601String();
    if (ativo != null)
      json['ativo'] = ativo;
    return json;
  }

  static List<ControleCadastro> listFromJson(List<dynamic> json) {
    return json.map((value) => ControleCadastro.fromJson(value)).toList();
  }

  static Map<String, ControleCadastro> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ControleCadastro>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ControleCadastro.fromJson(value));
    }
    return map;
  }
}

