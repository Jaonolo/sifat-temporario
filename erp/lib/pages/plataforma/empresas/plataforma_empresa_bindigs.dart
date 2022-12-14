import 'package:erp/pages/plataforma/empresas/plataforma_empresa_controller.dart';
import 'package:get/get.dart';



class PlataformaEmpresaBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PlataformaEmpresaController());
  }
}