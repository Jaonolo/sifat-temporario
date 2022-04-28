import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/combo/produto_combo_controller.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

import 'card_produto_extra.dart';
import 'card_produto_observacao_checkbox.dart';
import 'card_produto_observacao_radio.dart';

class CardProdutoMenu extends StatefulWidget {
  final ProdutoMenu produtoMenu;
  final ProdutoMenu? menuProximo;
  final ProdutoMenu? menuAnterior;

  CardProdutoMenu(this.produtoMenu, this.menuAnterior, this.menuProximo,
      {Key? key})
      : super(key: key);

  @override
  _CardProdutoMenuState createState() => _CardProdutoMenuState();
}

class _CardProdutoMenuState extends State<CardProdutoMenu> {
  final AppController appController = Modular.get();
  final ProdutoAdicionalController produtoAdicionalController = Modular.get();
  final ProdutoComboController produtoComboController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Center(
                  child: Text(
                    widget.produtoMenu.descricao!.toUpperCase(),
                    style: TextStyle(
                        fontSize:  FontUtils.h3(context)),
                  )),
              _mostrarQuantidade(),
              _listGenerate(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mostrarQuantidade() {
    if (widget.produtoMenu.quantidadeMaxima != 0) {
      return Center(
        child: Text(
            (widget.produtoMenu.quantidadeMaxima == 1)
                ? 'Escolha no máximo ${widget.produtoMenu
                .quantidadeMaxima} opção'
                : (widget.produtoMenu.quantidadeMaxima! > 1)
                ? 'Escolha no máximo ${widget.produtoMenu
                .quantidadeMaxima} opções'
                : '',
            style: TextStyle(fontSize: FontUtils.h4(context))),
      );
    } else {
      return Container();
    }
  }

  Widget _listGenerate() {
    return Column(
        children:
        List.generate(widget.produtoMenu.componentes.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: _extraOuObservacao(index),
          );
        }));
  }

  //verifica se é menu extra ou observaçao
  Widget _extraOuObservacao(int index) {
    NotaItem? notaitem;
    switch (widget.produtoMenu.tipo) {
      case "OBSERVACAO":
        if (widget.produtoMenu.quantidadeMinima! <= 1 &&
            widget.produtoMenu.quantidadeMaxima! <= 1) {
          return CardProdutoObservacaoRadio(widget.produtoMenu,
              widget.produtoMenu.componentes[index], index);
        } else {
          return CardProdutoObservacaoCheckbox(
              widget.produtoMenu, widget.produtoMenu.componentes[index]);
        }

      case "COMPONENTE_EXTRA":
      //Verifica se já tem algum subitem desse componente lançado no item principal
        notaitem = NotaItemUtils.localizaSubitemJaLancado(
            produtoAdicionalController.produtoCarrinho.notaItem,
            widget.produtoMenu,
            widget.produtoMenu.componentes[index]);

        if (notaitem == null) {
          notaitem = NotaItemUtils.adicionalToNotaItem(
              produtoAdicionalController.produtoCarrinho.notaItem.idNota!,
              widget.produtoMenu.componentes[index],
              produtoAdicionalController
                  .produtoCarrinho.notaItem.produtoEmpresa!.idEmpresa!,
              appController.tabelaPreco.id!,
              quantidade: BigDecimal.ZERO());
        }

        return CardProdutoExtra(notaitem, widget.produtoMenu,
            widget.produtoMenu.componentes[index]);

      case "COMPONENTE_FIXO":
      //Verifica se já tem algum subitem desse componente lançado no item principal
        notaitem = NotaItemUtils.localizaSubitemJaLancado(
            produtoAdicionalController.produtoCarrinho.notaItem,
            widget.produtoMenu,
            widget.produtoMenu.componentes[index]);

        if (notaitem == null) {
          notaitem = NotaItemUtils.itemComboToNotaItem(
              produtoComboController.produtoCarrinho.notaItem.idNota!,
              widget.produtoMenu.componentes[index],
              produtoComboController.produtoCarrinho.notaItem.produtoEmpresa!
                  .idEmpresa!,
              appController.tabelaPreco.id!,
              quantidade: BigDecimal.ZERO());
        }

        return CardProdutoExtra(notaitem, widget.produtoMenu,
            widget.produtoMenu.componentes[index]);

    }
    return SizedBox();
  }
}
