part of openapi.api;

@JsonSerializable()
class UsuarioPerfilEmpresa {
  int? id;

  String? descricao;

  bool acessoERP = true;

  int? idEmpresa;

  @JsonKey()
  List<UsuarioPerfilEmpresaPrivilegio> usuarioPerfilEmpresaPrivilegios = [];

  bool? master;

  bool? padrao;

  UsuarioPerfilEmpresa();

  @override
  String toString() {
    return 'UsuarioPerfilEmpresa{id: $id, descricao: $descricao, acessoERP: $acessoERP, idEmpresa: $idEmpresa, usuarioPerfilEmpresaPrivilegios: $usuarioPerfilEmpresaPrivilegios, master: $master, padrao: $padrao}';
  }

  factory UsuarioPerfilEmpresa.fromJson(Map<String, dynamic> json) =>
      _$UsuarioPerfilEmpresaFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioPerfilEmpresaToJson(this);

  static List<UsuarioPerfilEmpresa> listFromJson(List<dynamic> json) {
    return json.map((value) => UsuarioPerfilEmpresa.fromJson(value)).toList();
  }

  static Map<String, UsuarioPerfilEmpresa> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, UsuarioPerfilEmpresa>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = UsuarioPerfilEmpresa.fromJson(value));
    }
    return map;
  }
}
