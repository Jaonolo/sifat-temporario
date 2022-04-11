import 'package:autoatendimento/app/modules/home/pages/produto/combo/produto_combo_component.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:autoatendimento/app/modules/venda/produto_carrinho_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';
import 'produto_combo_controller.dart';

class ProdutoComboPage extends StatefulWidget {
  final ProdutoCarrinho produtoCarrinho;
  final ProdutoComboController controller = Modular.get();

  ProdutoComboPage(this.produtoCarrinho) {
    atualizaController();
  }

  atualizaController() {
    controller.produtoCarrinhoOriginal = produtoCarrinho;
    ProdutoCarrinho produtoCarrinhoClone = ProdutoCarrinhoUtils.clone(
        produtoCarrinho);

    //Edição do item
    //caso tiver mais de uma unidade aparecer somente os itens de um pedido
    if (produtoCarrinho.notaItem.quantidade!.compareTo(BigDecimal.ONE()) > 0) {
      NotaItemUtils.atualizaQuantidadeSubitens(
          produtoCarrinhoClone.notaItem,
          controller.produtoCarrinhoOriginal.notaItem.quantidade!,
          BigDecimal.ONE());
      NotaItemUtils.atualizaTotais(produtoCarrinhoClone.notaItem);
    }

    controller.produtoCarrinho = produtoCarrinhoClone;
    controller.proximoMenu =
    produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus[0];
    controller.index = 0;
  }

  @override
  _ProdutoComboPageState createState() => _ProdutoComboPageState();
}

class _ProdutoComboPageState extends State<ProdutoComboPage>
    with ProdutoComboComponent {

  @override
  void initState() {
    controller.pageController = PageController(initialPage: controller.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return body();
  }
}
