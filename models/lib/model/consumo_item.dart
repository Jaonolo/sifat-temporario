part of openapi.api;

class ConsumoItem {

  int? id;

  int? idMenu;
  //
  // ProdutoMenu? menu;

  LocalProducao? localProducao1;

  LocalProducao? localProducao2;

  int? assento;

  String? statusProducao;

  //enum statusProducaoEnum {  AGUARDANDO,  PRODUZINDO,  PRONTO,  };{

  bool? reimpressao;

  bool? confirmado;

  DateTime? dataConfirmacao;

  DateTime? dataStatus;

  int? guardaVolume;

  int? tentativasImpressao;

  ConsumoItem();

  @override
  String toString() {
    return 'ConsumoItem[id=$id, localProducao1=$localProducao1, localProducao2=$localProducao2, assento=$assento, statusProducao=$statusProducao, reimpressao=$reimpressao, confirmado=$confirmado, dataConfirmacao=$dataConfirmacao, dataStatus=$dataStatus, guardaVolume=$guardaVolume, tentativasImpressao=$tentativasImpressao, ]';
  }

  ConsumoItem.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idMenu'] == null) {
      idMenu = null;
    } else {
      idMenu = json['idMenu'];
    }
    // if (json['menu'] == null) {
    //   menu = null;
    // } else {
    //   menu = ProdutoMenu.fromJson(json['menu']);
    // }
    if (json['localProducao1'] == null) {
      localProducao1 = null;
    } else {
      localProducao1 = LocalProducao.fromJson(json['localProducao1']);
    }
    if (json['localProducao2'] == null) {
      localProducao2 = null;
    } else {
      localProducao2 = LocalProducao.fromJson(json['localProducao2']);
    }
    if (json['assento'] == null) {
      assento = null;
    } else {
      assento = json['assento'];
    }
    if (json['statusProducao'] == null) {
      statusProducao = null;
    } else {
      statusProducao = json['statusProducao'];
    }
    if (json['reimpressao'] == null) {
      reimpressao = null;
    } else {
      reimpressao = json['reimpressao'];
    }
    if (json['confirmado'] == null) {
      confirmado = null;
    } else {
      confirmado = json['confirmado'];
    }
    if (json['dataConfirmacao'] == null) {
      dataConfirmacao = null;
    } else {
      dataConfirmacao = DateTime.parse(json['dataConfirmacao']);
    }
    if (json['dataStatus'] == null) {
      dataStatus = null;
    } else {
      dataStatus = DateTime.parse(json['dataStatus']);
    }
    if (json['guardaVolume'] == null) {
      guardaVolume = null;
    } else {
      guardaVolume = json['guardaVolume'];
    }
    if (json['tentativasImpressao'] == null) {
      tentativasImpressao = null;
    } else {
      tentativasImpressao = json['tentativasImpressao'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idMenu != null)
      json['idMenu'] = idMenu;
    // else if (menu != null)
    //   json['idMenu'] = menu!.id;
    if (localProducao1 != null)
      json['localProducao1'] = localProducao1;
    if (localProducao2 != null)
      json['localProducao2'] = localProducao2;
    if (assento != null)
      json['assento'] = assento;
    if (statusProducao != null)
      json['statusProducao'] = statusProducao;
    if (reimpressao != null)
      json['reimpressao'] = reimpressao;
    if (confirmado != null)
      json['confirmado'] = confirmado;
    if (dataConfirmacao != null)
      json['dataConfirmacao'] =
      dataConfirmacao == null ? null : dataConfirmacao!.toIso8601String();
    if (dataStatus != null)
      json['dataStatus'] =
      dataStatus == null ? null : dataStatus!.toIso8601String();
    if (guardaVolume != null)
      json['guardaVolume'] = guardaVolume;
    if (tentativasImpressao != null)
      json['tentativasImpressao'] = tentativasImpressao;
    return json;
  }

  static List<ConsumoItem> listFromJson(List<dynamic> json) {
    return json.map((value) => ConsumoItem.fromJson(value)).toList();
  }

  static Map<String, ConsumoItem> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ConsumoItem>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ConsumoItem.fromJson(value));
    }
    return map;
  }
}

