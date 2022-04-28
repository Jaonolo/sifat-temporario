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
import '../abstract/produto_generico_abstact_controller.dart';

part "produto_combo_controller.g.dart";

class ProdutoComboController = ProdutoComboBase with _$ProdutoComboController;

abstract class ProdutoComboBase extends ProdutoGenericoAbstractController with Store {
  AppController appController = Modular.get();
  VendaController vendaController = Modular.get();
  HomeController homeController = Modular.get();

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
}
