part of openapi.api;

@JsonSerializable()
class UsuarioEmpresa {

  int? id;

  Usuario? usuario;

  int? idEmpresa;

  Empresa? empresa;

  String? perfil;

  //enum perfilEnum {  OPERADOR,  VENDEDOR,  CAIXA,  SUPERVISOR,  ADMINISTRADOR,  MASTER,  };{

  int? idVendedor;

  Funcionario? vendedor;

  bool? padrao;

  UsuarioPerfilEmpresa? usuarioPerfilEmpresa;

  bool? ativo;

  UsuarioEmpresa();


  @override
  String toString() {
    return 'UsuarioEmpresa{id: $id, usuario: $usuario, idEmpresa: $idEmpresa, empresa: $empresa, perfil: $perfil, idVendedor: $idVendedor, vendedor: $vendedor, padrao: $padrao, usuarioPerfilEmpresa: $usuarioPerfilEmpresa, ativo: $ativo}';
  }

  factory UsuarioEmpresa.fromJson(Map<String, dynamic> json) =>
      _$UsuarioEmpresaFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioEmpresaToJson(this);

  static List<UsuarioEmpresa> listFromJson(List<dynamic> json) {
    return json.map((value) => UsuarioEmpresa.fromJson(value)).toList();
  }

  static Map<String, UsuarioEmpresa> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, UsuarioEmpresa>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = UsuarioEmpresa.fromJson(value));
    }
    return map;
  }
}

