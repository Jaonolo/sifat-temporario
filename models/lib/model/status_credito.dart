part of openapi.api;

class StatusCredito {

  int? id;

  int? idEmpresa;

  String? descricao;

  String? mensagemPDV;

  String? acaoStatusCredito;

  //enum acaoStatusCreditoEnum {  VENDER,  NAO_VENDER,  VENDER_COM_AUTORIZACAO,  };{

  int? versao;

  StatusCredito();

  @override
  String toString() {
    return 'StatusCredito[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, mensagemPDV=$mensagemPDV, acaoStatusCredito=$acaoStatusCredito, versao=$versao, ]';
  }

  StatusCredito.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idEmpresa'] == null) {
      idEmpresa = null;
    } else {
      idEmpresa = json['idEmpresa'];
    }
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
    if (json['mensagemPDV'] == null) {
      mensagemPDV = null;
    } else {
      mensagemPDV = json['mensagemPDV'];
    }
    if (json['acaoStatusCredito'] == null) {
      acaoStatusCredito = null;
    } else {
      acaoStatusCredito = json['acaoStatusCredito'];
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
    if (idEmpresa != null)
      json['idEmpresa'] = idEmpresa;
    if (descricao != null)
      json['descricao'] = descricao;
    if (mensagemPDV != null)
      json['mensagemPDV'] = mensagemPDV;
    if (acaoStatusCredito != null)
      json['acaoStatusCredito'] = acaoStatusCredito;
    if (versao != null)
      json['versao'] = versao;
    return json;
  }

  static List<StatusCredito> listFromJson(List<dynamic> json) {
    return json.map((value) => StatusCredito.fromJson(value)).toList();
  }

  static Map<String, StatusCredito> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, StatusCredito>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = StatusCredito.fromJson(value));
    }
    return map;
  }
}

