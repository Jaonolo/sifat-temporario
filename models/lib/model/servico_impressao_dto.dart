part of openapi.api;

@JsonSerializable()
class ServicoImpressaoDTO {

  String? tipo;

  //enum tipoEnum {  ITEM,  MENSAGEM,  FECHAMENTO,  };{

  NotaItem? cabecalho;

  AuxiliarProducao? auxiliarProducao;

  EstacaoImpressora? estacaoImpressora;

  List<NotaItem> notaItems = [];

  Modulo? modulo;

  EstacaoTrabalho? estacaoTrabalho;

  ServicoImpressaoDTO();

  @override
  String toString() {
    return 'ServicoImpressaoDTO[tipo=$tipo, cabecalho=$cabecalho, auxiliarProducao=$auxiliarProducao, estacaoImpressora=$estacaoImpressora, notaItems=$notaItems, modulo=$modulo, estacaoTrabalho=$estacaoTrabalho, ]';
  }

  factory ServicoImpressaoDTO.fromJson(Map<String, dynamic> json) =>
      _$ServicoImpressaoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ServicoImpressaoDTOToJson(this);

  static List<ServicoImpressaoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => ServicoImpressaoDTO.fromJson(value)).toList();
  }

  static Map<String, ServicoImpressaoDTO> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, ServicoImpressaoDTO> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ServicoImpressaoDTO.fromJson(value));
    }
    return map;
  }
}

