import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';


class CardProdutoObservacaoRadio extends StatefulWidget {
  final ProdutoMenu produtoMenu;
  final ProdutoMenuComponente produtoMenuComponente;
  final int index;

  CardProdutoObservacaoRadio(this.produtoMenu, this.produtoMenuComponente,
      this.index,
      {Key? key})
      : super(key: key);

  @override
  _CardProdutoObservacaoRadioState createState() =>
      _CardProdutoObservacaoRadioState();
}

class _CardProdutoObservacaoRadioState
    extends State<CardProdutoObservacaoRadio> {
  final ProdutoAdicionalController produtoAdicionalController = Modular.get();

  @override
  void initState() {
    if (widget.index == produtoAdicionalController.radiovalue) {
      _adicionaObservacao();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
          height: FontUtils.h1(context),
          decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: produtoAdicionalController.radiovalue == widget.index
                    ? DefaultTheme.accentColor
                    : DefaultTheme.preto),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Center(
            child: _radio(),
          ));
    });
  }

  Widget _radio() {
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;
    return RadioListTile(
        activeColor: DefaultTheme.accentColor,
        title: Text(widget.produtoMenuComponente.descricao!.toUpperCase(),
            style: TextStyle(
                fontSize: orientation == Orientation.landscape
                    ? FontUtils.h3(context)
                    : FontUtils.h4(context))),
        controlAffinity: ListTileControlAffinity.leading,
        value: widget.index,
        groupValue: produtoAdicionalController.radiovalue,
        onChanged: (int? n) {
          _adicionaObservacao();
          produtoAdicionalController.selecaoRadio(n!);
        });
  }

  void _adicionaObservacao() {
    NotaItem notaItem = NotaItemUtils.observacaoToNotaItem(
        produtoAdicionalController.produtoCarrinho.notaItem.idNota!,
        widget.produtoMenuComponente);

    NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
        produtoAdicionalController.produtoCarrinho.notaItem,
        widget.produtoMenu);

    if (menu == null) {
      menu = NotaItemUtils.menuToNotaItem(
          produtoAdicionalController.produtoCarrinho.notaItem.idNota!,
          widget.produtoMenu);
      menu.subitens.add(notaItem);
      produtoAdicionalController.produtoCarrinho.notaItem.subitens.add(menu);
    } else {
      menu.subitens.clear();
      menu.subitens.add(notaItem);
    }
  }
}
