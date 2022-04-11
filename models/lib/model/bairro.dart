part of openapi.api;

@JsonSerializable()
class Bairro {

  int? id;

  String? nome;

  String? nomeAbreviado;

  Cidade? cidade;

  Bairro();

  @override
  String toString() {
    return 'Bairro[id=$id, nome=$nome, nomeAbreviado=$nomeAbreviado, cidade=$cidade, ]';
  }

  factory Bairro.fromJson(Map<String, dynamic> json) => _$BairroFromJson(json);

  Map<String, dynamic> toJson() => _$BairroToJson(this);

  static List<Bairro> listFromJson(List<dynamic> json) {
    return json.map((value) => Bairro.fromJson(value)).toList();
  }

  static Map<String, Bairro> mapFromJson(Map<String, dynamic> json) {
    Map<String, Bairro> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Bairro.fromJson(value));
    }
    return map;
  }
}

