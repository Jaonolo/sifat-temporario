part of openapi.api;

@JsonSerializable()
class EmpresaIntegrador {
  String? telefone;

  String? telefoneWhatsApp;

  String? email;

  String? redeFiliation;

  String? redeToken;

  EmpresaIntegrador();


  @override
  String toString() {
    return 'EmpresaIntegrador{telefone: $telefone, telefoneWhatsApp: $telefoneWhatsApp, email: $email, redeFiliation: $redeFiliation, redeToken: $redeToken}';
  }

  factory EmpresaIntegrador.fromJson(Map<String, dynamic> json) =>
      _$EmpresaIntegradorFromJson(json);

  Map<String, dynamic> toJson() => _$EmpresaIntegradorToJson(this);

  static List<EmpresaIntegrador> listFromJson(List<dynamic> json) {
    return json.map((value) => EmpresaIntegrador.fromJson(value)).toList();
  }

  static Map<String, EmpresaIntegrador> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EmpresaIntegrador>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EmpresaIntegrador.fromJson(value));
    }
    return map;
  }
}
