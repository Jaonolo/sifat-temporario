import 'package:get/get.dart';
import 'package:models/model/models.dart';

class CarrinhoController extends GetxController{
  var selected = false.obs;
  var visible = false.obs;
  var count = 1.obs;
  RxList<NotaItem> list = <NotaItem>[].obs;


  void quantidadeDeItens() {
    count++;
    update();
    print(count);

    count--;
    update();
    print(count);
  }

  void trocaSelecao() {
    selected.value = !selected.value;

    if (selected.value)
      Future.delayed(Duration(milliseconds: 180)).then((value) => visible.value = !visible.value);
    else
      visible.value = !visible.value;

    print("selecao >>> ${selected.value}");
  }

  void badgeCarrinho() {
    count++;
    update();
    print(count);

    count--;
    update();
    print(count);
  }

  void adicionarProduto(NotaItem produto) {
    list.add(produto);
  }

  void deletarProduto(NotaItem notaItem) {
    list.remove(notaItem);
  }
  void addProduto(NotaItem notaItem) {
    int a = 0;
    list.forEach((element) {

      if(a == 0) {
        a++;
        element.quantidade!.somar(BigDecimal.ONE());
      }
    });
  }

  void deletarListaProduto () {
    list.clear();
  }
}
