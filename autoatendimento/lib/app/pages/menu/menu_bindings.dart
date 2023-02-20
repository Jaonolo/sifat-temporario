import 'package:autoatendimento/app/pages/Menu/menu_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class  MenuPageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuController());
  }
}