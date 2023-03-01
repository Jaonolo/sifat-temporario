import 'package:autoatendimento/app/pages/pedido_viagem/pedido_viagem_controller.dart';
import 'package:get/get.dart';


class PedidoViagemPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PedidoViagemController());
  }
}
