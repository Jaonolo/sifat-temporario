part of openapi.api;

@JsonSerializable()
class NotaItemFiscal {

  int? id;

  String? ncm;

  String? cest;

  String? csosnIcms;

  String? cstIcms;

  String? cstPis;

  String? cstCofins;

  BigDecimal? aliquotaIcms = BigDecimal.ZERO();

  BigDecimal? aliquotaIcmsEfetiva = BigDecimal.ZERO();

  BigDecimal? aliquotaPis = BigDecimal.ZERO();

  BigDecimal? aliquotaCofins = BigDecimal.ZERO();

  BigDecimal? percReducaoBcIcms = BigDecimal.ZERO();

  BigDecimal? valorBcIcms = BigDecimal.ZERO();

  BigDecimal? valorBcPis = BigDecimal.ZERO();

  BigDecimal? valorBcCofins = BigDecimal.ZERO();

  BigDecimal? valorIcms = BigDecimal.ZERO();

  BigDecimal? valorPis = BigDecimal.ZERO();

  BigDecimal? valorCofins = BigDecimal.ZERO();

  String? origemMercadoria;

  String? cfop;

  BigDecimal? impostoFederal = BigDecimal.ZERO();

  BigDecimal? impostoEstadual = BigDecimal.ZERO();

  BigDecimal? impostoMunicipal = BigDecimal.ZERO();

  NotaItemFiscal();

  @override
  String toString() {
    return 'NotaItemFiscal[id=$id, ncm=$ncm, cest=$cest, csosnIcms=$csosnIcms, cstIcms=$cstIcms, cstPis=$cstPis, cstCofins=$cstCofins, aliquotaIcms=$aliquotaIcms, aliquotaIcmsEfetiva=$aliquotaIcmsEfetiva, aliquotaPis=$aliquotaPis, aliquotaCofins=$aliquotaCofins, percReducaoBcIcms=$percReducaoBcIcms, valorBcIcms=$valorBcIcms, valorBcPis=$valorBcPis, valorBcCofins=$valorBcCofins, valorIcms=$valorIcms, valorPis=$valorPis, valorCofins=$valorCofins, origemMercadoria=$origemMercadoria, cfop=$cfop, impostoFederal=$impostoFederal, impostoEstadual=$impostoEstadual, impostoMunicipal=$impostoMunicipal, ]';
  }

  factory NotaItemFiscal.fromJson(Map<String, dynamic> json) =>
      _$NotaItemFiscalFromJson(json);

  Map<String, dynamic> toJson() => _$NotaItemFiscalToJson(this);

  static List<NotaItemFiscal> listFromJson(List<dynamic> json) {
    return json.map((value) => NotaItemFiscal.fromJson(value)).toList();
  }

  static Map<String, NotaItemFiscal> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, NotaItemFiscal>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = NotaItemFiscal.fromJson(value));
    }
    return map;
  }
}

