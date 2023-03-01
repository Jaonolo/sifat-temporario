import 'package:get/get.dart';

import 'login_page_controller.dart';

class LoginPageBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>LoginPageController());
  }
}