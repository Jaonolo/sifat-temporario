

import 'package:get/get.dart';

import 'contratos_integrador_controller.dart';

class ContratosIntegradorBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ContratosIntegradorController());
  }
}