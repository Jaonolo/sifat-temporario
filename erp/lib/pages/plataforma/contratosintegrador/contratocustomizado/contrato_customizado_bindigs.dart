import 'package:get/get.dart';

import 'contrato_customizado_controller.dart';



class ContratoCustomizadoBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ContratoCustomizadoController());
  }
}