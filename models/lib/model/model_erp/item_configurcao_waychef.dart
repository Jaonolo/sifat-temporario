part of openapi.api;

@JsonSerializable()
class ItemConfiguracaoWaychef {
  String? id;
  String? nome;
  String? tipoItem;
  TipoitemContratoWaychefEnum? tipoItemContratoWaychef;

  //generico
  List<IntegradorPodeComercializarItemDTO>?
      integradorPodeComercializarItemDTOLista;

  ItemConfiguracaoWaychef();

  @override
  String toString() {
    return 'ItemConfiguracaoWaychef{id: $id, nome: $nome, tipoItem: $tipoItem, '
        'tipoItemContratoWaychef: $tipoItemContratoWaychef, integradorPodeComercializarItemDTOLista: $integradorPodeComercializarItemDTOLista}';
  }

  factory ItemConfiguracaoWaychef.fromJson(Map<String, dynamic> json) =>
      _$ItemConfiguracaoWaychefFromJson(json);

  Map<String, dynamic> toJson() => _$ItemConfiguracaoWaychefToJson(this);

  static List<ItemConfiguracaoWaychef> listFromJson(List<dynamic> json) {
    return json
        .map((value) => ItemConfiguracaoWaychef.fromJson(value))
        .toList();
  }

  static Map<String, ItemConfiguracaoWaychef> mapFromJson(
      Map<String, dynamic> json) {
    Map<String, ItemConfiguracaoWaychef> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
          map[key] = ItemConfiguracaoWaychef.fromJson(value));
    }
    return map;
  }
}

//
//
//
//
//
// part of openapi.api;
//
// @JsonSerializable()
// class ItemConfiguracaoWaychef {
//   String? id;
//   String? descricao;
//   String? tipoItem;
//   String? tipoItemContratoWaychef;
//   //generico
//   List<IntegradorPodeComercializarItemDTO>? integradorPodeComercializarItemDTOLista;
//
//   //Construtor
//   ItemConfiguracaoWaychef({
//     required this.id,
//     required this.descricao,
//     required this.tipoItem,
//     required this.tipoItemContratoWaychef});
//
//
//   //toMap é o método que pega o objeto
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'descricao': descricao,
//       'tipoItem': tipoItem,
//       'tipoItemContratoWaychef': tipoItemContratoWaychef,
//       // 'cursos': cursos?.map((curso) => curso.toMap()).toList(),
//       'integradorPodeComercializarItemDTOLista': integradorPodeComercializarItemDTOLista?.map((integradorPodeComercializarItemDTOList) => integradorPodeComercializarItemDTOList.toMap()).toList(),
//     };
//   }
//
//
//   // fromMap() é um CONSTRUTOR ele vai pegar um MAP e transforma em um objeto telefone
//   factory ItemConfiguracaoWaychef.fromMap(Map<String, dynamic> map) {
//     return ItemConfiguracaoWaychef(
//       id: map['id'],
//       descricao: map['descricao'],
//       tipoItem: map['tipoItem'],
//       tipoItemContratoWaychef: map['tipoItemContratoWaychef'],
//       // integradorPodeComercializarItemDTOLista: map['integradorPodeComercializarItemDTOList'].map<IntegradorPodeComercializarItemDTO>((IntegradorPodeComercializarItemDTOListMap) => IntegradorPodeComercializarItemDTO.fromMap(IntegradorPodeComercializarItemDTOListMap)).toList(), // curso é uma lista
//     );
//   }
//
//
//   // toJson() é um método que retorna uma String json do meu objeto Telefone
//   String toJson() => jsonEncode(toMap());
//
//
//   // fromJson() é um método que baseado em uma String json retorna um objeto telefone
//   factory ItemConfiguracaoWaychef.fromJson(String json) => ItemConfiguracaoWaychef.fromMap(jsonDecode(json));
//
//
//   static List<ItemConfiguracaoWaychef> listFromJson(List<dynamic> json) {
//     print(json);
//     for (var value in json) {
//       var lista = ItemConfiguracaoWaychef.fromMap(value);
//       print(lista.toJson());
//     }
//
//     return json.map((value) => ItemConfiguracaoWaychef.fromMap(value)).toList();
//   }
//
//
//   @override
//   String toString() {
//     return 'ItemConfiguracaoWaychef{id: $id, descricao: $descricao, tipoItem: $tipoItem, tipoItemContratoWaychef: $tipoItemContratoWaychef, integradorPodeComercializarItemDTOLista: $integradorPodeComercializarItemDTOLista}';
//   }
// }
//
//
//
