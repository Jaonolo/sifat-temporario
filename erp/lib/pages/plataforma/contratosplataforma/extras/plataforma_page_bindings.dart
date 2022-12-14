import 'package:erp/pages/plataforma/contratosplataforma/extras/plataforma_page_controller.dart';
import 'package:get/get.dart';



class PlataformaPageBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PlataformaPageController());
  }
}