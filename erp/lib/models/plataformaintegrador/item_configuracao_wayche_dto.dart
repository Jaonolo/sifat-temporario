import 'dart:convert';

import '../integrador_pode_comercializar_item_dto.dart';


// part of openapi.api;

// @JsonSerializable()

class ItemConfiguracaoWaychefDTO {
  String? id;
  String? nome;
  String? detalhes;
  String? tipoItem;
  String? tipoItemContratoWaychef;
  //generico
  List<IntegradorPodeComercializarItemDTO>? integradorPodeComercializarItemDTOLista;


  ItemConfiguracaoWaychefDTO({
    required this.id,
    required this.nome,
    required this.detalhes,
    required this.tipoItem,
    required this.tipoItemContratoWaychef,
  });


  //toMap é o método que pega o objeto e transforma em Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'detalhes': detalhes,
      'tipoItem': tipoItem,
      'tipoItemContratoWaychef': tipoItemContratoWaychef,
      'integradorPodeComercializarItemDTOLista': integradorPodeComercializarItemDTOLista?.map((integradorPodeComercializarItemDTOList) => integradorPodeComercializarItemDTOList.toMap()).toList(),

    };
  }

  // fromMap() é um CONSTRUTOR ele vai pegar um MAP e transforma em um objeto telefone
  factory ItemConfiguracaoWaychefDTO.fromMap(Map<String, dynamic> map) {
    return ItemConfiguracaoWaychefDTO(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      detalhes: map['detalhes'] ?? '',
      tipoItem: map['tipoItem'] ?? '',
      tipoItemContratoWaychef: map['tipoItemContratoWaychef'] ?? '',
    );
  }

  // toJson() é um método que retorna uma String json do meu objeto Telefone
  String toJson() => jsonEncode(toMap());


// fromJson() é um método que baseado em uma String json retorna um objeto telefone
  factory ItemConfiguracaoWaychefDTO.fromJson(String json) => ItemConfiguracaoWaychefDTO.fromMap(jsonDecode(json));



  static List<ItemConfiguracaoWaychefDTO> listFromJson(List<dynamic> json) {
    print(json);
    for (var value in json) {
      var wenderson = ItemConfiguracaoWaychefDTO.fromMap(value);
      print(wenderson.toJson());
    }

    return json.map((value) => ItemConfiguracaoWaychefDTO.fromMap(value)).toList();
  }

  @override
  String toString() {
    return 'ItemConfiguracaoWaychefDTO{id: $id, nome: $nome, detalhes: $detalhes, tipoItem: $tipoItem, tipoItemContratoWaychef: $tipoItemContratoWaychef, integradorPodeComercializarItemDTOLista: $integradorPodeComercializarItemDTOLista}';
  }

// @override
  // String toString() {
  //   return 'IntegradorPodeComercializarItemDTO{id: $id, idEmpresa: $idEmpresa, idItemConfiguracaoWaychef: $idItemConfiguracaoWaychef}';
  // }
}

