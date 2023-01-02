import 'package:get/get.dart';

class ComissaoPlataformaPageController extends GetxController {

  String _selectedValue = "Nao possui";

  get selectedValue => _selectedValue;



  void updateSelectedValue(String newValue) {
    _selectedValue = newValue;
    update();
  }
  // String _selectedValue = "Nao possui".obs as String;
  // get selectedValue => _selectedValue;
  //
  // void updateSelectedValue(String newValue) {
  //   _selectedValue = newValue;
  //   update();
  // }

  // final selectedValue = "Nao possui".obs;

}





class ComissaoPlataformaPageBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ComissaoPlataformaPageController());
  }
}
