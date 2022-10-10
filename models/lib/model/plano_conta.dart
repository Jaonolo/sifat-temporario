part of openapi.api;

@JsonSerializable()
class PlanoConta {
  int? id;

  int? idEmpresa;

  Empresa? empresa;

  String? TipoMovimento = ("ENTRADA");

  //enum {ENTRADA ,  SAIDA}

  String? descricao;

  String? codigo;

  int? idPlanoContaRaiz;

  PlanoConta? planoContaRaiz;

  int? idPlanoContaPai;

  PlanoConta? planoContaPai;

  String? classificacao = "NAO_EXIBIR_DRE";

  bool? compraRevenda = false;

  @JsonKey(defaultValue: [])
  List<PlanoConta> subitens = [];

  PlanoConta();

  @override
  String toString() {
    return 'PlanoConta{id: $id, idEmpresa: $idEmpresa, empresa: $empresa, TipoMovimento: $TipoMovimento, descricao: $descricao, codigo: $codigo, idPlanoContaRaiz: $idPlanoContaRaiz, planoContaRaiz: $planoContaRaiz, idPlanoContaPai: $idPlanoContaPai, planoContaPai: $planoContaPai, classificacao: $classificacao, compraRevenda: $compraRevenda, subitens: $subitens}';
  }

  factory PlanoConta.fromJson(Map<String, dynamic> json) =>
      _$PlanoContaFromJson(json);

  Map<String, dynamic> toJson() => _$PlanoContaToJson(this);

  static List<PlanoConta> listFromJson(List<dynamic> json) {
    return json.map((value) => PlanoConta.fromJson(value)).toList();
  }

  static Map<String, PlanoConta> mapFromJson(Map<String, dynamic> json) {
    Map<String, PlanoConta> map = {};
    if (json.isNotEmpty) {
      json.forEach(
              (String key, dynamic value) =>
          map[key] = PlanoConta.fromJson(value));
    }
    return map;
  }
}
