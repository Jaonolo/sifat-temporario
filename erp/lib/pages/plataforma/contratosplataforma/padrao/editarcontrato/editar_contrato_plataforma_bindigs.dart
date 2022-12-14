

import 'package:get/get.dart';

import 'editar_contrato_plataforma_controller.dart';

class EditarContratoPlataformaErpBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>EditarContratoPlataformaErpController());
  }
}