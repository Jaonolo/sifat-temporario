part of openapi.api;

@JsonSerializable()
class UsuarioPerfilEmpresaPrivilegio {
  int? id;

  int? idUsuarioPerfilEmpresa;

  PrivilegioCodigo? privilegioCodigo;

  NivelPrivilegio? nivelPrivilegio;

  UsuarioPerfilEmpresaPrivilegio();

  @override
  String toString() {
    return 'UsuarioPerfilEmpresaPrivilegio{id: $id, idUsuarioPerfilEmpresa: $idUsuarioPerfilEmpresa, privilegioCodigo: $privilegioCodigo, nivelPrivilegio: $nivelPrivilegio}';
  }

  factory UsuarioPerfilEmpresaPrivilegio.fromJson(Map<String, dynamic> json) =>
      _$UsuarioPerfilEmpresaPrivilegioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioPerfilEmpresaPrivilegioToJson(this);

  static List<UsuarioPerfilEmpresaPrivilegio> listFromJson(List<dynamic> json) {
    return json.map((value) => UsuarioPerfilEmpresaPrivilegio.fromJson(value))
        .toList();
  }

  static Map<String, UsuarioPerfilEmpresaPrivilegio> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, UsuarioPerfilEmpresaPrivilegio>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = UsuarioPerfilEmpresaPrivilegio.fromJson(value));
    }
    return map;
  }
}