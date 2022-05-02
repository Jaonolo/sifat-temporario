import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:autoatendimento/app/modules/venda/produto_carrinho_utils.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

import '../enum/tipo_botao.dart';

part "produto_controller.g.dart";

//Caso tenha alguma função rotina diferente, que precisa ser mudada de acordo com um
//tipoPacote, transformar essa classe em abstract criando outro controller extendendo esse

class ProdutoController = ProdutoControllerBase
    with _$ProdutoController;

abstract class ProdutoControllerBase with Store {
  PageController pageController = PageController(initialPage: 0);
  HomeController homeController = Modular.get();
  VendaController vendaController = Modular.get();

  late TipoPacote tipoPacote;

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

  @observable
  int radiovalue = 0;

  @observable
  bool liberaBotaoMenus = false;

  void adicionarAoCarrinho() {
    try {
      //Pré validações
      ProdutoCarrinhoUtils.atualizaProdutoCarrinho(
          produtoCarrinhoOriginal, produtoCarrinho);

      //Ação de adicionar o produto carrinho
      //Caso o produto carrinho já possuir indice, a atualização é feita por referencia no passo anterior "atualizaProdutoCarrinho"

      vendaController.adicionarProdutoCarrinho(produtoCarrinho);
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
  void onLiberaBotaoMenus() {
    liberaBotaoMenus = false;

    //REVISAO
    if(produtoMenu == null){
      liberaBotaoMenus = true;
      return;
    }

    //não tem quantidade minima
    if (produtoMenu!.quantidadeMinima == 0) {
      liberaBotaoMenus = true;
      return;
    }

    //busca o menu
    NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
        produtoCarrinho.notaItem, produtoMenu!);

    //não encontrou = não lançou
    if(menu == null){
      liberaBotaoMenus = false;
      return;
    }

    //verifica quantos ja lançou
    BigDecimal qtdeItensDoMenu = menu.subitens.map((e) => e.quantidade).fold(BigDecimal.ZERO(), (previousValue, element) => previousValue + element);

    //caso tenha lançado a quantidade minina libera o botao
    if (qtdeItensDoMenu.toInt() >= produtoMenu!.quantidadeMinima!) {
      liberaBotaoMenus = true;
      return;
    }

    //Caso não tenha lancado o suficiente
    liberaBotaoMenus = false;
  }

  @action
  changeProdutoCarrinho(ProdutoCarrinho value) {
    produtoCarrinho = value;
  }

  @action
  void selecaoRadio(int n) {
    radiovalue = n;
  }

  @action
  void atualizaMenus(int index) {
    //menu atual
    produtoMenu = (index <
        produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus.length)
        ? produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus[index]
        : null;

    //o proximo menu
    proximoMenu =
    (index + 1 < produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus.length)
        ? produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus[index + 1]
        : null;

    //o menu anterior
    anteriorMenu = (index > 0)
        ? produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus[index - 1]
        : null;

    onLiberaBotaoMenus();

    //Caso seja combo tem a aba de revisão para somente depois inserir o item
    if(produtoCarrinho.notaItem.produtoEmpresa!.produto!.pacote.equals(TipoPacote.COMBO)){
      atualizaTipoBotaoMenus(revisao: produtoCarrinho.notaItem.produtoEmpresa!.produto!.menus.length - 1 == index);
    }else{
      atualizaTipoBotaoMenus();
    }
  }

  @action
  void atualizaTipoBotaoMenus({bool revisao = false, bool escolheuCompomenteExtra = false}){
    switch(produtoCarrinho.notaItem.produtoEmpresa!.produto!.pacote){
      case TipoPacote.COMBO:
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
        break;
      case TipoPacote.ADICIONAIS:
        if (proximoMenu == null) {
          tipoBotaoMenus = TipoBotaoMenus.ADICIONAR_CARRINHO;
        } else if (proximoMenu != null) {
          tipoBotaoMenus = TipoBotaoMenus.PROXIMO;
        }
        break;
      default:
        throw Exception("Pacote ainda não implementado");
    }
  }

  //Paginação (PageController)

  Future<void> proximo() async {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void anterior() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
}
