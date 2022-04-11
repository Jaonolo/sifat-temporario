part of openapi.api;

@JsonSerializable()
class EspecieTitulo {

  int? id;

  int? idEmpresa;

  String? descricao;

  String? tipo;

  //enum tipoEnum {  BOLETO,  CREDIARIO,  DUPLICATA,  NOTA_PROMISSORIA,  RECIBO,  CARTAO,  };{

  BigDecimal? taxaJuros = BigDecimal.ZERO();

  BigDecimal? taxaMulta = BigDecimal.ZERO();

  BigDecimal? taxaEmissaoTitulo = BigDecimal.ZERO();

  int? diasTolerancia;

  BigDecimal? descontoPgtoAntecipado = BigDecimal.ZERO();

  int? diasPgtoAntecipado;

  int? versao;

  EspecieTitulo();

  @override
  String toString() {
    return 'EspecieTitulo[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, tipo=$tipo, taxaJuros=$taxaJuros, taxaMulta=$taxaMulta, taxaEmissaoTitulo=$taxaEmissaoTitulo, diasTolerancia=$diasTolerancia, descontoPgtoAntecipado=$descontoPgtoAntecipado, diasPgtoAntecipado=$diasPgtoAntecipado, versao=$versao, ]';
  }

  factory EspecieTitulo.fromJson(Map<String, dynamic> json) =>
      _$EspecieTituloFromJson(json);

  Map<String, dynamic> toJson() => _$EspecieTituloToJson(this);

  static List<EspecieTitulo> listFromJson(List<dynamic> json) {
    return json.map((value) => EspecieTitulo.fromJson(value)).toList();
  }

  static Map<String, EspecieTitulo> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EspecieTitulo>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EspecieTitulo.fromJson(value));
    }
    return map;
  }
}

