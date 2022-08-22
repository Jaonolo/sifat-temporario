import 'dart:async';

import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_page.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:autoatendimento/app/modules/venda/produto_carrinho_utils.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

part "produto_combo_controller.g.dart";

class ProdutoComboController = ProdutoComboBase with _$ProdutoComboController;

abstract class ProdutoComboBase with Store {
  AppController appController = Modular.get();
  VendaController vendaController = Modular.get();
  HomeController homeController = Modular.get();

  ProdutoCarrinho produtoCarrinhoOriginal = ProdutoCarrinho(NotaItem());

  ProdutoCarrinho produtoCarrinho = ProdutoCarrinho(NotaItem());

  ProdutoMenu? produtoMenu;

  ProdutoMenu? proximoMenu;

  ProdutoMenu? anteriorMenu;

  @observable
  NotaItem? menu;

  @action
  setarCarrinhoOriginal(ProdutoCarrinho original) {
    produtoCarrinhoOriginal = original;
  }

  @action
  void _changeNotaItemMenu() {
    if (produtoMenu == null) {
      menu = null;
      return;
    }
    menu = NotaItemUtils.localizaMenuJaLancado(
        produtoCarrinho.notaItem, produtoMenu!);
  }

  //Adiciona o produto Combo no carrinho de compras (Finalização do combo)

  Future<void> adicionarAoCarrinho() async {
    try {
      //Pré validações
      produtoCarrinho = await ProdutoCarrinhoUtils.atualizaProdutoCarrinho(
          produtoCarrinhoOriginal, produtoCarrinho, (idProdutoEmpresa){
            return appController.mapProdutos[idProdutoEmpresa];
      });

      //Ação de adicionar o produto carrinho
      //Caso o produto carrinho já possuir indice, a atualização é feita por referencia no passo anterior "atualizaProdutoCarrinho"
      vendaController.adicionarProdutoCarrinho(produtoCarrinho);
    } catch (e) {
      print(e);
    } finally {
      //Transição de tela
      homeController.habilitarCarrinho = false;
      homeController.removePalco();
    }
  }

  //Métodos uteis para criação de nota item do tipo combo

  void criaItemCombo(ProdutoMenuComponente produtoMenuComponente) {
    late NotaItem item;
    if (produtoMenu!.tipo == "COMPONENTE_FIXO") {
      item = NotaItemUtils.itemComboToNotaItem(
          produtoCarrinho.notaItem.idNota!,
          produtoMenuComponente,
          appController.mapProdutos[produtoCarrinho.notaItem.idProdutoEmpresa]!
              .idEmpresa!,
          appController.tabelaPreco.id!);
    } else if (produtoMenu!.tipo == "COMPONENTE_EXTRA") {
      item = NotaItemUtils.adicionalToNotaItem(
          produtoCarrinho.notaItem.idNota!,
          produtoMenuComponente,
          appController.mapProdutos[produtoCarrinho.notaItem.idProdutoEmpresa]!
              .idEmpresa!,
          appController.tabelaPreco.id!);
    }

    bool temMenuObservacao = appController
        .mapProdutos[item.idProdutoEmpresa]!.produto!.menus
        .any((element) => element.tipo == "OBSERVACAO");

    if (appController.mapProdutos[item.idProdutoEmpresa]!.produto!.pacote ==
            "ADICIONAIS" ||
        temMenuObservacao) {
      homeController.addPalco(ProdutoAdicionalPage(ProdutoCarrinho(item)));
      return;
    }

    adicionarItem(item);
  }

  void adicionarItem(NotaItem itemCombo) {
    if (menu == null) {
      menu = NotaItemUtils.menuToNotaItem(
          produtoCarrinho.notaItem.idNota!, produtoMenu!);
      menu!.subitens.add(itemCombo);
      produtoCarrinho.notaItem.subitens.add(menu!);
    } else {
      menu!.subitens.clear();
      menu!.subitens.add(itemCombo);
    }
    NotaItemUtils.atualizaTotais(produtoCarrinho.notaItem, (idProdutoEmpresa) {
      return appController.mapProdutos[idProdutoEmpresa];
    });
    _changeNotaItemMenu();
    proximo();
  }

  void limparItem() {
    if (menu != null) {
      menu!.subitens.clear();
      NotaItemUtils.atualizaTotais(produtoCarrinho.notaItem,
          (idProdutoEmpresa) {
        return appController.mapProdutos[idProdutoEmpresa];
      });
    }
    proximo();
  }

  //Paginação (PageController)

  late int index;
  late PageController pageController;

  Future<void> proximo() async {
    // if (produtoMenu != null && produtoMenu.tipo == "COMPONENTE_FIXO" && (menu == null || menu.subitens.isEmpty)) {
    //   return;
    // }
    await Future.delayed(const Duration(milliseconds: 100));
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void anterior() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void atualizaMenus(int index) {
    this.index = index;

    produtoMenu = (index <
            appController
                .mapProdutos[produtoCarrinho.notaItem.idProdutoEmpresa]!
                .produto!
                .menus
                .length)
        ? appController.mapProdutos[produtoCarrinho.notaItem.idProdutoEmpresa]!
            .produto!.menus[index]
        : null;
    proximoMenu = (index + 1 <
            appController
                .mapProdutos[produtoCarrinho.notaItem.idProdutoEmpresa]!
                .produto!
                .menus
                .length)
        ? appController.mapProdutos[produtoCarrinho.notaItem.idProdutoEmpresa]!
            .produto!.menus[index + 1]
        : null;
    anteriorMenu = (index > 0)
        ? appController.mapProdutos[produtoCarrinho.notaItem.idProdutoEmpresa]!
            .produto!.menus[index - 1]
        : null;

    _changeNotaItemMenu();
  }
}
