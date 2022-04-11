part of openapi.api;

@JsonSerializable()
class Usuario {

  int? id;

  String? uid;

  String? nome;

  String? cpf;

  String? email;

  String? telefone;

  String? username;

  String? password;

  int? pin;

  bool? confirmado;

  int? tentativasLogin = 0;

  DateTime? dataBloqueio;

  ControleCadastro? controleCadastro = ControleCadastro();

  String? genero = 'MASCULINO'; // estava dando erro na api, nao pode ser null

  DateTime? dataNascimento;


  Usuario();

  @override
  String toString() {
    return 'User[id=$id, uid=$uid, nome=$nome, cpf=$cpf, email=$email, telefone=$telefone, username=$username, password=$password, pin=$pin, confirmado=$confirmado, tentativasLogin=$tentativasLogin, dataBloqueio=$dataBloqueio, controleCadastro=$controleCadastro, ]';
  }

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);


  static List<Usuario> listFromJson(List<dynamic> json) {
    return json.map((value) => Usuario.fromJson(value)).toList();
  }

  static Map<String, Usuario> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Usuario>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Usuario.fromJson(value));
    }
    return map;
  }
}

