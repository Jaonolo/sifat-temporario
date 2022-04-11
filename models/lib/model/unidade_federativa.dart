part of openapi.api;

@JsonSerializable()
class UnidadeFederativa {
  String? uf;

  int? codigo;

  String? nome;

  BigDecimal? aliquotaIcmsFcp;

  int? percentualPartilhaIcms;

  bool? pafEcf;

  Pais? pais;

  UnidadeFederativa();

  @override
  String toString() {
    return 'UnidadeFederativa[uf=$uf, codigo=$codigo, nome=$nome, aliquotaIcmsFcp=$aliquotaIcmsFcp, percentualPartilhaIcms=$percentualPartilhaIcms, pafEcf=$pafEcf, pais=$pais, ]';
  }

  factory UnidadeFederativa.fromJson(Map<String, dynamic> json) =>
      _$UnidadeFederativaFromJson(json);

  Map<String, dynamic> toJson() => _$UnidadeFederativaToJson(this);

  static List<UnidadeFederativa> listFromJson(List<dynamic> json) {
    return json.map((value) => UnidadeFederativa.fromJson(value)).toList();
  }

  static Map<String, UnidadeFederativa> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, UnidadeFederativa>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = UnidadeFederativa.fromJson(value));
    }
    return map;
  }
}
