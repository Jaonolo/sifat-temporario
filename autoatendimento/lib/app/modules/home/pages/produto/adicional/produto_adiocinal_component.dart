import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/widgets/card_produto_menu.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:utils/utils/nota_item_utils.dart';

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
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(),
        ),
        Expanded(
          flex: 96,
          child: _card(),
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
      ],
    );
  }

  Widget _card() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 90,
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Expanded(flex: 13, child: _cabecalhoCard()),
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  flex: 74,
                  child: _adicionalConteudo(),
                ),
                Expanded(flex: 13, child: _rodapeCard()),
                const Expanded(flex: 2, child: SizedBox()),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }

  Widget _cabecalhoCard() {
    return Row(
      children: [
        Expanded(
            flex: 20,
            child: Observer(builder: (_) {
              return BotaoSetaVoltar(
                function: (controller.anteriorMenu == null)
                    ? () {
                  homeController.removePalco();
                  homeController.habilitarCarrinho = false;
                }
                    : () => controller.anterior(),
              );
            })),
        Expanded(
          flex: 70,
          child: Center(child: _adicionalTitulo()),
        ),
        Expanded(flex: 10, child: Container()),
      ],
    );
  }

  Widget _adicionalTitulo() {
    return InkWell(
      //################# DEBUG ################################
      // onTap: () {
      //   print('------- ${controller.produtoCarrinho.notaItem.descricao}  + quantidade ${controller.produtoCarrinho.notaItem.quantidade}-------');
      //   controller.produtoCarrinho.notaItem.subitens.forEach((element) {
      //     print('-- ${element.descricao}');
      //     element.subitens.forEach((itemCombo) {
      //       print(
      //           '---- ${itemCombo.descricao}  |qtde: ${itemCombo.quantidade}|unitario: ${itemCombo.precoUnitario}|total: ${itemCombo.precoTotal}|');
      //     });
      //   });
      // },
      child: Text(
        controller.produtoCarrinho.notaItem.descricao!,
        style: TextStyle(
            fontSize: orientation == Orientation.landscape
                ? FontUtils.h2(context)
                : FontUtils.h1(context) * 0.8),
      ),
    );
  }

  //monta os opcionais ou extras chama o CardMenu para escoher ente o CardMenuComponent ou CardMenuComponentObservacao
  Widget _adicionalConteudo() {
    return orientation == Orientation.landscape
        ? Row(
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
    )
        : Row(
      children: [
        Expanded(flex: 14, child: Container()),
        Expanded(
          flex: 72,
          child: Column(children: [
            Expanded(flex: 35, child: _imagem()),
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

  Widget _rodapeCard() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                Expanded(child: _txtSubTotal()),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const Expanded(flex: 20, child: SizedBox()),
              Expanded(flex: 60, child: _botaoNavegacao()),
              const Expanded(flex: 20, child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _botaoNavegacao() {
    return Observer(builder: (_) {
      if (controller.proximoMenu != null) {
        return BotaoPrimario(
          descricao: controller.proximoMenu!.descricao!.toUpperCase(),
          function: () => controller.proximo(),
          largura: FontUtils.h2(context) * 20,
          borderRadius: 10.0,
          iconData: Icons.arrow_forward,
        );
      } else {
        return BotaoPrimario(
          descricao: (controller.produtoCarrinho.notaItem.tipo == "ITEM_COMBO")
              ? "ADICIONAR"
              : 'ADICIONAR AO CARRINHO',
          function: () => controller.adicionarAoCarrinho(),
          altura: FontUtils.h2(context) * 1.01,
          largura: FontUtils.h2(context) * 10,
        );
      }
    });
  }

  Widget _txtSubTotal() {
    return Observer(builder: (_) {
      return orientation == Orientation.landscape
          ? Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text(
                  'SUBTOTAL R\$ ${controller.produtoCarrinho.notaItem
                      .precoTotal!.somar(NotaItemUtils.calcularAdicionais(
                      controller.produtoCarrinho.notaItem)).toStringAsFixed(
                      2)}',
                  softWrap: false,
                  style: TextStyle(fontSize: FontUtils.h2(context)))),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'SUBTOTAL R\$ ${controller.produtoCarrinho.notaItem.precoTotal!
                  .somar(NotaItemUtils.calcularAdicionais(
                  controller.produtoCarrinho.notaItem)).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: FontUtils.h3(context),
              ),
            ),
          ),
        ],
      );
    });
  }
}
