import 'package:get/get.dart';

class CarrinhoController extends GetxController{
  var selected = false.obs;
  var visible = false.obs;

  void trocaSelecao() {
    selected.value = !selected.value;

    if (selected.value)
      Future.delayed(Duration(milliseconds: 400)).then((value) => visible.value = !visible.value);
    else
      visible.value = !visible.value;

    print("selecao >>> ${selected.value}");
  }

}