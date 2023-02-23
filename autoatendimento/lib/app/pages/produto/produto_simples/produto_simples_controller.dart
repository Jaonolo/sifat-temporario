import 'package:get/get.dart';

class ProdutoSimplesController extends GetxController {
  var selected = false.obs;
  var count = 0.obs;
  var visible = false.obs;

  void selecionarQTD() {
    count++;
    update();
    print(count);

    count--;
    update();
    print(count);
  }

  void qtdItens() {
    selected.value = !selected.value;
    if (selected.value);
    else visible.value = !visible.value;
  }
}
