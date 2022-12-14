import 'package:get/get.dart';

import 'comissao_controller.dart';

class ComissaoBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ComissaoController());
  }
}
