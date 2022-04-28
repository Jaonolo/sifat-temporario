import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:mobx/mobx.dart';
import '../enum/tipo_botao.dart';

part "produto_generico_abstact_controller.g.dart";

abstract class ProdutoGenericoAbstractController = ProdutoGenericoAbstractControllerBase
    with _$ProdutoGenericoAbstractController;

abstract class ProdutoGenericoAbstractControllerBase with Store {
  late PageController pageController;

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

  adicionarAoCarrinho();

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
    await Future.delayed(const Duration(milliseconds: 100));
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void anterior() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
}
