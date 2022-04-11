part of openapi.api;

@JsonSerializable()
class ProdutoMenuComponente {
  int? id;

  String? descricao;

  int? idMenu;

  int? idGrade;

  Grade? grade;

  Observacao? observacao;

  BigDecimal? quantidade = BigDecimal.ZERO();

  int? quantidadeMinima;

  int? quantidadeMaxima;

  List<ProdutoMenuComponenteEmpresa> componenteEmpresas = [];

  ProdutoMenuComponente();

  BigDecimal? getValorComponente(int idEmpresa, int idTabelaPreco) {
    BigDecimal? valorCoponente = BigDecimal.ZERO();
    for (var pmce in componenteEmpresas) {
      if (pmce.idEmpresa == idEmpresa) {
        for (var pmcep in pmce.precos) {
          if (pmcep.tabelaPreco!.id == idTabelaPreco) {
            valorCoponente = pmcep.valorComponente;
          }
        }
      }
    }
    return valorCoponente;
  }


  @override
  String toString() {
    return 'ProdutoMenuComponente[id=$id, descricao=$descricao, idMenu=$idMenu, idGrade=$idGrade, grade=$grade, observacao=$observacao, quantidade=$quantidade, quantidadeMinima=$quantidadeMinima, quantidadeMaxima=$quantidadeMaxima, componenteEmpresas=$componenteEmpresas, ]';
  }

  factory ProdutoMenuComponente.fromJson(Map<String, dynamic> json) =>
      _$ProdutoMenuComponenteFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutoMenuComponenteToJson(this);

  static List<ProdutoMenuComponente> listFromJson(List<dynamic> json) {
    return json.map((value) => ProdutoMenuComponente.fromJson(value)).toList();
  }

  static Map<String, ProdutoMenuComponente> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, ProdutoMenuComponente>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ProdutoMenuComponente.fromJson(value));
    }
    return map;
  }
}
