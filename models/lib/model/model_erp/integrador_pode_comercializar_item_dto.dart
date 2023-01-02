part of openapi.api;

@JsonSerializable()
class IntegradorPodeComercializarItemDTO {
  String? id;
  int? idEmpresa;
  String? idItemConfiguracaoWaychef;

  IntegradorPodeComercializarItemDTO();

    @override
  String toString() {
    return 'IntegradorPodeComercializarItemDTO[id: $id, idEmpresa: $idEmpresa, idItemConfiguracaoWaychef: $idItemConfiguracaoWaychef]';
  }

  factory IntegradorPodeComercializarItemDTO.fromJson(Map<String, dynamic> json) =>
      _$IntegradorPodeComercializarItemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$IntegradorPodeComercializarItemDTOToJson(this);

  static List<IntegradorPodeComercializarItemDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => IntegradorPodeComercializarItemDTO.fromJson(value)).toList();
  }

  static Map<String, IntegradorPodeComercializarItemDTO> mapFromJson(Map<String, dynamic> json) {
    Map<String, IntegradorPodeComercializarItemDTO> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = IntegradorPodeComercializarItemDTO.fromJson(value));
    }
    return map;
  }
}

//
//
//
//
// part of openapi.api;
//
// @JsonSerializable()
// class IntegradorPodeComercializarItemDTO {
//   String? id;
//   int? idEmpresa;
//   String? idItemConfiguracaoWaychef;
//
//
//   IntegradorPodeComercializarItemDTO({
//       required this.id,
//       required this.idEmpresa,
//       required this.idItemConfiguracaoWaychef,
//   });
//
//
//   //toMap é o método que pega o objeto e transforma em Map<String, dynamic>
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'idEmpresa': idEmpresa,
//       'idItemConfiguracaoWaychef': idItemConfiguracaoWaychef,
//     };
//   }
//
//   // fromMap() é um CONSTRUTOR ele vai pegar um MAP e transforma em um objeto telefone
//   factory IntegradorPodeComercializarItemDTO.fromMap(Map<String, dynamic> map) {
//     return IntegradorPodeComercializarItemDTO(
//       id: map['id'] ?? '',
//       idEmpresa: map['idEmpresa'] ?? 0,
//       idItemConfiguracaoWaychef: map['idItemConfiguracaoWaychef'] ?? '',
//     );
//   }
//
//   // toJson() é um método que retorna uma String json do meu objeto Telefone
//   String toJson() => jsonEncode(toMap());
//
//
// // fromJson() é um método que baseado em uma String json retorna um objeto telefone
//   factory IntegradorPodeComercializarItemDTO.fromJson(String json) => IntegradorPodeComercializarItemDTO.fromMap(jsonDecode(json));
//
//   @override
//   String toString() {
//     return 'IntegradorPodeComercializarItemDTO{id: $id, idEmpresa: $idEmpresa, idItemConfiguracaoWaychef: $idItemConfiguracaoWaychef}';
//   }
// }
//
