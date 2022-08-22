// ignore_for_file: unnecessary_null_comparison

import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/combo/produto_combo_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

class ProdutoComboComponent {
  late BuildContext context;
  final AppController appController = Modular.get();
  final HomeController homeController = Modular.get();
  final VendaController vendaController = Modular.get();
  final ProdutoComboController controller = Modular.get();
  late Orientation orientation;

  initialize(BuildContext context) {
    orientation = MediaQuery
        .of(context)
        .orientation;

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
                homeController.removePalco();
                homeController.habilitarCarrinho = false;
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
    return orientation == Orientation.landscape
        ? InkWell(
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
        style: TextStyle(fontSize: FontUtils.h3(context) * 1.5),
      ),
    )
        : InkWell(
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
        const Expanded(flex: 8, child: SizedBox()),
        Expanded(flex: 84, child: _pageView()),
        const Expanded(flex: 8, child: SizedBox()),
      ],
    );
  }

  //pageView com os menus do produto e uma pageView a mais com a revisao
  Widget _pageView() {
    return PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        itemCount: (appController.mapProdutos[controller.produtoCarrinho.notaItem.idProdutoEmpresa]!.produto!
            .menus.length +
            1),
        itemBuilder: (BuildContext context, int index) {
          controller.atualizaMenus(index);
          if (controller.produtoMenu != null) {
            return _pageViewMenu(index);
          } else {
            return _pageViewRevisao(index);
          }
        });
  }

  Widget _botaoProximoMenu() {
    bool isOpcional = false;
    bool isVisible = true;

    return Observer(
      builder: (_) {
        if (controller.produtoMenu == null) return const SizedBox();

        if (controller.produtoMenu != null &&
            (controller.menu == null || controller.menu!.subitens.isEmpty)) {
          isVisible = false;
        }

        //Tratativas para descrição do botão
        String descricaoBotao = '';
        switch (controller.produtoMenu!.tipo) {
          case "COMPONENTE_FIXO":
            if (controller.proximoMenu == null ||
                controller.proximoMenu!.tipo == "COMPONENTE_EXTRA") {
              descricaoBotao = "ADICIONAR";
            } else {
              descricaoBotao = controller.proximoMenu!.descricao!.toUpperCase();
            }
            break;
          case "COMPONENTE_EXTRA":
            descricaoBotao = "ADICIONAR";
            isOpcional = true;
            break;
        }

        return Row(
          children: [
            if (isVisible) ...[
              Expanded(
                child: BotaoPrimario(

                  descricao: descricaoBotao,
                  function: () => controller.proximo(),
                  altura: FontUtils.h2(context) * 1.01,
                  largura: FontUtils.h2(context) * 20,
                  borderRadius: 10.0,
                ),
              ),
            ],
            if (isOpcional && isVisible) ...[
              const SizedBox(width: 20),
            ],
            if (isOpcional) ...[
              Expanded(
                child: BotaoPrimario(

                  descricao: "NÃO OBRIGADO",
                  function: () => controller.limparItem(),
                  altura: FontUtils.h2(context) * 1.01,
                  largura: FontUtils.h2(context) * 20,
                  borderRadius: 10.0,
                ),
              ),
            ]
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
            child: Text("${(index + 1)}º Passo: ",
                style: TextStyle(
                    fontSize: orientation == Orientation.landscape
                        ? FontUtils.h2(context) * 1
                        : FontUtils.h2(context),
                    color: DefaultTheme.accentColor))),
        Expanded(
            flex: 6,
            child: Text("${controller.produtoMenu!.descricao}",
                style: TextStyle(
                    fontSize: orientation == Orientation.landscape
                        ? FontUtils.h2(context) * 1
                        : FontUtils.h2(context),
                    color: DefaultTheme.accentColor))),
        Expanded(
            flex: 78, child: _listViewComponentesMenu(controller.produtoMenu!)),
        Expanded(flex: 8, child: _botaoProximoMenu()),
        const Expanded(flex: 2, child: SizedBox())
      ],
    );
  }

  //listView com os produtoMenuCompomente do menu do produto
  Widget _listViewComponentesMenu(ProdutoMenu produtoMenu) {
    produtoMenu.componentes.sort((o1, o2) {
      BigDecimal valorCompomente1;
      BigDecimal valorCompomente2;

      valorCompomente1 = o1.getValorComponente(
          appController.estacaoTrabalho.idEmpresa!,
          appController.tabelaPreco.id!)!;
      valorCompomente2 = o2.getValorComponente(
          appController.estacaoTrabalho.idEmpresa!,
          appController.tabelaPreco.id!)!;

      if (valorCompomente1 == null || valorCompomente2 == null) {
        throw Exception('Valor do item igual a null na ordenação dos itens');
      }

      return valorCompomente1.compareTo(valorCompomente2);
    });
    return ListView.builder(
        shrinkWrap: true,
        itemCount: produtoMenu.componentes.length,
        itemBuilder: (context, index) {
          ProdutoMenuComponente compomente = produtoMenu.componentes[index];
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: _cardComponente(produtoMenu, compomente),
          );
        });
  }

  //monta o item para escolha de um produto do combo
  Widget _cardComponente(ProdutoMenu produtoMenu,
      ProdutoMenuComponente compomente) {
    ProdutoMenuComponenteEmpresa componenteEmpresa =
    compomente.componenteEmpresas.firstWhere(
            (ce) =>
        ce.idEmpresa ==
            appController.mapProdutos[controller.produtoCarrinho.notaItem.idProdutoEmpresa]!.idEmpresa,
        orElse: () => ProdutoMenuComponenteEmpresa());

    String url_imagem;
    if (componenteEmpresa.id != null) {
      url_imagem = componenteEmpresa.gradeEmpresa!.produtoEmpresa!.produto
          ?.arquivoPrincipal() !=
          null
          ? componenteEmpresa.gradeEmpresa!.produtoEmpresa!.produto!
          .arquivoPrincipal()!
          .link!
          : "";
    } else {
      url_imagem = "";
    }


    return Observer(builder: (_) {
      bool selecionado = false;
      BigDecimal valorAdicional = BigDecimal.ZERO();

      if (controller.menu != null) {
        selecionado = controller.menu!.subitens
            .any((ni) => ni.idGrade == componenteEmpresa.idGradeEmpresa);
      }

      if (controller.produtoMenu != null) {
        switch (controller.produtoMenu!.tipo) {
          case "COMPONENTE_FIXO":
            valorAdicional = compomente
                .getValorComponente(appController.estacaoTrabalho.idEmpresa!,
                appController.tabelaPreco.id!)!
                .subtrair(NotaItemUtils.verificaDiferencaCombo(
                produtoMenu,
                appController.estacaoTrabalho.idEmpresa!,
                appController.tabelaPreco.id!));
            break;
          case "COMPONENTE_EXTRA":
            valorAdicional = componenteEmpresa.gradeEmpresa!
                .precoVenda(appController.tabelaPreco.id!);
            break;
        }
      }

      return orientation == Orientation.landscape
          ? InkWell(
        onTap: () {
          controller.criaItemCombo(compomente);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color:
              selecionado ? DefaultTheme.accentColor : Colors.black,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: SizedBox(
            height: FontUtils.h1(context) * 1.2,
            width: FontUtils.h1(context),
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: (url_imagem != null && url_imagem.isNotEmpty)
                      ? Center(
                    child: Image.network(
                      url_imagem,
                      fit: BoxFit.cover,
                      width: FontUtils.h1(context) * 1.5,
                    ),
                  )
                      : Center(
                    child: Icon(
                      Icons.image,
                      color: DefaultTheme.cinza,
                    ),
                  ),
                ),
                Expanded(
                  flex: 60,
                  child: Text(
                      "${compomente.descricao!.toUpperCase()} ${(compomente
                          .grade?.tamanho != null) ? compomente.grade!.tamanho!
                          .descricao!.toUpperCase() : ""}",
                      style: TextStyle(fontSize: FontUtils.h3(context))),
                ),
                Expanded(
                  flex: 20,
                  child: Text(
                    (valorAdicional.compareTo(BigDecimal.ZERO()) > 0)
                        ? "+ R\$" + valorAdicional.toStringAsFixed(2)
                        : "",
                    style: TextStyle(fontSize: FontUtils.h3(context)),
                  ),
                )
              ],
            ),
          ),
        ),
      )
          : InkWell(
          onTap: () {
            controller.criaItemCombo(compomente);
          },
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color:
                  selecionado ? DefaultTheme.accentColor : Colors.black,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: SizedBox(
                height: FontUtils.h1(context) * 1.2,
                width: FontUtils.h1(context),
                child: Row(
                  children: [
                    Expanded(
                      flex: 20,
                      child: (url_imagem != null && url_imagem.isNotEmpty)
                          ? Center(
                        child: Image.network(
                          url_imagem,
                          fit: BoxFit.cover,
                          width: FontUtils.h1(context) * 1.5,
                        ),
                      )
                          : Center(
                        child: Icon(
                          Icons.image,
                          color: DefaultTheme.cinza,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 60,
                      child: Text(
                        "${compomente.descricao!.toUpperCase()} ${(compomente
                            .grade?.tamanho != null) ? compomente.grade!
                            .tamanho!.descricao!.toUpperCase() : ""}",
                        style: TextStyle(
                            fontSize: FontUtils.h2(context) * 0.75),
                      ),
                    ),
                    Expanded(
                      flex: 20,
                      child: Text(
                        (valorAdicional.compareTo(BigDecimal.ZERO()) > 0)
                            ? "+ R\$" + valorAdicional.toStringAsFixed(2)
                            : "",
                        style: TextStyle(
                            fontSize: FontUtils.h2(context) * 0.60),
                      ),
                    ),
                  ],
                ),
              )));
    });
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
        const Expanded(flex: 2, child: SizedBox())
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
            'TOTAL R\$ ${NotaItemUtils.getSubtotal(
                controller.produtoCarrinho.notaItem).toStringAsFixed(2)} ',
            style: TextStyle(fontSize: FontUtils.h2(context)),
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }

  //card revisao com todos os item escolhidos do combo
  Widget _cardNotaItemRevisao(NotaItem subItens) {
    return orientation == Orientation.landscape
        ? Column(
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
    )
        : Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: Text(
                    '${subItens.quantidade} UN',
                    style: TextStyle(
                        fontSize: orientation == Orientation.landscape
                            ? FontUtils.h2(context)
                            : FontUtils.h3(context)),
                  ),
                )),
            Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    subItens.descricao!.toUpperCase(),
                    style: TextStyle(
                        fontSize: orientation == Orientation.landscape
                            ? FontUtils.h2(context)
                            : FontUtils.h3(context)),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'R\$ ${subItens.precoTotal!.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: orientation == Orientation.landscape
                            ? FontUtils.h2(context)
                            : FontUtils.h3(context)),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
