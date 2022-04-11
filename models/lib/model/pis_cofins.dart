part of openapi.api;

@JsonSerializable()
class PisCofins {

  int? id;

  String? codigoNCM;

  Ncm? ncm;

  CstPisCofins? cstPis;

  CstPisCofins? cstCofins;

  String? tipoOperacao;

  //enum tipoOperacaoEnum {  ENTRADA,  SAIDA,  };{

  BigDecimal? aliquotaPis = BigDecimal.ZERO();

  BigDecimal? baseCalculoPis = BigDecimal.ZERO();

  BigDecimal? aliquotaCofins = BigDecimal.ZERO();

  BigDecimal? baseCalculoCofins = BigDecimal.ZERO();

  int? idEmpresa;

  PisCofins();

  @override
  String toString() {
    return 'PisCofins[id=$id, codigoNCM=$codigoNCM, ncm=$ncm, cstPis=$cstPis, cstCofins=$cstCofins, tipoOperacao=$tipoOperacao, aliquotaPis=$aliquotaPis, baseCalculoPis=$baseCalculoPis, aliquotaCofins=$aliquotaCofins, baseCalculoCofins=$baseCalculoCofins, idEmpresa=$idEmpresa, ]';
  }

  factory PisCofins.fromJson(Map<String, dynamic> json) =>
      _$PisCofinsFromJson(json);

  Map<String, dynamic> toJson() => _$PisCofinsToJson(this);

  static List<PisCofins> listFromJson(List<dynamic> json) {
    return json.map((value) => PisCofins.fromJson(value)).toList();
  }

  static Map<String, PisCofins> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, PisCofins>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = PisCofins.fromJson(value));
    }
    return map;
  }
}

