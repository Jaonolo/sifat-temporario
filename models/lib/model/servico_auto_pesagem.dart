part of openapi.api;

@JsonSerializable()
class ServicoAutoPesagem {

  int? id;
  int? idEmpresa;
  int? idGradeEmpresa;
  BigDecimal? tara;
  GradeEmpresa? gradeEmpresa;
  String? token;
  bool imprimirPeso = false;
  String? lancamentoAutomatico;

  //NENHUM, MESA, FICHA ,  AMBOS;

  ServicoAutoPesagem();


  @override
  String toString() {
    return 'ServicoAutoPesagem{id: $id, idEmpresa: $idEmpresa, idGradeEmpresa: $idGradeEmpresa, tara: $tara, gradeEmpresa: $gradeEmpresa, token: $token, imprimirPeso: $imprimirPeso, lancamentoAutomatico: $lancamentoAutomatico}';
  }

  factory ServicoAutoPesagem.fromJson(Map<String, dynamic> json) =>
      _$ServicoAutoPesagemFromJson(json);

  Map<String, dynamic> toJson() => _$ServicoAutoPesagemToJson(this);

  static List<ServicoAutoPesagem> listFromJson(List<dynamic> json) {
    return json.map((value) => ServicoAutoPesagem.fromJson(value)).toList();
  }

  static Map<String, ServicoAutoPesagem> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ServicoAutoPesagem>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ServicoAutoPesagem.fromJson(value));
    }
    return map;
  }
}
