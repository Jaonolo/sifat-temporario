import 'package:autoatendimento/app/modules/home/pages/produto/controller/produto_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_secundario.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


enum TipoBotaoMenus{
  PROXIMO,
  EXTRA_ESCOLHEU,
  EXTRA_NAO_ESCOLHEU,
  REVISAO,
  ADICIONAR_CARRINHO,
}

extension TipoBotaoMenusExtension on TipoBotaoMenus{
  String get name => describeEnum(this);

  bool equals(TipoBotaoMenus tipo) => this == tipo;

  String get descricao {
    switch (this) {
      case TipoBotaoMenus.PROXIMO:
      case TipoBotaoMenus.EXTRA_ESCOLHEU:
        return "Proximo menu";
      case TipoBotaoMenus.EXTRA_NAO_ESCOLHEU:
        return "NÃO, OBRIGADO";
      case TipoBotaoMenus.REVISAO:
        return "REVISAO";
      case TipoBotaoMenus.ADICIONAR_CARRINHO:
        return "ADICIONAR AO CARRINHO";
    }
  }

  Function acaoBotao(ProdutoController abstract){
    switch (this) {
      case TipoBotaoMenus.PROXIMO:
      case TipoBotaoMenus.EXTRA_ESCOLHEU:
      case TipoBotaoMenus.EXTRA_NAO_ESCOLHEU:
      case TipoBotaoMenus.REVISAO:
        return abstract.proximo;
      case TipoBotaoMenus.ADICIONAR_CARRINHO:
        return abstract.adicionarAoCarrinho;
    }
  }

  Widget botaoPronto(BuildContext context, ProdutoController controller){
    switch(this){
      case TipoBotaoMenus.EXTRA_NAO_ESCOLHEU:
        return BotaoSecundario(
          descricao: descricao,
          context: context,
          function:  controller.liberaBotaoMenus ? () => acaoBotao(controller).call() : null,
          altura: FontUtils.h2(context) * 1.01,
          largura: FontUtils.h2(context) * 10,
        );
      case TipoBotaoMenus.PROXIMO:
      case TipoBotaoMenus.EXTRA_ESCOLHEU:
      return BotaoPrimario(
        descricao: controller.proximoMenu!.descricao!.toUpperCase(),
        function: controller.liberaBotaoMenus ? () => acaoBotao(controller).call() : null,
        altura: FontUtils.h2(context) * 1.01,
        largura: FontUtils.h2(context) * 10,
      );
      case TipoBotaoMenus.REVISAO:
      case TipoBotaoMenus.ADICIONAR_CARRINHO:
      return BotaoPrimario(
        descricao: descricao,
        function: controller.liberaBotaoMenus ? () => acaoBotao(controller).call() : null,
        altura: FontUtils.h2(context) * 1.01,
        largura: FontUtils.h2(context) * 10,
      );
    }
  }
}