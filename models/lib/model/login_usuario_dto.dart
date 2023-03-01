part of openapi.api;

@JsonSerializable()
class LoginUsuarioDTO extends LoginClientDTO{

  String? username;

  String? password;

  String? pin;

  LoginUsuarioDTO();

  factory LoginUsuarioDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginUsuarioDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUsuarioDTOToJson(this);

  static List<LoginUsuarioDTO> listFromJson(List<dynamic> json) {
    return json == null
        ? List.empty()
        : json.map((value) => LoginUsuarioDTO.fromJson(value)).toList();
  }

  static Map<String, LoginUsuarioDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, LoginUsuarioDTO>();
    if (json != null && json.isNotEmpty) {
      json.forEach(
          (String key, dynamic value) => map[key] = LoginUsuarioDTO.fromJson(value));
    }
    return map;
  }
}
