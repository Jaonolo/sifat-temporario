part of openapi.api;

@JsonSerializable()
class LoginClientDTO {

  @JsonKey(defaultValue: Clients.WAITER_MOBILE)
  Clients client = Clients.WAITER_MOBILE;

  String? clientKey;

  String? clientSecret;

  String? versao;

  String? nomeEstacao;
  LoginClientDTO();


  @override
  String toString() {
    return 'LoginClientDTO{client: $client, clientKey: $clientKey, clientSecret: $clientSecret, versao: $versao, nomeEstacao: $nomeEstacao}';
  }

  factory LoginClientDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginClientDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginClientDTOToJson(this);

  static List<LoginClientDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => LoginClientDTO.fromJson(value)).toList();
  }

  static Map<String, LoginClientDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, LoginClientDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = LoginClientDTO.fromJson(value));
    }
    return map;
  }

}
