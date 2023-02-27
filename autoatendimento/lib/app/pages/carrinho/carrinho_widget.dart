import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'carrinho_component.dart';
import 'carrinho_controller.dart';

class CarrinhoWidget extends StatelessWidget with CarrinhoComponent {
  CarrinhoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initialize(context);

    return body();
  }
}
