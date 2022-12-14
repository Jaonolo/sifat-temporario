import 'package:get/get.dart';

import 'extras_controller.dart';



class ExtrasBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ExtrasController());
  }
}