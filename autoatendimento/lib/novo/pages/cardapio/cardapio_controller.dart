import 'package:get/get.dart';

class CardapioController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
    print(">>>> ${count.value}");
  }
}
