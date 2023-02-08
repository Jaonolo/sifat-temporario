import 'package:autoatendimento/novo/pages/widget/carrinho/carrinho_controller.dart';
import 'package:flutter/material.dart';

import 'carrinho_component.dart';
import 'package:get/get.dart';

class CarrinhoWidget extends StatelessWidget with CarrinhoComponent {
  CarrinhoWidget({Key? key}) : super(key: key);

  final controller = Get.put(CarrinhoController());

  @override
  Widget build(BuildContext context) {
    initialize(context);

    return body();
  }
}
