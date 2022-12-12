import 'package:get/get.dart';

import 'package:erp/pages/plataforma/plataforma_page_controller.dart';

class PlataformaPageBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PlataformaPageController());
  }
}