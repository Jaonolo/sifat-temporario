import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'produto_simples_component.dart';
import 'produto_simples_controller.dart';

class ProdutoSimplesPage extends StatelessWidget with ProdutoSimplesComponent {
  ProdutoSimplesPage({Key? key}) : super(key: key);

  final controller = Get.put(ProdutoSimplesController());

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return Scaffold(body: body());
  }
}
