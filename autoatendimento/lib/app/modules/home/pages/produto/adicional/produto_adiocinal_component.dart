import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/widgets/card_produto_menu.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/widgets/palco_produto_generico.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProdutoAdicionalComponent {
  late BuildContext context;
  final HomeController homeController = Modular.get();
  final VendaController vendaController = Modular.get();
  final ProdutoAdicionalController controller = Modular.get();
  late Orientation orientation;

  initialize(BuildContext context) {
    this.context = context;
    orientation = MediaQuery
        .of(context)
        .orientation;
  }

  Widget body() {
    return PalcoProdutoGenerico(controller.produtoCarrinho, _adicionalConteudo());
  }

  Widget _adicionalConteudo() {
    return Row(
      children: [
        Expanded(flex: 14, child: Container()),
        Expanded(
          flex: 140,
          child: Column(children: [
            Expanded(flex: 20, child: _imagem()),
            Expanded(
                flex: 5,
                child: (controller.produtoCarrinho.notaItem
                    .produtoEmpresa!.produto!.detalhes !=
                    null)
                    ? _detalhes()
                    : Container()),
            const Expanded(child: SizedBox()),
            Expanded(flex: 60, child: _pageViewBuilder())
          ]),
        ),
        Expanded(flex: 14, child: Container()),
      ],
    );
  }

  Widget _imagem() {
    return SizedBox(
      height: FontUtils.h1(context) * 3,
      child: (controller.produtoCarrinho.notaItem.produtoEmpresa!.produto!
          .arquivoPrincipal() !=
          null)
          ? Image.network(
        controller.produtoCarrinho.notaItem.produtoEmpresa!.produto!
            .arquivoPrincipal()!
            .link!,
        fit: BoxFit.fill,
      )
          : Image.asset(
        'assets/no-image.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _detalhes() {
    return Wrap(children: [
      Text(
          controller.produtoCarrinho.notaItem.produtoEmpresa!.produto!.detalhes!
              .toUpperCase(),
          style: TextStyle(fontSize: FontUtils.h4(context)))
    ]);
  }

  Widget _pageViewBuilder() {
    return PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        itemCount: controller
            .produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus.length,
        onPageChanged: (index) => controller.atualizaMenus(index),
        itemBuilder: (BuildContext context, int index) {
          return CardProdutoMenu(controller.produtoMenu!,
              controller.anteriorMenu, controller.proximoMenu);
        });
  }
}
