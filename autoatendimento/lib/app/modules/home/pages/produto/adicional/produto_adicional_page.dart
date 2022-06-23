import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adiocinal_component.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:autoatendimento/app/modules/venda/produto_carrinho_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

class ProdutoAdicionalPage extends StatefulWidget {
  ProdutoCarrinho produtoCarrinho;

  ProdutoAdicionalPage(this.produtoCarrinho) {
    atualizaController();
  }

  atualizaController() {
    ProdutoAdicionalController controller = Modular.get();

    controller.produtoCarrinhoOriginal = produtoCarrinho;
    ProdutoCarrinho produtoCarrinhoClone =
        ProdutoCarrinhoUtils.clone(this.produtoCarrinho);

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
    controller.atualizaMenus(0);
    controller.index = 0;
  }

  _ProdutoAdicionalPageState createState() => _ProdutoAdicionalPageState();
}

class _ProdutoAdicionalPageState extends State<ProdutoAdicionalPage>
    with ProdutoAdicionalComponent {
  @override
  void initState() {
    controller.pageController = PageController(initialPage: controller.index);
  }

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return body();
  }
}
