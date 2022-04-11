part of openapi.api;

@JsonSerializable()
class Grade {

  int? id;

  int? indice;

  int? idProduto;

  int? codigoInterno;

  String? codigo;

  String? referencia;

  Tamanho? tamanho;

  Cor? cor;

  Colecao? colecao;

  bool? ativo;

  bool? padrao;

  Grade();

  @override
  String toString() {
    return 'Grade[id=$id, indice=$indice, idProduto=$idProduto, codigoInterno=$codigoInterno, codigo=$codigo, referencia=$referencia, tamanho=$tamanho, cor=$cor, colecao=$colecao, ativo=$ativo, padrao=$padrao, ]';
  }

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);

  Map<String, dynamic> toJson() => _$GradeToJson(this);

  static List<Grade> listFromJson(List<dynamic> json) {
    return json.map((value) => Grade.fromJson(value)).toList();
  }

  static Map<String, Grade> mapFromJson(Map<String, dynamic> json) {
    Map<String, Grade> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Grade.fromJson(value));
    }
    return map;
  }

  clone() {
    return Grade.fromJson(jsonDecode(jsonEncode(this.toJson())));
  }
}

