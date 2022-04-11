part of openapi.api;

@JsonSerializable()
class GrupoEstacao {

  int? id;

  int? idEmpresa;

  String? descricao;

  List<Modulo> modulos = [];

  List<GrupoImpressora> impressoras = [];

  GrupoEstacao();

  @override
  String toString() {
    return 'GrupoEstacao[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, modulos=$modulos, impressoras=$impressoras, ]';
  }

  factory GrupoEstacao.fromJson(Map<String, dynamic> json) =>
      _$GrupoEstacaoFromJson(json);

  Map<String, dynamic> toJson() => _$GrupoEstacaoToJson(this);

  static List<GrupoEstacao> listFromJson(List<dynamic> json) {
    return json.map((value) => GrupoEstacao.fromJson(value)).toList();
  }

  static Map<String, GrupoEstacao> mapFromJson(Map<String, dynamic> json) {
    Map<String, GrupoEstacao> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = GrupoEstacao.fromJson(value));
    }
    return map;
  }
}

