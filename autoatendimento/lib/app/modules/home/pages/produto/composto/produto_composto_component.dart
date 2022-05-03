import 'package:autoatendimento/app/modules/home/pages/produto/card_produto_menu.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/controller/produto_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/palco_produto_generico.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/revisao/card_revisao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProdutoComposotCompement{
  late BuildContext context;
  final ProdutoController controller = Modular.get();

  initialize(BuildContext context) {
    this.context = context;
  }

  Widget body() {
    return PalcoProdutoGenerico(controller.produtoCarrinho, _pageView());
  }

  //pageView com os menus do produto e uma pageView a mais com a revisao
  Widget _pageView() {
    return PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        itemCount: (controller.produtoCarrinho.notaItem.produtoEmpresa!.produto!
            .menus.length + 1),
        itemBuilder: (BuildContext context, int index) {
          controller.atualizaMenus(index);
          if (controller.produtoMenu != null) {
            return _pageViewMenu(index);
          } else {
            return CardRevisao();
          }
        });
  }
  /*
   * MENUS
   */

  //pageView com o menus do combo
  Widget _pageViewMenu(int index) {
    return Column(
      children: [
        Expanded(
          child: CardProdutoMenu(controller.produtoMenu!,
              controller.anteriorMenu, controller.proximoMenu),
        ),
      ],
    );
  }

}