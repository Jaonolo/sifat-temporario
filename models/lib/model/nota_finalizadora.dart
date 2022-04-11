part of openapi.api;

@JsonSerializable()
class NotaFinalizadora {
  int? id;

  int? idNota;

  int? idFinalizadora;

  FinalizadoraEmpresa? _finalizadoraEmpresa;

  BigDecimal? valor = BigDecimal.ZERO();

  BigDecimal? troco = BigDecimal.ZERO();

  TransacaoCartao? transacaoCartao;

  bool? cancelada = false;

  bool? lancamentoManual = false;

  bool? alteracaoManual = false;

  NotaFinalizadora();

  @override
  String toString() {
    return 'NotaFinalizadora[id=$id, idNota=$idNota, idFinalizadora=$idFinalizadora, finalizadoraEmpresa=$finalizadoraEmpresa, valor=$valor, troco=$troco, transacaoCartao=$transacaoCartao, cancelada=$cancelada, lancamentoManual=$lancamentoManual, alteracaoManual=$alteracaoManual ]';
  }

  factory NotaFinalizadora.fromJson(Map<String, dynamic> json) {
    NotaFinalizadora nf = _$NotaFinalizadoraFromJson(json);

    nf._finalizadoraEmpresa = json['finalizadoraEmpresa'] == null
        ? null
        : FinalizadoraEmpresa.fromJson(
        json['finalizadoraEmpresa'] as Map<String, dynamic>);

    return nf;
  }

  Map<String, dynamic> toJson() => _$NotaFinalizadoraToJson(this);

  static List<NotaFinalizadora> listFromJson(List<dynamic> json) {
    return json.map((value) => NotaFinalizadora.fromJson(value)).toList();
  }

  static Map<String, NotaFinalizadora> mapFromJson(Map<String, dynamic> json) {
    Map<String, NotaFinalizadora> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = NotaFinalizadora.fromJson(value));
    }
    return map;
  }

  FinalizadoraEmpresa? get finalizadoraEmpresa => _finalizadoraEmpresa;
}
