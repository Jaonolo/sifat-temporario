part of openapi.api;

@JsonSerializable()
class NotaFiscal {

  int? id;

  String? chave;

  String? chaveCancelamento;

  String? protocolo;

  String? modeloFiscal;

  //enum modeloFiscalEnum {  NENHUM,  NFE,  CFE,  NFCE,  };{

  int? numeroSerie;

  int? numeroCfe;

  int? codigoUf;

  DateTime? dataEmissao;

  int? idEmissorFiscal;

  String? qrCode;

  NotaXml? notaXml;

  ContingenciaFiscal? contingenciaFiscal;

  String? erroEmissao;

  int? idNotaXml;

  NotaFiscal();

  @override
  String toString() {
    return 'NotaFiscal[id=$id, chave=$chave, chaveCancelamento=$chaveCancelamento, protocolo=$protocolo, modeloFiscal=$modeloFiscal, numeroSerie=$numeroSerie, numeroCfe=$numeroCfe, codigoUf=$codigoUf, dataEmissao=$dataEmissao, idEmissorFiscal=$idEmissorFiscal, qrCode=$qrCode, notaXml= $notaXml contingenciaFiscal=$contingenciaFiscal, idNotaXml=$idNotaXml, ]';
  }


  factory NotaFiscal.fromJson(Map<String, dynamic> json) =>
      _$NotaFiscalFromJson(json);

  Map<String, dynamic> toJson() => _$NotaFiscalToJson(this);

  static List<NotaFiscal> listFromJson(List<dynamic> json) {
    return json.map((value) => NotaFiscal.fromJson(value)).toList();
  }

  static Map<String, NotaFiscal> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, NotaFiscal>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = NotaFiscal.fromJson(value));
    }
    return map;
  }
}

