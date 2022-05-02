import 'package:autoatendimento/app/modules/home/pages/produto/controller/produto_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

// ignore: must_be_immutable
class CardProdutoObservacaoCheckbox extends StatefulWidget {
  final ProdutoMenu produtoMenu;
  final ProdutoMenuComponente produtoMenuComponente;
  NotaItem? notaItem;

  CardProdutoObservacaoCheckbox(this.produtoMenu, this.produtoMenuComponente);

  @override
  _CardProdutoObservacaoCheckboxState createState() =>
      _CardProdutoObservacaoCheckboxState();
}

class _CardProdutoObservacaoCheckboxState
    extends State<CardProdutoObservacaoCheckbox> {
  final ProdutoController controller = Modular.get();
  late bool selecionado;


  @override
  void initState() {
    //Verifica se já tem alguma observação desse componente lançado no item principal
    widget.notaItem = NotaItemUtils.localizaObservacaoJaLancada(
        controller.produtoCarrinho.notaItem,
        widget.produtoMenu,
        widget.produtoMenuComponente);

    selecionado = widget.notaItem != null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: FontUtils.h1(context),
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color:
              selecionado ? DefaultTheme.accentColor : DefaultTheme.preto),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(child: _checkBox()));
  }

  Widget _checkBox() {
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    return CheckboxListTile(
        title: Text(widget.produtoMenuComponente.descricao!.toUpperCase(),
            style: TextStyle(
                fontSize: orientation == Orientation.landscape
                    ? FontUtils.h3(context)
                    : FontUtils.h4(context))),
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: DefaultTheme.accentColor,
        dense: true,
        value: selecionado,
        onChanged: (bool? newValue) {
          newValue! ? _adicionaObservacao() : _removeObservacao();
          setState(() {
            selecionado = newValue;
          });
        });
  }

  void _adicionaObservacao() {
    widget.notaItem = NotaItemUtils.observacaoToNotaItem(
        controller.produtoCarrinho.notaItem.idNota!,
        widget.produtoMenuComponente);

    NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
        controller.produtoCarrinho.notaItem,
        widget.produtoMenu);

    if (menu == null) {
      menu = NotaItemUtils.menuToNotaItem(
          controller.produtoCarrinho.notaItem.idNota!,
          widget.produtoMenu);
      menu.subitens.add(widget.notaItem!);
      controller.produtoCarrinho.notaItem.subitens.add(menu);
    } else {
      menu.subitens.add(widget.notaItem!);
    }
  }

  void _removeObservacao() {
    NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
        controller.produtoCarrinho.notaItem,
        widget.produtoMenu);

    menu!.subitens.remove(widget.notaItem);

    //Caso a quantidade do item for 0 siginica que está removendo
    //Verifica se o menu tem subitens, caso não, remove ele também
    if (menu.subitens.isEmpty) {
      controller.produtoCarrinho.notaItem.subitens
          .remove(menu);
    }

    widget.notaItem;
  }
}
