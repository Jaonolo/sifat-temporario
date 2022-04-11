part of openapi.api;

@JsonSerializable()
class AtribuirProdutoEmpresaDTO {

  String? cnpj;

  BigDecimal? precoCusto = BigDecimal.ZERO();

  BigDecimal? precoVenda = BigDecimal.ZERO();

  int? idProdutoEmpresa;

  ProdutoEmpresa? produtoEmpresa;

  AtribuirProdutoEmpresaDTO();

  @override
  String toString() {
    return 'AtribuirProdutoEmpresaDTO[cnpj=$cnpj, precoCusto=$precoCusto, precoVenda=$precoVenda, idProdutoEmpresa=$idProdutoEmpresa, produtoEmpresa=$produtoEmpresa, ]';
  }

  factory AtribuirProdutoEmpresaDTO.fromJson(Map<String, dynamic> json) =>
      _$AtribuirProdutoEmpresaDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AtribuirProdutoEmpresaDTOToJson(this);

  static List<AtribuirProdutoEmpresaDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => AtribuirProdutoEmpresaDTO.fromJson(value))
        .toList();
  }

  static Map<String, AtribuirProdutoEmpresaDTO> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, AtribuirProdutoEmpresaDTO> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = AtribuirProdutoEmpresaDTO.fromJson(value));
    }
    return map;
  }
}

