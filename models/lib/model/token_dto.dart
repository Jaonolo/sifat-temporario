part of openapi.api;

@JsonSerializable()
class TokenDTO {

   String? token;

   String type = "Bearer ";

  TokenDTO();


  @override
  String toString() {
    return 'TokenDTO{}';
  }

  factory TokenDTO.fromJson(Map<String, dynamic> json) =>
      _$TokenDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDTOToJson(this);

  static List<TokenDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => TokenDTO.fromJson(value)).toList();
  }

  static Map<String,TokenDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, TokenDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = TokenDTO.fromJson(value));
    }
    return map;
  }

}
