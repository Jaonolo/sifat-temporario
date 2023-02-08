import 'package:autoatendimento/novo/pages/cardapio/cardapio_controller.dart';
import 'package:autoatendimento/novo/pages/widget/carrinho/carrinho_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardapioComponent {
  final CardapioController controller = Get.find();
  late BuildContext context;
  late double _height;
  late double _width;
  late var _orientation;

  initialize(BuildContext context) {
    this.context = context;

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _orientation = MediaQuery.of(context).orientation;
  }

  body() {
    print("Recosntuiu CORPO");
    return SafeArea(
      child: Stack(children: [
        Positioned(left: 0, child: cardapio()),
        Positioned(right: 0, child: CarrinhoWidget()),
      ]),
    );
  }

  cardapio() {
    return Padding(
      padding: EdgeInsets.only(right: _width / 10),
      child: Container(
        height: _height,
        width: _width  - _width / 10,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _orientation == Orientation.portrait ? 2 : 4,
            ),
            itemCount: 300,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.amber,
                child: Center(child: Text('$index')),
              );
            }
        ),
      ),
    );
  }
}
