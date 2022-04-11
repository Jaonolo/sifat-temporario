part of openapi.api;

@JsonSerializable()
class Banco {

  int? id;

  int? idEmpresa;

  String? nome;

  String? codigoBanco;

  String? site;

  int? versao;

  Banco();

  @override
  String toString() {
    return 'Banco[id=$id, idEmpresa=$idEmpresa, nome=$nome, codigoBanco=$codigoBanco, site=$site, versao=$versao, ]';
  }

  factory Banco.fromJson(Map<String, dynamic> json) => _$BancoFromJson(json);

  Map<String, dynamic> toJson() => _$BancoToJson(this);

  static List<Banco> listFromJson(List<dynamic> json) {
    return json.map((value) => Banco.fromJson(value)).toList();
  }

  static Map<String, Banco> mapFromJson(Map<String, dynamic> json) {
    Map<String, Banco> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Banco.fromJson(value));
    }
    return map;
  }
}

