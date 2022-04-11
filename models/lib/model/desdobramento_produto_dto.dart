part of openapi.api;

@JsonSerializable()
class DesdobramentoProdutoDTO {
  String? descricao;

  BigDecimal? quantidadeVendida;

  BigDecimal? valorVendido;

  String? tipoItem;

  // enum TipoItem { ITEM, OBSERVACAO, ADICIONAL, COMBO, ITEM_COMBO, COMPOSTO, ITEM_COMPOSTO, COMBINADO, ITEM_COMBINADO, RODIZIO, ITEM_RODIZIO, CESTA, ITEM_CESTA, MENU, GORJETA, INGRESSO, }

  int? idGrupo;

  DesdobramentoProdutoDTO();

  @override
  String toString() {
    return 'DesdobramentoProdutoDTO{descricao: $descricao, quantidadeVendida: $quantidadeVendida, valorVendido: $valorVendido, tipoItem: $tipoItem, idGrupo: $idGrupo}';
  }

  factory DesdobramentoProdutoDTO.fromJson(Map<String, dynamic> json) =>
      _$DesdobramentoProdutoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DesdobramentoProdutoDTOToJson(this);

  static List<DesdobramentoProdutoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => DesdobramentoProdutoDTO.fromJson(value))
        .toList();
  }

  static Map<String, DesdobramentoProdutoDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, DesdobramentoProdutoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = DesdobramentoProdutoDTO.fromJson(value));
    }
    return map;
  }
}