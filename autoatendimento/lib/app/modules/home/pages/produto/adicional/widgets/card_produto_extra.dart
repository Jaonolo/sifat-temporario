import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_controller.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

// ignore: must_be_immutable
class CardProdutoExtra extends StatefulWidget {
  NotaItem notaItem;
  ProdutoMenu produtoMenu;
  ProdutoMenuComponente produtoMenuComponente;

  CardProdutoExtra(this.notaItem, this.produtoMenu, this.produtoMenuComponente,
      {Key? key})
      : super(key: key);

  @override
  _CardProdutoExtraState createState() => _CardProdutoExtraState();
}

class _CardProdutoExtraState extends State<CardProdutoExtra> {
  final ProdutoAdicionalController produtoAdicionalController = Modular.get();
  final VendaController vendaController = Modular.get();

  @override
  Widget build(BuildContext c) {
    return _body();
  }

  Widget _body() {
    return Container(
      height: FontUtils.h1(context),
      decoration: BoxDecoration(
        border: Border.all(
            width: 2,
            color: widget.notaItem.quantidade!.compareTo(BigDecimal.ZERO()) > 0
                ? DefaultTheme.accentColor
                : DefaultTheme.preto),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Expanded(flex: 50, child: _txtDescricao()),
          Expanded(flex: 15, child: _txtPreco()),
          Expanded(flex: 10, child: _btnRemover()),
          Expanded(flex: 8, child: _txtQuantidadeLancada()),
          Expanded(flex: 10, child: _btnAdicionar()),
        ],
      ),
    );
  }

  Widget _txtDescricao() {
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Text(
        widget.notaItem.descricao!.toUpperCase(),
        style: TextStyle(
            fontSize: orientation == Orientation.landscape
                ? FontUtils.h3(context)
                : FontUtils.h4(context)),
      ),
    );
  }

  Widget _txtPreco() {
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    return Text(
      '+ R\$ ${widget.notaItem.precoUnitario!.toStringAsFixed(2)}',
      style: TextStyle(
          fontSize: orientation == Orientation.landscape
              ? FontUtils.h3(context)
              : FontUtils.h4(context)),
    );
  }

  Widget _txtQuantidadeLancada() {
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    return Text('${widget.notaItem.quantidade} UN',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: orientation == Orientation.landscape
                ? FontUtils.h3(context)
                : FontUtils.h4(context)));
  }

  Widget _btnAdicionar() {
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    return SizedBox(
      height: orientation == Orientation.landscape
          ? FontUtils.h2(context)
          : FontUtils.h3(context) * 1.4,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: DefaultTheme.accentColor,
          onPrimary: Colors.white,
          elevation: 4.0,
          shape: const CircleBorder(),
          //splashColor: Colors.grey, Desabilitado pelo uso do elevatedButton
        ),
        onPressed: _podeAdicionar() ? () => _adicionar() : null,
        child: Icon(
          Icons.add,
          size: orientation == Orientation.landscape
              ? FontUtils.h2(context)
              : FontUtils.h3(context),
        ),
      ),
    );
  }

  Widget _btnRemover() {
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    return SizedBox(
      height: orientation == Orientation.landscape
          ? FontUtils.h2(context)
          : FontUtils.h3(context) * 1.4,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: DefaultTheme.accentColor,
          onPrimary: Colors.white,
          elevation: 4.0,
          shape: const CircleBorder(),
          //splashColor: Colors.grey, Desabilitado pelo uso do ElevatedButton
        ),
        onPressed: _podeRemover() ? () => _remover() : null,
        child: Icon(
          Icons.remove,
          size: orientation == Orientation.landscape
              ? FontUtils.h2(context)
              : FontUtils.h3(context),
        ),
      ),
    );
  }

  void _adicionar() {
    widget.notaItem.quantidade =
        widget.notaItem.quantidade!.somar(BigDecimal.ONE());
    _atualizaNotaItem();
  }

  void _remover() {
    if (widget.notaItem.quantidade!.compareTo(BigDecimal.ZERO()) <= 0) return;

    widget.notaItem.quantidade =
        widget.notaItem.quantidade!.subtrair(BigDecimal.ONE());

    _atualizaNotaItem();
  }

  bool _podeAdicionar() {
    bool podeAdd = false;

    //Valida a quantidade máxima por item
    if (widget.produtoMenuComponente.quantidadeMaxima == 0) {
      podeAdd = true;
    } else {
      podeAdd = (widget.notaItem.quantidade!.toInt() <
          widget.produtoMenuComponente.quantidadeMaxima!);
    }

    //Valida a quantidade máxima por menu (Precisa localizar o menu novamente para atualizar as qtdes)
    NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
        produtoAdicionalController.produtoCarrinho.notaItem,
        widget.produtoMenu);
    if (menu != null && podeAdd) {
      BigDecimal qtdeItensDoMenu = BigDecimal.ZERO();
      menu.subitens.forEach((element) {
        qtdeItensDoMenu = qtdeItensDoMenu.somar(element.quantidade);
      });
      podeAdd =
      (qtdeItensDoMenu.toInt() < widget.produtoMenu.quantidadeMaxima!);
    }

    return podeAdd;
  }

  bool _podeRemover() {
    return widget.notaItem.quantidade!.compareTo(BigDecimal.ZERO()) > 0;
  }

  void _atualizaNotaItem() {
    try {
      NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
          produtoAdicionalController.produtoCarrinho.notaItem,
          widget.produtoMenu);

      //Se não localizou um menu lançado, vai criar um novo e add o subitem
      if (menu == null) {
        menu = NotaItemUtils.menuToNotaItem(
            produtoAdicionalController.produtoCarrinho.notaItem.idNota!,
            widget.produtoMenu);
        menu.subitens.add(widget.notaItem);
        produtoAdicionalController.produtoCarrinho.notaItem.subitens.add(menu);
      } else {
        //Se tem menu, verifica se já tem algum subitem desse componente lançado para remover
        NotaItem? itemJaLancado = NotaItemUtils.localizaSubitemJaLancado(
            produtoAdicionalController.produtoCarrinho.notaItem,
            widget.produtoMenu,
            widget.produtoMenuComponente);

        if (itemJaLancado != null) menu.subitens.remove(itemJaLancado);

        if (widget.notaItem.quantidade!.compareTo(BigDecimal.ZERO()) > 0) {
          menu.subitens.add(widget.notaItem);
        } else {
          //Caso a quantidade do item for 0 siginica que está removendo
          //Verifica se o menu tem subitens, caso não, remove ele também
          if (menu.subitens.isEmpty) {
            produtoAdicionalController.produtoCarrinho.notaItem.subitens
                .remove(menu);
          }
        }
      }

      NotaItemUtils.atualizaTotais(
          produtoAdicionalController.produtoCarrinho.notaItem);
      produtoAdicionalController
          .changeProdutoCarrinho(produtoAdicionalController.produtoCarrinho);

      setState(() {
        _body();
      });
    } catch (e, s) {
      print(s);
    }
  }
}
