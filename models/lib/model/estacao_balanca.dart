part of openapi.api;

@JsonSerializable()
class EstacaoBalanca {

  String? modelo = "NENHUM";

  //enum modeloEnum {  NENHUM,  FILIZOLA_BP,  FILIZOLA_MF,  FILIZOLA_E,  FILIZOLA_CS,  TOLEDO_PRIX_III,  TOLEDO_9094,  TOLEDO_8217,  TOLEDO_2096,  TOLEDO_PRIMA,  TOLEDO_PRIX_IV,  TOLEDO_PRIX_V,  TOLEDO_PRIX_VI,  MAGNA_TORREY_III,  };{

  String? portaSerial;

  //enum portaSerialEnum {  COM1,  COM2,  COM3,  COM4,  COM5,  COM6,  COM7,  COM8,  COM9,  };{

  int? baudrate;

  BigDecimal? timeout = BigDecimal.ZERO();

  int? bytesProtocolo;


  int? tentativas;

  EstacaoBalanca();

  @override
  String toString() {
    return 'EstacaoBalanca[modelo=$modelo, portaSerial=$portaSerial, baudrate=$baudrate, timeout=$timeout, bytesProtocolo=$bytesProtocolo, tentativas=$tentativas, ]';
  }

  factory EstacaoBalanca.fromJson(Map<String, dynamic> json) =>
      _$EstacaoBalancaFromJson(json);

  Map<String, dynamic> toJson() => _$EstacaoBalancaToJson(this);

  static List<EstacaoBalanca> listFromJson(List<dynamic> json) {
    return json.map((value) => EstacaoBalanca.fromJson(value)).toList();
  }

  static Map<String, EstacaoBalanca> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EstacaoBalanca>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EstacaoBalanca.fromJson(value));
    }
    return map;
  }
}

