

import 'package:get/get.dart';

class PlataformaEmpresaController extends GetxController {
  final indexController = 0.obs;
  void updateIndex(int newIndex) => indexController.value = newIndex;

}
