part of openapi.api;

@JsonSerializable()
class CadastroEstacaoTrabalhoDTO {

  EstacaoTrabalho? estacaoTrabalho;

  EquipamentoImpressao? impressoraGeral;

  List<CadastroImpressoraProducaoDto> listImpressorasProducao = [];

  CadastroEstacaoTrabalhoDTO();

  @override
  String toString() {
    return 'CadastroEstacaoTrabalhoDTO[estacaoTrabalho=$estacaoTrabalho, impressoraGeral=$impressoraGeral, listImpressorasProducao=$listImpressorasProducao, ]';
  }

  factory CadastroEstacaoTrabalhoDTO.fromJson(Map<String, dynamic> json) =>
      _$CadastroEstacaoTrabalhoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CadastroEstacaoTrabalhoDTOToJson(this);

  static List<CadastroEstacaoTrabalhoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => CadastroEstacaoTrabalhoDTO.fromJson(value))
        .toList();
  }

  static Map<String, CadastroEstacaoTrabalhoDTO> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, CadastroEstacaoTrabalhoDTO> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CadastroEstacaoTrabalhoDTO.fromJson(value));
    }
    return map;
  }
}

