import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/combo/produto_combo_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/abstract/controller_abstract.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:autoatendimento/app/modules/venda/produto_carrinho_utils.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';

part "produto_adicional_controller.g.dart";

class ProdutoAdicionalController = ProdutoAdicionalBase
    with _$ProdutoAdicionalController;

abstract class ProdutoAdicionalBase extends ControllerAbstract with Store {
  // ------------------------ Variaveis
  ProdutoComboController produtoComboController = Modular.get();
  HomeController homeController = Modular.get();
  VendaController vendaController = Modular.get();
  AppController appController = Modular.get();

  ProdutoCarrinho produtoCarrinhoOriginal = ProdutoCarrinho(NotaItem());

  // ------------------------ Variaveis Observable

  @observable
  ProdutoCarrinho produtoCarrinho = ProdutoCarrinho(NotaItem());

  @observable
  ProdutoMenu? produtoMenu;

  @observable
  ProdutoMenu? proximoMenu;

  @observable
  ProdutoMenu? anteriorMenu;

  @observable
  int radiovalue = 0;

  // ------------------------ Metodos

  void adicionarAoCarrinho() {
    try {
      //Pré validações
      ProdutoCarrinhoUtils.atualizaProdutoCarrinho(
          produtoCarrinhoOriginal, produtoCarrinho);

      //Ação de adicionar o produto carrinho
      //Caso o produto carrinho já possuir indice, a atualização é feita por referencia no passo anterior "atualizaProdutoCarrinho"

      if (produtoCarrinho.notaItem.tipo == "ITEM") {
        vendaController.adicionarProdutoCarrinho(produtoCarrinho);
      }

      //caso seja tipo combo nao habilita o carinho
      if (produtoCarrinho.notaItem.tipo == "ITEM_COMBO") {
        produtoComboController.adicionarItem(produtoCarrinho.notaItem);
      }
    } catch (e) {
      print(e);
    } finally {
      try {
        //Validações para voltar ao cardapio principal quando o item tiver grade => REMOVER OS DOIS ULTIMOS PALCOS
        if (produtoCarrinho.notaItem.produtoEmpresa!.gradesAtivas.isNotEmpty &&
            homeController.palco.length == 3 &&
            produtoCarrinho.notaItem.tipo == "ITEM") {
          homeController.removePalco();
        }
      } catch (e) {}

      //Transição de tela
      homeController.habilitarCarrinho = false;
      homeController.removePalco();
    }
  }

  @action
  void changeProdutoCarrinho(ProdutoCarrinho value) {
    produtoCarrinho = value;
  }

  @action
  void selecaoRadio(int n) {
    this.radiovalue = n;
  }

  @action
  Future<void> atualizaMenus(int index) async {
    //menu atual
    produtoMenu =
    (index < produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus.length)
        ? produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus[index]
        : null;

    //o proximo menu
    proximoMenu = (index + 1 <
        produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus.length)
        ? produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus[index + 1]
        : null;

    //o menu anterior
    anteriorMenu = (index > 0)
        ? produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus[index - 1]
        : null;
  }

// ------------------------ Metodos da Paginação (PageController)
  int index = 0;
  late PageController pageController;

  @override
  Future<void> proximo() async {
    await new Future.delayed(const Duration(milliseconds: 100));
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  void anterior() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
}
