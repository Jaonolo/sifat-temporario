part of openapi.api;

@JsonSerializable()
class Setor {

  int? id;

  int? idEmpresa;

  String? nome;

  String? descricao;

  int? idLayoutControle;

  LayoutControle? layoutControle;

  BigDecimal? percentualComissao;

  bool? taxaServico;

  int? idLocal;

  bool? ativo;

  bool? padrao;

  @JsonKey(defaultValue: [])
  List<EnderecoEstoque> enderecos = [];

  int? versao;

  Setor();

  @override
  String toString() {
    return 'Setor{id: $id, idEmpresa: $idEmpresa, nome: $nome, descricao: $descricao, idLayoutControle: $idLayoutControle, layoutControle: $layoutControle, percentualComissao: $percentualComissao, taxaServico: $taxaServico, idLocal: $idLocal, ativo: $ativo, padrao: $padrao, enderecos: $enderecos, versao: $versao}';
  }

  factory Setor.fromJson(Map<String, dynamic> json) => _$SetorFromJson(json);

  Map<String, dynamic> toJson() => _$SetorToJson(this);

  static List<Setor> listFromJson(List<dynamic> json) {
    return json.map((value) => Setor.fromJson(value)).toList();
  }

  static Map<String, Setor> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Setor>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Setor.fromJson(value));
    }
    return map;
  }
}

