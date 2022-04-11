part of openapi.api;

@JsonSerializable()
class Regiao {
  int? id;

  int? idEmpresa;

  String? descricao;

  String? pontoReferencia;

  BigDecimal? valor = BigDecimal.ZERO();

  int? itinerario;

  int? prazoEntregaDias;

  String? tipoValor;

  //enum tipoValorEnum {  REAL,  PERCENTUAL,  };{

  Cidade? cidade;

  List<RegiaoEmpresa>? regioesEmpresa;

  int? versao;

  Regiao();

  @override
  String toString() {
    return 'Regiao[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, pontoReferencia=$pontoReferencia, valor=$valor, itinerario=$itinerario, prazoEntregaDias=$prazoEntregaDias, tipoValor=$tipoValor, cidade=$cidade, regioesEmpresa=$regioesEmpresa, versao=$versao, ]';
  }

  factory Regiao.fromJson(Map<String, dynamic> json) => _$RegiaoFromJson(json);

  Map<String, dynamic> toJson() => _$RegiaoToJson(this);

  static List<Regiao> listFromJson(List<dynamic> json) {
    return json.map((value) => Regiao.fromJson(value)).toList();
  }

  static Map<String, Regiao> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Regiao>();
    if (json.isNotEmpty) {
      json.forEach(
              (String key, dynamic value) => map[key] = Regiao.fromJson(value));
    }
    return map;
  }

  BigDecimal? getValor(int idEmpresa) {
    BigDecimal? valor;
    for (RegiaoEmpresa re in regioesEmpresa!) {
      if (re.idEmpresa == idEmpresa) valor = re.valor;
    }
    return valor;
  }
}
