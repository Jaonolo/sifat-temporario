part of openapi.api;

@JsonSerializable()
class WaycardFatura {

  int? id;

  int? idBandeira;

  BigDecimal? valor;

  DateTime? dataAbertura;

  DateTime? dataFechamento;

  DateTime? dataPagamento;

  String? status;

  //enum statusEnum {  ABERTA,  FECHADA,  PAGA,  };{
  WaycardFatura();

  @override
  String toString() {
    return 'WaycardFatura[id=$id, idBandeira=$idBandeira, valor=$valor, dataAbertura=$dataAbertura, dataFechamento=$dataFechamento, dataPagamento=$dataPagamento, status=$status, ]';
  }

  factory WaycardFatura.fromJson(Map<String, dynamic> json) =>
      _$WaycardFaturaFromJson(json);

  Map<String, dynamic> toJson() => _$WaycardFaturaToJson(this);

  static List<WaycardFatura> listFromJson(List<dynamic> json) {
    return json.map((value) => WaycardFatura.fromJson(value)).toList();
  }

  static Map<String, WaycardFatura> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, WaycardFatura>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = WaycardFatura.fromJson(value));
    }
    return map;
  }
}

