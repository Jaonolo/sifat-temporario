import 'package:get/get.dart';

import 'plataforma_page_controller.dart';

class PlataformaPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlataformaPageController());
  }
}
