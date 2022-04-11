part of openapi.api;

@JsonSerializable()
class Cardapio {

  int? id;

  int? idEmpresa;

  String? descricao;

  int? versao;

  Cardapio();

  @override
  String toString() {
    return 'Cardapio[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, versao=$versao, ]';
  }

  factory Cardapio.fromJson(Map<String, dynamic> json) =>
      _$CardapioFromJson(json);

  Map<String, dynamic> toJson() => _$CardapioToJson(this);

  static List<Cardapio> listFromJson(List<dynamic> json) {
    return json.map((value) => Cardapio.fromJson(value)).toList();
  }

  static Map<String, Cardapio> mapFromJson(Map<String, dynamic> json) {
    Map<String, Cardapio> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Cardapio.fromJson(value));
    }
    return map;
  }
}

