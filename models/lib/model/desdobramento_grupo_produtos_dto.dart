part of openapi.api;

@JsonSerializable()
class DesdobramentoGrupoProdutosDTO {
  String? descricaoGrupo;

  BigDecimal? quantidadeVendida;

  BigDecimal? valorVendido;

  BigDecimal? ticketMedio;

  List<DesdobramentoProdutoDTO>? desdobramentoProdutoDTOList;

  DesdobramentoGrupoProdutosDTO();

  @override
  String toString() {
    return 'DesdobramentoGrupoProdutosDTO{descricaoGrupo: $descricaoGrupo, quantidadeVendida: $quantidadeVendida, valorVendido: $valorVendido, ticketMedio: $ticketMedio, desdobramentoProdutoDTOList: $desdobramentoProdutoDTOList}';
  }

  factory DesdobramentoGrupoProdutosDTO.fromJson(Map<String, dynamic> json) =>
      _$DesdobramentoGrupoProdutosDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DesdobramentoGrupoProdutosDTOToJson(this);

  static List<DesdobramentoGrupoProdutosDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => DesdobramentoGrupoProdutosDTO.fromJson(value))
        .toList();
  }

  static Map<String, DesdobramentoGrupoProdutosDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, DesdobramentoGrupoProdutosDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = DesdobramentoGrupoProdutosDTO.fromJson(value));
    }
    return map;
  }

}