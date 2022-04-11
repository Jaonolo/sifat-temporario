part of openapi.api;

@JsonSerializable()
class OperacaoDTO {

  String? tipoOperacao;

  //enum TipoOperacap{ SANGRIA, SUPRIMENTO, RECEBIMENTO}

  DateTime? data;

  BigDecimal? valor;

  String? favorecido;

  String? historico;

  int? idFinalizadora;

  int? codigo;

  String? descricaoFinalizadora;

  OperacaoDTO();

  @override
  String toString() {
    return 'OperacaoDTO{tipoOperacao: $tipoOperacao, data: $data, valor: $valor, favorecido: $favorecido, historico: $historico, idFinalizadora: $idFinalizadora, codigo: $codigo, descricaoFinalizadora: $descricaoFinalizadora}';
  }

  factory OperacaoDTO.fromJson(Map<String, dynamic> json) =>
      _$OperacaoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OperacaoDTOToJson(this);

  static List<OperacaoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => OperacaoDTO.fromJson(value)).toList();
  }

  static Map<String, OperacaoDTO> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, OperacaoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = OperacaoDTO.fromJson(value));
    }
    return map;
  }
}
