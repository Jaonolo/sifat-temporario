import 'package:autoatendimento/app/modules/home/pages/produto/controller/produto_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_secundario.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


enum TipoBotaoNavegacaoMenu{
  PROXIMO,
  EXTRA_ESCOLHEU,
  EXTRA_NAO_ESCOLHEU,
  SUB_ITEM_INTO_ITEM,
  REVISAO,
  ADICIONAR_CARRINHO,
}

extension TipoBotaoNavegacaoMenusExtension on TipoBotaoNavegacaoMenu{
  String get name => describeEnum(this);

  bool equals(TipoBotaoNavegacaoMenu tipo) => this == tipo;

  String get descricao {
    switch (this) {
      case TipoBotaoNavegacaoMenu.PROXIMO:
      case TipoBotaoNavegacaoMenu.EXTRA_ESCOLHEU:
        return "Proximo menu";
      case TipoBotaoNavegacaoMenu.EXTRA_NAO_ESCOLHEU:
        return "NÃO, OBRIGADO";
      case TipoBotaoNavegacaoMenu.REVISAO:
        return "REVISAO";
      case TipoBotaoNavegacaoMenu.ADICIONAR_CARRINHO:
        return "ADICIONAR AO CARRINHO";
      case TipoBotaoNavegacaoMenu.SUB_ITEM_INTO_ITEM:
        return "ADICIONAR AO ITEM PRINCIPAL";
    }
  }

  Function onActionBtn(ProdutoController abstract){
    switch (this) {
      case TipoBotaoNavegacaoMenu.PROXIMO:
      case TipoBotaoNavegacaoMenu.EXTRA_ESCOLHEU:
      case TipoBotaoNavegacaoMenu.EXTRA_NAO_ESCOLHEU:
      case TipoBotaoNavegacaoMenu.REVISAO:
        return abstract.proximo;
      case TipoBotaoNavegacaoMenu.SUB_ITEM_INTO_ITEM:
      case TipoBotaoNavegacaoMenu.ADICIONAR_CARRINHO:
        return abstract.adicionarAoCarrinho;
    }
  }

  Widget retornaBtnPronto(BuildContext context, ProdutoController controller){
    switch(this){
      case TipoBotaoNavegacaoMenu.EXTRA_NAO_ESCOLHEU:
        return BotaoSecundario(
          descricao: descricao,
          context: context,
          function:  controller.liberaBotaoMenus ? () => onActionBtn(controller).call() : null,
          altura: FontUtils.h2(context) * 1.01,
          largura: FontUtils.h2(context) * 10,
        );
      case TipoBotaoNavegacaoMenu.PROXIMO:
      case TipoBotaoNavegacaoMenu.EXTRA_ESCOLHEU:
      return BotaoPrimario(
        descricao: controller.proximoMenu!.descricao!.toUpperCase(),
        function: controller.liberaBotaoMenus ? () => onActionBtn(controller).call() : null,
        altura: FontUtils.h2(context) * 1.01,
        largura: FontUtils.h2(context) * 10,
      );
      case TipoBotaoNavegacaoMenu.REVISAO:
      case TipoBotaoNavegacaoMenu.ADICIONAR_CARRINHO:
      case TipoBotaoNavegacaoMenu.SUB_ITEM_INTO_ITEM:
      return BotaoPrimario(
        descricao: descricao,
        function: controller.liberaBotaoMenus ? () => onActionBtn(controller).call() : null,
        altura: FontUtils.h2(context) * 1.01,
        largura: FontUtils.h2(context) * 10,
      );
    }
  }
}