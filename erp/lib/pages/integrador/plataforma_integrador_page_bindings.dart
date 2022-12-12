import 'package:erp/pages/integrador/plataforma_integrador_page_controller.dart';
import 'package:get/get.dart';

import 'package:erp/pages/plataforma/plataforma_page_controller.dart';

class PlataformaIntegradorPageBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> PlataformaIntegradorPageController());
  }
}