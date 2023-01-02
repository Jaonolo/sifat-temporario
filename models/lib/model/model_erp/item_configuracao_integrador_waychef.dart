part of openapi.api;

@JsonSerializable()
class ItemConfiguracaoIntegradorWaychef {
  String? id;
  double? valor;
  bool? podeComercializar;
  int? idEmpresa;
  String? detalhes;
  String? idItemConfiguracaoWaychef;
  //generico
  // List<ItemConfiguracaoWaychefDTO>? itemConfiguracaoWaychefDTOLista;
  late ItemConfiguracaoWaychefDTO itemConfiguracaoWaychefDTO;

  ItemConfiguracaoIntegradorWaychef();

  @override
  String toString() {
    return 'ItemConfiguracaoIntengradorWaychef[id: $id, valor: $valor, podeComercializar: $podeComercializar, "detalhes": $detalhes, idEmpresa: $idEmpresa, idItemConfiguracaoWaychef: $idItemConfiguracaoWaychef, itemConfiguracaoWaychefDTO: $itemConfiguracaoWaychefDTO]';
  }


  factory ItemConfiguracaoIntegradorWaychef.fromJson(Map<String, dynamic> json) =>
      _$ItemConfiguracaoIntegradorWaychefFromJson(json);

  Map<String, dynamic> toJson() => _$ItemConfiguracaoIntegradorWaychefToJson(this);

  static List<ItemConfiguracaoIntegradorWaychef> listFromJson(List<dynamic> json) {
    return json.map((value) => ItemConfiguracaoIntegradorWaychef.fromJson(value)).toList();
  }

  static Map<String, ItemConfiguracaoIntegradorWaychef> mapFromJson(Map<String, dynamic> json) {
    Map<String, ItemConfiguracaoIntegradorWaychef> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ItemConfiguracaoIntegradorWaychef.fromJson(value));
    }
    return map;
  }
}


//
//
// part of openapi.api;
//
// @JsonSerializable()
// class ItemConfiguracaoIntegradorWaychef {
//
//   String? id;
//   double? valor;
//   bool? podeComercializar;
//   int? idEmpresa;
//   String? idItemConfiguracaoWaychef;
//   //generico
//   // List<ItemConfiguracaoWaychefDTO>? itemConfiguracaoWaychefDTOLista;
//   late ItemConfiguracaoWaychefDTO itemConfiguracaoWaychefDTO;
//
//
//   //Construtor
//   ItemConfiguracaoIntegradorWaychef({
//     required this.id,
//     required this.valor,
//     required this.podeComercializar,
//     required this.idEmpresa,
//     required this.idItemConfiguracaoWaychef,
//     required this.itemConfiguracaoWaychefDTO,
//     // required this.itemConfiguracaoWaychefDTOLista
//   });
//
//
//   //toMap é o método que pega o objeto
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'valor': valor,
//       'podeComercializar': podeComercializar,
//       'idEmpresa': idEmpresa,
//       'idItemConfiguracaoWaychef': idItemConfiguracaoWaychef,
//       'itemConfiguracaoWaychefDTO': itemConfiguracaoWaychefDTO.toMap(),
//       // 'cursos': cursos?.map((curso) => curso.toMap()).toList(),
//       // 'itemConfiguracaoWaychefDTOLista': itemConfiguracaoWaychefDTOLista?.map((itemConfiguracaoWaychefDTOList) => itemConfiguracaoWaychefDTOList.toMap()).toList(),
//     };
//   }
//
//
//   // fromMap() é um CONSTRUTOR ele vai pegar um MAP e transforma em um objeto telefone
//   factory ItemConfiguracaoIntegradorWaychef.fromMap(Map<String, dynamic> map) {
//     return ItemConfiguracaoIntegradorWaychef(
//       id: map['id'],
//       valor: map['valor'],
//       podeComercializar: map['podeComercializar'],
//       idEmpresa: map['idEmpresa'],
//       idItemConfiguracaoWaychef: map['idItemConfiguracaoWaychef'],
//       itemConfiguracaoWaychefDTO: ItemConfiguracaoWaychefDTO.fromMap(map['itemConfiguracaoWaychefDTO']),
//
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
//   factory ItemConfiguracaoIntegradorWaychef.fromJson(String json) => ItemConfiguracaoIntegradorWaychef.fromMap(jsonDecode(json));
//
//
//
//   static List<ItemConfiguracaoIntegradorWaychef> listFromJson(List<dynamic> json) {
//     print(json);
//     for (var value in json) {
//       var listaintegrador = ItemConfiguracaoIntegradorWaychef.fromMap(value);
//       print(listaintegrador.toJson());
//     }
//
//     return json.map((value) => ItemConfiguracaoIntegradorWaychef.fromMap(value)).toList();
//   }
//
//   @override
//   String toString() {
//     return 'ItemConfiguracaoIntengradorWaychef{id: $id, valor: $valor, podeComercializar: $podeComercializar, idEmpresa: $idEmpresa, idItemConfiguracaoWaychef: $idItemConfiguracaoWaychef, itemConfiguracaoWaychefDTO: $itemConfiguracaoWaychefDTO}';
//   }
// }