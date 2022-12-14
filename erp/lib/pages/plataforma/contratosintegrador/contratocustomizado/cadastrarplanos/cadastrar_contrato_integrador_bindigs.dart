
import 'package:get/get.dart';

import 'cadastrar_contrato_integrador_controller.dart';

class CadastrarContratoIntegradorBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>CadastrarContratoIntegradorController());
  }
}