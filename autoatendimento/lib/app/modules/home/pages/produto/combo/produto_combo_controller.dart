import 'dart:async';

import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_page.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/enum/tipo_botao.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:autoatendimento/app/modules/venda/produto_carrinho_utils.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';
import '../abstract/controller_produto_generico_abstact.dart';

part "produto_combo_controller.g.dart";



class ProdutoComboController = ProdutoComboBase with _$ProdutoComboController;

abstract class ProdutoComboBase extends ControllerProdutoGenericoAbstract with Store {
  AppController appController = Modular.get();
  VendaController vendaController = Modular.get();
  HomeController homeController = Modular.get();

  ProdutoCarrinho produtoCarrinhoOriginal = ProdutoCarrinho(NotaItem());

  @observable
  TipoBotaoMenus tipoBotaoMenus = TipoBotaoMenus.PROXIMO;

  @observable
  ProdutoCarrinho produtoCarrinho = ProdutoCarrinho(NotaItem());

  @observable
  ProdutoMenu? produtoMenu;

  @observable
  ProdutoMenu? proximoMenu;

  @observable
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
          produtoCarrinhoOriginal, produtoCarrinho);

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
          produtoCarrinho.notaItem.produtoEmpresa!.idEmpresa!,
          appController.tabelaPreco.id!);
    } else if (produtoMenu!.tipo == "COMPONENTE_EXTRA") {
      item = NotaItemUtils.adicionalToNotaItem(
          produtoCarrinho.notaItem.idNota!,
          produtoMenuComponente,
          produtoCarrinho.notaItem.produtoEmpresa!.idEmpresa!,
          appController.tabelaPreco.id!);
    }

    bool temMenuObservacao = item.produtoEmpresa!.produto!.menus
        .any((element) => element.tipo == "OBSERVACAO");

    if (item.produtoEmpresa!.produto!.pacote.equals(TipoPacote.ADICIONAIS) ||
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
    NotaItemUtils.atualizaTotais(produtoCarrinho.notaItem);
    _changeNotaItemMenu();
    proximo();
  }

  void limparItem() {
    if (menu != null) {
      menu!.subitens.clear();
      NotaItemUtils.atualizaTotais(produtoCarrinho.notaItem);
    }
    proximo();
  }

  //Paginação (PageController)

  late int index;
  late PageController pageController;

  Future<void> proximo() async {
    await Future.delayed(const Duration(milliseconds: 100));
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void anterior() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  @action
  void atualizaTipoBotaoMenus(
      {bool revisao = false, bool escolheuCompomenteExtra = false}) {
    if (revisao) {
      tipoBotaoMenus = TipoBotaoMenus.REVISAO;
    } else if (escolheuCompomenteExtra) {
      tipoBotaoMenus = TipoBotaoMenus.EXTRA_ESCOLHEU;
    } else if (produtoMenu == null) {
      tipoBotaoMenus = TipoBotaoMenus.ADICIONAR_CARRINHO;
    } else if (proximoMenu != null) {
      tipoBotaoMenus = TipoBotaoMenus.PROXIMO;
      if (proximoMenu!.tipo == "COMPONENTE_EXTRA") {
        tipoBotaoMenus = TipoBotaoMenus.EXTRA_NAO_ESCOLHEU;
      }
    }
  }

  Future<void> atualizaMenus(int index) async {
    this.index = index;

    produtoMenu = (index <
        produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus.length)
        ? produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus[index]
        : null;
    proximoMenu = (index + 1 <
        produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus.length)
        ? produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus[index + 1]
        : null;
    anteriorMenu = (index > 0)
        ? produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus[index - 1]
        : null;

    _changeNotaItemMenu();
    produtoCarrinho.notaItem.produtoEmpresa!.produto!
        .menus.length == index;

    atualizaTipoBotaoMenus(revisao: produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus.length - 1 == index);
  }
}
