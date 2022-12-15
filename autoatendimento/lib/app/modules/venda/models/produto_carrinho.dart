import 'package:autoatendimento/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

import '../venda_controller.dart';

part 'produto_carrinho.g.dart';

class ProdutoCarrinho = _ProdutoCarrinhoBase with _$ProdutoCarrinho;

abstract class _ProdutoCarrinhoBase with Store {
  VendaController vendaController = Modular.get();
  AppController appController = Modular.get();

  @observable
  NotaItem notaItem;

  int? index;

  @action
  void adicionar() {
    NotaItem item = notaItem.clone();
    item.quantidade = item.quantidade!.somar(BigDecimal.ONE());
    item.subitens.forEach((element) {
      NotaItemUtils.atualizaQuantidadeSubitens(element,
          item.quantidade!.subtrair(BigDecimal.ONE()), item.quantidade!);
    });
    NotaItemUtils.atualizaTotais(item, (idProdutoEmpresa){
      return appController.mapProdutos[idProdutoEmpresa];
    });

    notaItem = item;
    vendaController.atualizaTotais();
  }

  @action
  void remover({Function? ultimoPedido}) {
    NotaItem item = notaItem.clone();
    item.quantidade = item.quantidade!.subtrair(BigDecimal.ONE());
    item.subitens.forEach((element) {
      NotaItemUtils.atualizaQuantidadeSubitens(
          element, item.quantidade!.somar(BigDecimal.ONE()), item.quantidade!);
    });

    NotaItemUtils.atualizaTotais(item, (idProdutoEmpresa){
      return appController.mapProdutos[idProdutoEmpresa];
    });

    if (item.quantidade!.compareTo(BigDecimal.ONE()) < 0) {
      //se for o ultimo chama a funcao para aparecer a dialog
      ultimoPedido!(index);
      return;
    }
    notaItem = item;
    vendaController.atualizaTotais();
  }

  _ProdutoCarrinhoBase(this.notaItem);
}