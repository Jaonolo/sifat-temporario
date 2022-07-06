part of openapi.api;

@JsonSerializable()
class LoginUsuarioDTO extends LoginClientDTO{

  String? username;

  String? password;

  String? pin;

  String? uid;// exclusivo waycard google/facebook

  LoginUsuarioDTO();


  @override
  String toString() {
    return 'LoginUsuarioDTO{username: $username, password: $password, pin: $pin}';
  }

  factory LoginUsuarioDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginUsuarioDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUsuarioDTOToJson(this);

  static List<LoginUsuarioDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => LoginUsuarioDTO.fromJson(value)).toList();
  }

}
