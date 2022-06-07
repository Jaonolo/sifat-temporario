part of openapi.api;

@JsonSerializable()
class Client {

  int? id;

  String? nome;

  String? clientKey;

  String? descricao;

  String? servico;

  //enum servicoEnum {  NENHUM,  IFOOD,  IMPRESSAO,  CATRACA,  ALFA_SYNC,  FOUR_ALL,  };{

  bool? ativo;

  @JsonKey(defaultValue: [])
  List<String> segmentos = [];

  //enum segmentosEnum {  SORVETERIAS_ACAITERIA,  LANCHONETES,  RESTAURANTES,  CAFETERIAS,  CHURRASCARIAS,  PADARIAS,  PIZZARIAS,  TABACARIAS,  FRIOS_LATICINIOS,  EMPORIOS,  MARMITARIA,  OUTROS,  };{
  Client();

  @override
  String toString() {
    return 'Client[id=$id, nome=$nome, clientKey=$clientKey, descricao=$descricao, servico=$servico, ativo=$ativo, segmentos=$segmentos, ]';
  }

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);

  static List<Client> listFromJson(List<dynamic> json) {
    return json.map((value) => Client.fromJson(value)).toList();
  }

  static Map<String, Client> mapFromJson(Map<String, dynamic> json) {
    Map<String, Client> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Client.fromJson(value));
    }
    return map;
  }
}

