import 'package:get/get.dart';

class EditarContratoIntegradorErpController extends GetxController {

  final indexController = 0.obs;
  void updateIndex(int newIndex) => indexController.value = newIndex;


  String _selectedValue = "Nao possui";
  get selectedValue => _selectedValue;

  void updateSelectedValue(String newValue) {
    _selectedValue = newValue;
    update();
  }

}
