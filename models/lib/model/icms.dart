part of openapi.api;

@JsonSerializable()
class Icms {

  int? id;

  String? ufOrigem;

  String? ufDestino;

  String? codigoNCM;

  Ncm? ncm;

  CstIcms? cstIcms;

  CsosnIcms? csosnIcms;

  BigDecimal? aliquotaIcms = BigDecimal.ZERO();

  BigDecimal? percentualBaseCalculo = BigDecimal.ZERO();

  BigDecimal? aliquotaIcmsFinal = BigDecimal.ZERO();

  int? idEmpresa;

  String? tipoContribuinte;

  //enum tipoContribuinteEnum {  CONSUMIDOR_FINAL,  CONTRIBUINTE_ICMS,  };{
  Icms();

  @override
  String toString() {
    return 'Icms[id=$id, ufOrigem=$ufOrigem, ufDestino=$ufDestino, codigoNCM=$codigoNCM, ncm=$ncm, cstIcms=$cstIcms, csosnIcms=$csosnIcms, aliquotaIcms=$aliquotaIcms, percentualBaseCalculo=$percentualBaseCalculo, aliquotaIcmsFinal=$aliquotaIcmsFinal, idEmpresa=$idEmpresa, tipoContribuinte=$tipoContribuinte, ]';
  }

  factory Icms.fromJson(Map<String, dynamic> json) => _$IcmsFromJson(json);

  Map<String, dynamic> toJson() => _$IcmsToJson(this);

  static List<Icms> listFromJson(List<dynamic> json) {
    return json.map((value) => Icms.fromJson(value)).toList();
  }

  static Map<String, Icms> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Icms>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Icms.fromJson(value));
    }
    return map;
  }
}

