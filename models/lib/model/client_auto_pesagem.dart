part of openapi.api;

@JsonSerializable()
class ClientAutoPesagem {

  int? id;
  int? idEmpresa;
  int? idGradeEmpresa;
  BigDecimal? tara;
  GradeEmpresa? gradeEmpresa;
  bool imprimirPeso = false;
  String? lancamentoAutomatico;

  //NENHUM, MESA, FICHA ,  AMBOS;

  ClientAutoPesagem();


  @override
  String toString() {
    return 'ClientAutoPesagem{id: $id, idEmpresa: $idEmpresa, idGradeEmpresa: $idGradeEmpresa, tara: $tara, gradeEmpresa: $gradeEmpresa, imprimirPeso: $imprimirPeso, lancamentoAutomatico: $lancamentoAutomatico}';
  }

  factory ClientAutoPesagem.fromJson(Map<String, dynamic> json) =>
      _$ClientAutoPesagemFromJson(json);

  Map<String, dynamic> toJson() => _$ClientAutoPesagemToJson(this);

  static List<ClientAutoPesagem> listFromJson(List<dynamic> json) {
    return json.map((value) => ClientAutoPesagem.fromJson(value)).toList();
  }

  static Map<String, ClientAutoPesagem> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ClientAutoPesagem>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ClientAutoPesagem.fromJson(value));
    }
    return map;
  }
}
