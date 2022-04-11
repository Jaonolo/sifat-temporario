part of openapi.api;

class EstacaoTrabalhoSimplificadoDTO {

  int? id;

  String? descricao;

  EstacaoTrabalhoSimplificadoDTO();

  @override
  String toString() {
    return 'EstacaoTrabalhoSimplificadoDTO[id=$id, descricao=$descricao, ]';
  }

  EstacaoTrabalhoSimplificadoDTO.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (descricao != null)
      json['descricao'] = descricao;
    return json;
  }

  static List<EstacaoTrabalhoSimplificadoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => EstacaoTrabalhoSimplificadoDTO.fromJson(value))
        .toList();
  }

  static Map<String, EstacaoTrabalhoSimplificadoDTO> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, EstacaoTrabalhoSimplificadoDTO>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EstacaoTrabalhoSimplificadoDTO.fromJson(value));
    }
    return map;
  }
}

