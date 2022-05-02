import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/cards_produtos//card_produto_menu.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/controller/produto_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/palco_produto_generico.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

class ProdutoComboComponent {
  late BuildContext context;
  final AppController appController = Modular.get();
  final HomeController homeController = Modular.get();
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
            return _pageViewRevisao();
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
            flex: 8,
            child: Text("${(index + 1)}º Passo: ",
                style: TextStyle(
                    fontSize: FontUtils.h2(context),
                    color: DefaultTheme.accentColor))),
        Expanded(
          flex: 98,
          child: CardProdutoMenu(controller.produtoMenu!,
              controller.anteriorMenu, controller.proximoMenu),
        ),
      ],
    );
  }

  /*
   * REVISÃO
   */

  //pageView contendo a revisao do combo
  Widget _pageViewRevisao() {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: Text("REVISÃO",
                style: TextStyle(fontSize: FontUtils.h2(context)))),
        Expanded(flex: 92, child: _listViewRevisao()),
      ],
    );
  }

  //tela de revisao compartilhada
  Widget _listViewRevisao() {
    List<NotaItem> itensVendidos =
        NotaItemUtils.getItensCombo(controller.produtoCarrinho.notaItem);

    return Column(
      children: [
        Expanded(
          flex: 100,
          child: Card(
            elevation: 5,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: itensVendidos.length,
              itemBuilder: (c, index) {
                NotaItem nota = itensVendidos[index];
                return _cardNotaItemRevisao(nota);
              },
            ),
          ),
        ),
        Expanded(child: Container()),
        Center(
          child: Text(
            'TOTAL R\$ ${NotaItemUtils.getSubtotal(controller.produtoCarrinho.notaItem).toStringAsFixed(2)} ',
            style: TextStyle(fontSize: FontUtils.h2(context)),
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }

  //card revisao com todos os item escolhidos do combo
  Widget _cardNotaItemRevisao(NotaItem subItens) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: Text(
                    '${subItens.quantidade} UN',
                    style: TextStyle(fontSize: FontUtils.h3(context)),
                  ),
                )),
            Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    subItens.descricao!.toUpperCase(),
                    style: TextStyle(fontSize: FontUtils.h3(context)),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'R\$ ${subItens.precoTotal!.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: FontUtils.h3(context)),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
