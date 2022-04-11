part of openapi.api;

@JsonSerializable()
class CadastroImpressoraProducaoDto {
  LocalProducao? localProducao;

  EquipamentoImpressao? impressora;

  CadastroImpressoraProducaoDto();

  @override
  String toString() {
    return 'CadastroImpressoraProducaoDto[localProducao=$localProducao, impressora=$impressora, ]';
  }

  factory CadastroImpressoraProducaoDto.fromJson(Map<String, dynamic> json) =>
      _$CadastroImpressoraProducaoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CadastroImpressoraProducaoDtoToJson(this);

  static List<CadastroImpressoraProducaoDto> listFromJson(List<dynamic> json) {
    return json
        .map((value) => CadastroImpressoraProducaoDto.fromJson(value))
        .toList();
  }

  static Map<String, CadastroImpressoraProducaoDto> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, CadastroImpressoraProducaoDto>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CadastroImpressoraProducaoDto.fromJson(value));
    }
    return map;
  }
}
