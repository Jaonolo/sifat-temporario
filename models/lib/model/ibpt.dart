part of openapi.api;

@JsonSerializable()
class Ibpt {

  int? id;

  String? uf;

  String? codigo;

  int? ex;

  int? tipo;

  String? descricao;

  BigDecimal? nacionalFederal = BigDecimal.ZERO();

  BigDecimal? importadosFederal = BigDecimal.ZERO();

  BigDecimal? estadual = BigDecimal.ZERO();

  BigDecimal? municipal = BigDecimal.ZERO();

  DateTime? vigenciaInicio;

  DateTime? vigenciaFim;

  Ibpt();

  @override
  String toString() {
    return 'Ibpt[id=$id, uf=$uf, codigo=$codigo, ex=$ex, tipo=$tipo, descricao=$descricao, nacionalFederal=$nacionalFederal, importadosFederal=$importadosFederal, estadual=$estadual, municipal=$municipal, vigenciaInicio=$vigenciaInicio, vigenciaFim=$vigenciaFim, ]';
  }

  factory Ibpt.fromJson(Map<String, dynamic> json) => _$IbptFromJson(json);

  Map<String, dynamic> toJson() => _$IbptToJson(this);

  static List<Ibpt> listFromJson(List<dynamic> json) {
    return json.map((value) => Ibpt.fromJson(value)).toList();
  }

  static Map<String, Ibpt> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Ibpt>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Ibpt.fromJson(value));
    }
    return map;
  }
}

