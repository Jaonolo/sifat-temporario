import 'package:erp/pages/plataforma/contratosintegrador/contrato/editar_contato_integrador_controller.dart';
import 'package:get/get.dart';


class EditarContratoIntegradorErpBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>EditarContratoIntegradorErpController());
  }
}