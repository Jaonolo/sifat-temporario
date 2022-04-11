part of openapi.api;

@JsonSerializable()
class EmpresaDTO {
  int? id;

  String? razaoSocial;

  String? nomaFantasia;

  int? numeroLoja;

  String? inscricaoFederal;

  int? variacao;

  String? logo;

  EmpresaContrato? empresaContrato;

  bool? testando;

  DateTime? vencimentoTeste;

  EmpresaVenda? empresaVenda;

  Quest? quest;

  EmpresaDTO();


  @override
  String toString() {
    return 'EmpresaDTO{id: $id, razaoSocial: $razaoSocial, nomaFantasia: $nomaFantasia, numeroLoja: $numeroLoja, inscricaoFederal: $inscricaoFederal, variacao: $variacao, logo: $logo, empresaContrato: $empresaContrato, testando: $testando, vencimentoTeste: $vencimentoTeste, empresaVenda: $empresaVenda, quest: $quest}';
  }

  factory EmpresaDTO.fromJson(Map<String, dynamic> json) =>
      _$EmpresaDTOFromJson(json);

  Map<String, dynamic> toJson() => _$EmpresaDTOToJson(this);


  static List<EmpresaDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => EmpresaDTO.fromJson(value)).toList();
  }

  static Map<String, EmpresaDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EmpresaDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EmpresaDTO.fromJson(value));
    }
    return map;
  }
}
