part of openapi.api;

class ServicoImpressao {

  int? id;

  int? idEstacao;

  String? token;

  int? tentativasImpressao;

  int? autoConfirmacao;

  int? intervaloExecucao;

  String? ordenacao;

  //enum ordenacaoEnum {  ALFABETICA,  ITEM,  };{

  bool? exibeNomeDelivery;

  bool? exibeTotalItens;

  bool? ticketIndividualizado;

  bool? acionaGuilhotina;

  bool? agrupaQuantidadeDescricao;

  bool? ativo;

  ServicoImpressao();

  @override
  String toString() {
    return 'ServicoImpressao[id=$id, idEstacao=$idEstacao, token=$token, tentativasImpressao=$tentativasImpressao, autoConfirmacao=$autoConfirmacao, intervaloExecucao=$intervaloExecucao, ordenacao=$ordenacao, exibeNomeDelivery=$exibeNomeDelivery, exibeTotalItens=$exibeTotalItens, ticketIndividualizado=$ticketIndividualizado, acionaGuilhotina=$acionaGuilhotina, agrupaQuantidadeDescricao=$agrupaQuantidadeDescricao, ativo=$ativo, ]';
  }

  ServicoImpressao.fromJson(Map<String, dynamic>? json) {
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
    if (json['tentativasImpressao'] == null) {
      tentativasImpressao = null;
    } else {
      tentativasImpressao = json['tentativasImpressao'];
    }
    if (json['autoConfirmacao'] == null) {
      autoConfirmacao = null;
    } else {
      autoConfirmacao = json['autoConfirmacao'];
    }
    if (json['intervaloExecucao'] == null) {
      intervaloExecucao = null;
    } else {
      intervaloExecucao = json['intervaloExecucao'];
    }
    if (json['ordenacao'] == null) {
      ordenacao = null;
    } else {
      ordenacao = json['ordenacao'];
    }
    if (json['exibeNomeDelivery'] == null) {
      exibeNomeDelivery = null;
    } else {
      exibeNomeDelivery = json['exibeNomeDelivery'];
    }
    if (json['exibeTotalItens'] == null) {
      exibeTotalItens = null;
    } else {
      exibeTotalItens = json['exibeTotalItens'];
    }
    if (json['ticketIndividualizado'] == null) {
      ticketIndividualizado = null;
    } else {
      ticketIndividualizado = json['ticketIndividualizado'];
    }
    if (json['acionaGuilhotina'] == null) {
      acionaGuilhotina = null;
    } else {
      acionaGuilhotina = json['acionaGuilhotina'];
    }
    if (json['agrupaQuantidadeDescricao'] == null) {
      agrupaQuantidadeDescricao = null;
    } else {
      agrupaQuantidadeDescricao = json['agrupaQuantidadeDescricao'];
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
    if (tentativasImpressao != null)
      json['tentativasImpressao'] = tentativasImpressao;
    if (autoConfirmacao != null)
      json['autoConfirmacao'] = autoConfirmacao;
    if (intervaloExecucao != null)
      json['intervaloExecucao'] = intervaloExecucao;
    if (ordenacao != null)
      json['ordenacao'] = ordenacao;
    if (exibeNomeDelivery != null)
      json['exibeNomeDelivery'] = exibeNomeDelivery;
    if (exibeTotalItens != null)
      json['exibeTotalItens'] = exibeTotalItens;
    if (ticketIndividualizado != null)
      json['ticketIndividualizado'] = ticketIndividualizado;
    if (acionaGuilhotina != null)
      json['acionaGuilhotina'] = acionaGuilhotina;
    if (agrupaQuantidadeDescricao != null)
      json['agrupaQuantidadeDescricao'] = agrupaQuantidadeDescricao;
    if (ativo != null)
      json['ativo'] = ativo;
    return json;
  }

  static List<ServicoImpressao> listFromJson(List<dynamic> json) {
    return json.map((value) => ServicoImpressao.fromJson(value)).toList();
  }

  static Map<String, ServicoImpressao> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ServicoImpressao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ServicoImpressao.fromJson(value));
    }
    return map;
  }
}

