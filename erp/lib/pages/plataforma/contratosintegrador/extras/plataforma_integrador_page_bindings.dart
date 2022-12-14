import 'package:erp/pages/plataforma/contratosintegrador/extras/plataforma_integrador_page_controller.dart';
import 'package:get/get.dart';

class PlataformaIntegradorPageBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> PlataformaIntegradorPageController());
  }
}