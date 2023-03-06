import 'package:get/get.dart';

import 'analise_page_controller.dart';

class AnalisePageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnalisePageController());
  }
}
