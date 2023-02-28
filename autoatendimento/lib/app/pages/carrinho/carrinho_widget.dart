import 'package:flutter/material.dart';
import 'carrinho_component.dart';

class CarrinhoWidget extends StatelessWidget with CarrinhoComponent {
  CarrinhoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initialize(context);

    return body();
  }
}
