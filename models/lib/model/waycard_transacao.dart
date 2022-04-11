part of openapi.api;

@JsonSerializable()
class WaycardTransacao {

  int? id;

  int? idFatura;

  WaycardFatura? fatura;

  int? idCartao;

  int? idLojista;

  Lojista? lojista;

  BigDecimal? valor;

  String? numeroVenda;

  DateTime? data;

  String? status;

  //enum statusEnum {  EFETUADA,  ESTORNADA,  };{

  String? nsu;

  WaycardTransacao();

  @override
  String toString() {
    return 'WaycardTransacao[id=$id, idFatura=$idFatura, fatura=$fatura, idCartao=$idCartao, idLojista=$idLojista, lojista=$lojista, valor=$valor, numeroVenda=$numeroVenda, data=$data, status=$status, nsu=$nsu, ]';
  }

  factory WaycardTransacao.fromJson(Map<String, dynamic> json) =>
      _$WaycardTransacaoFromJson(json);

  Map<String, dynamic> toJson() => _$WaycardTransacaoToJson(this);

  static List<WaycardTransacao> listFromJson(List<dynamic> json) {
    return json.map((value) => WaycardTransacao.fromJson(value)).toList();
  }

  static Map<String, WaycardTransacao> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, WaycardTransacao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = WaycardTransacao.fromJson(value));
    }
    return map;
  }
}

