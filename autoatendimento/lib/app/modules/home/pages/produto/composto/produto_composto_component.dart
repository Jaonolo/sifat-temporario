import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/composto/produto_composto_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/mostra_quantidade.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/list_view_compomentes.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';
import 'package:utils/utils/string_utils.dart';

class ProdutoCompostoComponent {
  late BuildContext context;
  final ProdutoCompostoController controller = Modular.get();
  AppController appController= Modular.get();

  initialize(BuildContext context) {
    this.context = context;
  }

  body() {
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
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 90,
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Expanded(flex: 10, child: _cabecalhoCard()),
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  flex: 90,
                  child: _bordasPageView(),
                ),
              ],
            ),
          ),
        ),
        Expanded(flex: 1, child: Container()),
      ],
    );
  }

  Widget _cabecalhoCard() {
    return Row(
      children: [
        Expanded(
            flex: 20,
            child: BotaoSetaVoltar(function: () {
              if (controller.anteriorMenu == null) {
                controller.homeController.removePalco();
                controller.homeController.habilitarCarrinho = false;
              } else {
                controller.anterior();
              }
            })),
        Expanded(flex: 60, child: _txtTitulo()),
        Expanded(flex: 20, child: Container()),
      ],
    );
  }

  Widget _txtTitulo() {
    return InkWell(
      // onTap: () {
      //   print('------- ${controller.produtoCarrinho.notaItem.descricao} -------');
      //   controller.produtoCarrinho.notaItem.subitens.forEach((element) {
      //     print('-- ${element.descricao}');
      //     element.subitens.forEach((itemCombo) {
      //       print(
      //           '---- ${itemCombo.descricao}  |qtde: ${itemCombo.quantidade}|unitario: ${itemCombo.precoUnitario}|total: ${itemCombo.precoTotal}|');
      //     });
      //   });
      // },
      child: Text(
        controller.produtoCarrinho.notaItem.descricao!.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: FontUtils.h2(context) * 1.5),
      ),
    );
  }

  //monta os opcionais ou extras chama o CardMenu para escoher ente o CardMenuComponent ou CardMenuComponentObservacao
  Widget _bordasPageView() {
    return Row(
      children: [
        Expanded(flex: 8, child: const SizedBox()),
        Expanded(flex: 84, child: _pageView()),
        Expanded(flex: 8, child: const SizedBox()),
      ],
    );
  }

  //pageView com os menus do produto e uma pageView a mais com a revisao
  Widget _pageView() {
    return Container(
      child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          itemCount: (appController.mapProdutos[controller.produtoCarrinho.notaItem.idProdutoEmpresa]!
                  .produto!.menus.length +
              1),
          itemBuilder: (BuildContext context, int index) {
            controller.atualizaMenus(index);
            if (controller.produtoMenu != null) return _pageViewMenu(index);

            return _pageViewRevisao(index);
          }),
    );
  }

  Widget _botaoProximoMenu() {
    return Observer(
      builder: (_) {
        bool isMostraBtn = false;
        if (controller.produtoMenu == null) return const SizedBox();

        if (controller.produtoMenu!.quantidadeMinima == 0)
          isMostraBtn = true;
        else if (controller.produtoMenu!.quantidadeMinima! <=
            NotaItemUtils.quantidadeLancadaDoMenu(
                controller.produtoCarrinho.notaItem, controller.produtoMenu!))
          isMostraBtn = true;

        return Row(
          children: [
            if (isMostraBtn) ...[
              Expanded(
                child: BotaoPrimario(
                  descricao: (controller.proximoMenu == null)
                      ? "Revisão"
                      : controller.proximoMenu!.descricao!.toUpperCase(),
                  function: () => controller.proximo(),
                  altura: FontUtils.h2(context) * 1.01,
                  largura: FontUtils.h2(context) * 20,
                  borderRadius: 10.0,
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  /*
   * MENUS
   */

  //pageView com o menus do combo
  Widget _pageViewMenu(int index) {
    return Column(
      children: [
        Expanded(
            flex: 6,
            child: Text("${controller.produtoMenu?.descricao}",
                style: TextStyle(
                    fontSize: FontUtils.h2(context),
                    color: DefaultTheme.accentColor))),
        Expanded(flex: 4, child: MostraQuantidade(controller)),
        Expanded(
            flex: 74, child: _listViewComponentesMenu(controller.produtoMenu!)),
        Expanded(flex: 8, child: _botaoProximoMenu()),
        Expanded(flex: 2, child: SizedBox())
      ],
    );
  }

  //listView com os produtoMenuCompomente do menu do produto
  Widget _listViewComponentesMenu(ProdutoMenu produtoMenu) {
    produtoMenu.componentes.sort((o1, o2) {
      BigDecimal? valorCompomente1;
      BigDecimal? valorCompomente2;

      valorCompomente1 = o1.getValorComponente(
          controller.appController.estacaoTrabalho.idEmpresa!,
          controller.appController.tabelaPreco.id!);
      valorCompomente2 = o2.getValorComponente(
          controller.appController.estacaoTrabalho.idEmpresa!,
          controller.appController.tabelaPreco.id!);

      if (valorCompomente1 == null || valorCompomente2 == null)
        throw new Exception(
            'Valor do item igual a null na ordenação dos itens');

      return valorCompomente1.compareTo(valorCompomente2);
    });

    return ListViewCompomentes(controller);
  }

  /*
   * REVISÃO
   */

  //pageView contendo a revisao do combo
  Widget _pageViewRevisao(int index) {
    return Column(
      children: [
        Expanded(flex: 78, child: _listViewRevisao()),
        Expanded(
          flex: 8,
          child: BotaoPrimario(
            descricao: "ADICIONAR AO CARRINHO",
            function: () {
              controller.adicionarAoCarrinho();
            },
            altura: FontUtils.h2(context) * 1.01,
            largura: FontUtils.h2(context) * 10,
          ),
        ),
        Expanded(flex: 2, child: const SizedBox())
      ],
    );
  }

  //tela de revisao compartilhada
  Widget _listViewRevisao() {
    List<NotaItem> itensVendidos = NotaItemUtils.getItensComboComposto(
        controller.produtoCarrinho.notaItem);

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
                    '${subItens.descricao!.toUpperCase()}',
                    style: TextStyle(fontSize: FontUtils.h3(context)),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: subItens.precoTotal!.compareTo(BigDecimal.ZERO()) == 0
                      ? SizedBox()
                      : Text(
                          'R\$ ${subItens.precoTotal!.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: FontUtils.h3(context)),
                        ),
                )),
          ],
        ),
        if (subItens.subitens.isNotEmpty) ...[
          Row(
            children: [
              Expanded(
                flex: 14,
                child: Container(),
              ),
              Expanded(
                flex: 74,
                child: Wrap(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      StringUtils.montaDescricaoSubItensAuto(subItens, ignorarItemPrincipal: true),
                      style: TextStyle(fontSize: FontUtils.h3(context)),
                    ),
                  )
                ]),
              ),
              Expanded(
                flex: 12,
                child: Container(),
              )
            ],
          ),
        ]
      ],
    );
  }
}
