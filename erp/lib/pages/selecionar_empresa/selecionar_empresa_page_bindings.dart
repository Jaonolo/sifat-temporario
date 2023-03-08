import 'package:get/get.dart';

import 'selecionar_empresa_page_controller.dart';

class SelecionarEmpresaPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelecionarEmpresaPageController());
  }
}
