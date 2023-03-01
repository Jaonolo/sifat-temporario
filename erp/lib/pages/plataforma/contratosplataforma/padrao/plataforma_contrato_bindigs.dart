

import 'package:erp/pages/plataforma/contratosplataforma/padrao/plataforma_contrato_controller.dart';
import 'package:get/get.dart';

class PlataformaContratoBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>PlataformaContratoController());
  }
}