part of openapi.api;

class MapaComandaDTO {

  int? numeroComanda;

  String? statusVenda;

  //enum statusVendaEnum {  ABERTA,  FECHADA,  JUNTADA,  RECEBIDA,  CANCELADA,  };{

  String? observacao;

  DateTime? dataAtualizacao;

  Cliente? cliente;

  int? idNota;

  String? tipoModulo;

  //enum tipoModuloEnum {  GERAL,  MESA,  FICHA,  DELIVERY,  CARTAO,  BALCAO,  DRIVE_THRU,  };{
  MapaComandaDTO();

  @override
  String toString() {
    return 'MapaComandaDTO[numeroComanda=$numeroComanda, statusVenda=$statusVenda, observacao=$observacao, dataAtualizacao=$dataAtualizacao, cliente=$cliente, idNota=$idNota, tipoModulo=$tipoModulo, ]';
  }

  MapaComandaDTO.fromJson(Map<String, dynamic> json) {
    if (json['numeroComanda'] == null) {
      numeroComanda = null;
    } else {
      numeroComanda = json['numeroComanda'];
    }
    if (json['statusVenda'] == null) {
      statusVenda = null;
    } else {
      statusVenda = json['statusVenda'];
    }
    if (json['observacao'] == null) {
      observacao = null;
    } else {
      observacao = json['observacao'];
    }
    if (json['dataAtualizacao'] == null) {
      dataAtualizacao = null;
    } else {
      dataAtualizacao = DateTime.parse(json['dataAtualizacao']);
    }
    if (json['cliente'] == null) {
      cliente = null;
    } else {
      cliente = Cliente.fromJson(json['cliente']);
    }
    if (json['idNota'] == null) {
      idNota = null;
    } else {
      idNota = json['idNota'];
    }
    if (json['tipoModulo'] == null) {
      tipoModulo = null;
    } else {
      tipoModulo = json['tipoModulo'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (numeroComanda != null)
      json['numeroComanda'] = numeroComanda;
    if (statusVenda != null)
      json['statusVenda'] = statusVenda;
    if (observacao != null)
      json['observacao'] = observacao;
    if (dataAtualizacao != null)
      json['dataAtualizacao'] =
      dataAtualizacao == null ? null : dataAtualizacao!.toIso8601String();
    if (cliente != null)
      json['cliente'] = cliente;
    if (idNota != null)
      json['idNota'] = idNota;
    if (tipoModulo != null)
      json['tipoModulo'] = tipoModulo;
    return json;
  }

  static List<MapaComandaDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => MapaComandaDTO.fromJson(value)).toList();
  }

  static Map<String, MapaComandaDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, MapaComandaDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = MapaComandaDTO.fromJson(value));
    }
    return map;
  }
}

