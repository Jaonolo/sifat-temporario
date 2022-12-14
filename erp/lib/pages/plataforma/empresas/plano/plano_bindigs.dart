
import 'package:erp/pages/plataforma/empresas/plano/plano_controller.dart';
import 'package:get/get.dart';



class PlanoBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PlanoController());
  }
}