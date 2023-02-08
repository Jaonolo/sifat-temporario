import 'package:autoatendimento/novo/pages/cardapio/cardapio_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cardapio_controller.dart';

class CardapioPage extends StatelessWidget with CardapioComponent {
  CardapioPage({Key? key}) : super(key: key);

  final controller = Get.put(CardapioController());

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return Scaffold(body: body());
  }
}
