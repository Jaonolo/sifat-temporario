import 'package:autoatendimento/app/modules/home/pages/produto/composto/produto_composto_component.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/controller/produto_controller.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:autoatendimento/app/modules/venda/produto_carrinho_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

// ignore: must_be_immutable
class ProdutoCompostoPage extends StatefulWidget {
  ProdutoCarrinho produtoCarrinho;

  ProdutoCompostoPage(this.produtoCarrinho, {Key? key}) : super(key: key) {
    atualizaController();
  }

  atualizaController() {
    ProdutoController controller = Modular.get();
    controller.tipoPacote =  produtoCarrinho.notaItem.produtoEmpresa!.produto!.pacote;

    controller.produtoCarrinhoOriginal = produtoCarrinho;
    ProdutoCarrinho produtoCarrinhoClone =
    ProdutoCarrinhoUtils.clone(produtoCarrinho);

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
  }

  @override
  State<ProdutoCompostoPage> createState() => _ProdutoCompostoPageState();
}

class _ProdutoCompostoPageState extends State<ProdutoCompostoPage> with ProdutoComposotCompement{
  @override
  void initState() {
    controller.pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return body();
  }
}
