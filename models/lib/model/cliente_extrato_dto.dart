part of openapi.api;

@JsonSerializable()
class ClienteExtratoDTO {
  Cliente? cliente;

  BigDecimal? limite = BigDecimal.ZERO();

  BigDecimal? titulosAbertos = BigDecimal.ZERO();

  BigDecimal? saldoFaturar = BigDecimal.ZERO();

  BigDecimal? limiteDisponivel = BigDecimal.ZERO();

  @JsonKey(defaultValue: [])
  List<ClienteConta> contas = [];

  ClienteExtratoDTO();

  @override
  String toString() {
    return 'ClienteExtratoDTO{cliente: $cliente, limite: $limite, titulosAbertos: $titulosAbertos, saldoFaturar: $saldoFaturar, limiteDisponivel: $limiteDisponivel, contas: $contas}';
  }

  factory ClienteExtratoDTO.fromJson(Map<String, dynamic> json) =>
      _$ClienteExtratoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteExtratoDTOToJson(this);

  static List<ClienteExtratoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => ClienteExtratoDTO.fromJson(value)).toList();
  }

  static Map<String, ClienteExtratoDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ClienteExtratoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClienteExtratoDTO.fromJson(value));
    }
    return map;
  }
}