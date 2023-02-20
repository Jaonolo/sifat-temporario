import 'package:autoatendimento/app/pages/produto/produto_simples/produto_simples_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProdutoSimplesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProdutoSimplesController());
  }
}