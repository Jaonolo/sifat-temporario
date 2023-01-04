import 'package:get/get.dart';

import '../../../../widgets/utils/constantes.dart';

class ComissaoPlataformaPageController extends GetxController {


  final _planoSelecionado = Constantes.PLANOS[0].obs;
  get planoSelecionado => _planoSelecionado.value;
  void setPlanoSelecionado(String value) {
    _planoSelecionado.value = value;
  }


  final indexController = 0.obs;
  void updateIndex(int newIndex) => indexController.value = newIndex;

  // int indexController = 0;
  // void mudaindex(int index){
  //   indexController = index;
  // }


  String _selectedValue = "Nao possui";
  get selectedValue => _selectedValue;

  void updateSelectedValue(String newValue) {
    _selectedValue = newValue;
    update();
  }
}

class ComissaoPlataformaPageBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> ComissaoPlataformaPageController());
  }
}
