part of openapi.api;

class EstacaoTrabalhoDTO {
  int? colunasCardapio;

  String? tipoEmissorFiscal;

  //enum tipoEmissorFiscalEnum {  Nenhum,  SAT,  NFC-e,  Concentrador Sifat,  };{

  int? idEmissorFiscal;

  EquipamentoImpressao? impressoraGeral;

  EstacaoBalanca? estacaoBalanca;

  EstacaoLeitor? estacaoLeitor;

  EstacaoTrabalhoDTO();

  @override
  String toString() {
    return 'EstacaoTrabalhoDTO[colunasCardapio=$colunasCardapio, tipoEmissorFiscal=$tipoEmissorFiscal, idEmissorFiscal=$idEmissorFiscal, estacaoBalanca=$estacaoBalanca, estacaoLeitor=$estacaoLeitor, ]';
  }

  EstacaoTrabalhoDTO.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['colunasCardapio'] == null) {
      colunasCardapio = null;
    } else {
      colunasCardapio = json['colunasCardapio'];
    }
    if (json['tipoEmissorFiscal'] == null) {
      tipoEmissorFiscal = null;
    } else {
      tipoEmissorFiscal = json['tipoEmissorFiscal'];
    }
    if (json['idEmissorFiscal'] == null) {
      idEmissorFiscal = null;
    } else {
      idEmissorFiscal = json['idEmissorFiscal'];
    }
    if (json['estacaoBalanca'] == null) {
      estacaoBalanca = null;
    } else {
      estacaoBalanca = EstacaoBalanca.fromJson(json['estacaoBalanca']);
    }
    if (json['impressoraGeral'] == null) {
      impressoraGeral = null;
    } else {
      impressoraGeral = EquipamentoImpressao.fromJson(json['impressoraGeral']);
    }
    if (json['estacaoLeitor'] == null) {
      estacaoLeitor = null;
    } else {
      estacaoLeitor = EstacaoLeitor.fromJson(json['estacaoLeitor']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (colunasCardapio != null)
      json['colunasCardapio'] = colunasCardapio;
    if (tipoEmissorFiscal != null)
      json['tipoEmissorFiscal'] = tipoEmissorFiscal;
    if (idEmissorFiscal != null)
      json['idEmissorFiscal'] = idEmissorFiscal;
    if (impressoraGeral != null)
      json['impressoraGeral'] = impressoraGeral;
    if (estacaoBalanca != null)
      json['estacaoBalanca'] = estacaoBalanca;
    if (estacaoLeitor != null)
      json['estacaoLeitor'] = estacaoLeitor;
    return json;
  }

  static List<EstacaoTrabalhoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => EstacaoTrabalhoDTO.fromJson(value)).toList();
  }

  static Map<String, EstacaoTrabalhoDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, EstacaoTrabalhoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EstacaoTrabalhoDTO.fromJson(value));
    }
    return map;
  }
}

