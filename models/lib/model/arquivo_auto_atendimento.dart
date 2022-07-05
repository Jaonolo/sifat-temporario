part of openapi.api;

@JsonSerializable()
class ArquivoAutoAtendimento {
  int? id;
  int? idClientAutoAtendimento;
  TipoArquivo? tipoArquivo;
  VisaoFoto? visaoFoto;
  FormatoArquivo? formatoArquivo;
  String? descricao;
  String? link;

  ArquivoAutoAtendimento();

  @override
  String toString() {
    return 'ArquivoAutoAtendimento{id: $id, idClientAutoAtendimento: $idClientAutoAtendimento, tipoArquivo: $tipoArquivo, visaoFoto: $visaoFoto, formatoArquivo: $formatoArquivo, descricao: $descricao, link: $link}';
  }

  factory ArquivoAutoAtendimento.fromJson(Map<String, dynamic> json) =>
      _$ArquivoAutoAtendimentoFromJson(json);

  Map<String, dynamic> toJson() => _$ArquivoAutoAtendimentoToJson(this);

  static List<ArquivoAutoAtendimento> listFromJson(List<dynamic> json) {
    return json.map((value) => ArquivoAutoAtendimento.fromJson(value)).toList();
  }

  static Map<String, ArquivoAutoAtendimento> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, ArquivoAutoAtendimento> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ArquivoAutoAtendimento.fromJson(value));
    }
    return map;
  }


}