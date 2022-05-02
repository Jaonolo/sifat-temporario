import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/cards_produtos/card_produto_selecao_unica.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/controller/produto_controller.dart';
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


  CardProdutoMenu(this.produtoMenu, this.menuAnterior, this.menuProximo);

  @override
  _CardProdutoMenuState createState() => _CardProdutoMenuState();
}

class _CardProdutoMenuState extends State<CardProdutoMenu> {
  final AppController appController = Modular.get();
  final ProdutoController controller = Modular.get();

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
                        fontSize:  FontUtils.h2(context)),
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
      String info = "";
      if (widget.produtoMenu.quantidadeMinima != 0) {
        info +=
            "Você precisa escolher no minino ${widget.produtoMenu.quantidadeMinima} opç${(widget.produtoMenu.quantidadeMinima! > 1) ? 'ões' : "ão"} ";
        if (widget.produtoMenu.quantidadeMaxima != 0) {
          info +=
              'e no máximo ${widget.produtoMenu.quantidadeMaxima} opç${(widget.produtoMenu.quantidadeMaxima! > 1) ? 'ões' : "ão"}';
        }
      } else {
        if (widget.produtoMenu.quantidadeMaxima != 0) {
          info +=
              'Escolha no máximo ${widget.produtoMenu.quantidadeMaxima} opç${(widget.produtoMenu.quantidadeMaxima! > 1) ? 'ões' : "ão"}';
        }
      }

      return Center(
        child: Text(info, style: TextStyle(fontSize: FontUtils.h3(context))),
      );
    } else {
      return Container();
    }
  }

  Widget _listGenerate() {
    //Ordenar do menor para o maior valor
    widget.produtoMenu.componentes.sort((o1, o2) {
      BigDecimal? valorCompomente1;
      BigDecimal? valorCompomente2;

      valorCompomente1 = o1.getValorComponente(
          appController.estacaoTrabalho.idEmpresa!,
          appController.tabelaPreco.id!);
      valorCompomente2 = o2.getValorComponente(
          appController.estacaoTrabalho.idEmpresa!,
          appController.tabelaPreco.id!);

      if (valorCompomente1 == null || valorCompomente2 == null)
        throw new Exception(
            'Valor do item igual a null na ordenação dos itens');

      return valorCompomente1.compareTo(valorCompomente2);
    });


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
      case "COMPONENTE_FIXO":
      //Verifica se já tem algum subitem desse componente lançado no item principal
        notaitem = NotaItemUtils.localizaSubitemJaLancado(
            controller.produtoCarrinho.notaItem,
            widget.produtoMenu,
            widget.produtoMenu.componentes[index]);

        if (notaitem == null) {
          switch(controller.tipoPacote){
            case TipoPacote.COMBO:
              notaitem = NotaItemUtils.itemComboToNotaItem(
                  controller.produtoCarrinho.notaItem.idNota!,
                  widget.produtoMenu.componentes[index],
                  controller.produtoCarrinho.notaItem.produtoEmpresa!
                      .idEmpresa!,
                  appController.tabelaPreco.id!,
                  quantidade: BigDecimal.ZERO());
              break;
            case TipoPacote.ADICIONAIS:
              notaitem = NotaItemUtils.adicionalToNotaItem(
                  controller.produtoCarrinho.notaItem.idNota!,
                  widget.produtoMenu.componentes[index],
                  controller.produtoCarrinho.notaItem.produtoEmpresa!.idEmpresa!,
                  appController.tabelaPreco.id!,
                  quantidade: BigDecimal.ZERO());
              break;
            default:
              throw Exception("TipoPacote não implementado");
          }
        }

        if(widget.produtoMenu.quantidadeMinima == 1 && widget.produtoMenu.quantidadeMaxima == 1){
          return CardProdutoSelecaoUnica(notaitem, widget.produtoMenu,
              widget.produtoMenu.componentes[index]);
        }else{
          return CardProdutoExtra(notaitem, widget.produtoMenu,
              widget.produtoMenu.componentes[index]);
        }
    }
    return SizedBox();
  }
}
