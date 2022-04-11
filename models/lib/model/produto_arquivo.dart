part of openapi.api;

@JsonSerializable()
class ProdutoArquivo {
  int? id;
  Produto? produto;
  String? tipo;
  String? formato;
  String? descricao;
  bool? principal;
  String? link;

  ProdutoArquivo();

  factory ProdutoArquivo.fromJson(Map<String, dynamic> json) =>
      _$ProdutoArquivoFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutoArquivoToJson(this);
}