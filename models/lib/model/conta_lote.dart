part of openapi.api;

@JsonSerializable()
class Contalote {
  int? id;

  int? idEmpresa;

  Empresa? empresa;

  DateTime? dataCriacao;

  int? idPessoa;

  Pessoa? pessoa;

  int? numeroParcelas;

  List<Conta>? parcelas;

  Contalote();

  @override
  String toString() {
    return 'Contalote{id: $id, idEmpresa: $idEmpresa, empresa: $empresa, dataCriacao: $dataCriacao, idPessoa: $idPessoa, pessoa: $pessoa, numeroParcelas: $numeroParcelas, parcelas: $parcelas}';
  }

  factory Contalote.fromJson(Map<String, dynamic> json) =>
      _$ContaloteFromJson(json);

  Map<String, dynamic> toJson() => _$ContaloteToJson(this);

  static List<Contalote> listFromJson(List<dynamic> json) {
    return json.map((value) => Contalote.fromJson(value)).toList();
  }

  static Map<String, Contalote> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Contalote>();
    if (json.isNotEmpty) {
      json.forEach(
              (String key, dynamic value) =>
          map[key] = Contalote.fromJson(value));
    }
    return map;
  }
}
