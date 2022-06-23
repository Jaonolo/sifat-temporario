import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/card_produto_extra.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/card_produto_observacao_checkbox.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/card_produto_observacao_radio.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/card_produto_selecao_unica.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';

class ListViewCompomentes extends StatelessWidget {
  ProdutoMenu produtoMenu;

  ListViewCompomentes(this.produtoMenu);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: produtoMenu.componentes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: devolveCardProdutoCompomente(index),
          );
        });
  }

  //veriica se é menu extra ou observaçao
  Widget devolveCardProdutoCompomente(int index) {
    ProdutoMenuComponente compomente = produtoMenu.componentes[index];

    switch (produtoMenu.tipo) {
      case "OBSERVACAO":
        if (validaQuantidadeIgualUm)
          return CardProdutoObservacaoRadio(produtoMenu, compomente, index);
        else
          return CardProdutoObservacaoCheckbox(produtoMenu, compomente);
      case "COMPONENTE_EXTRA":
      case "COMPONENTE_FIXO":
        // if (validaQuantidadeIgualUm)
        //   return CardProdutoSelecaoUnica();
        // else
        //   return CardProdutoExtra();
      default:
        throw Exception(produtoMenu.tipo! + " não implementado");
    }
  }

  bool get validaQuantidadeIgualUm =>
      (produtoMenu.quantidadeMinima == 1 && produtoMenu.quantidadeMaxima == 1);
}
