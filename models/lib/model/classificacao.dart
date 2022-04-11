part of openapi.api;

@JsonSerializable()
class Classificacao {

  int? id;

  int? idEmpresa;

  String? descricao;

  BigDecimal? percentualDesconto = BigDecimal.ZERO();

  String? tipo;

  //enum tipoEnum {  CLIENTE,  FORNECEDOR,  };{

  int? versao;

  Classificacao();

  @override
  String toString() {
    return 'Classificacao[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, percentualDesconto=$percentualDesconto, tipo=$tipo, versao=$versao, ]';
  }

  factory Classificacao.fromJson(Map<String, dynamic> json) =>
      _$ClassificacaoFromJson(json);

  Map<String, dynamic> toJson() => _$ClassificacaoToJson(this);

  static List<Classificacao> listFromJson(List<dynamic> json) {
    return json.map((value) => Classificacao.fromJson(value)).toList();
  }

  static Map<String, Classificacao> mapFromJson(Map<String, dynamic> json) {
    Map<String, Classificacao> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Classificacao.fromJson(value));
    }
    return map;
  }
}

