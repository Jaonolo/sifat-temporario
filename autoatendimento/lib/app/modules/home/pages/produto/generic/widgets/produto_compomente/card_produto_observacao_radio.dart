import 'package:autoatendimento/app/modules/home/pages/produto/abstract/controller_abstract.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

class CardProdutoObservacaoRadio extends StatelessWidget {
  ControllerAbstract controllerAbstract;
  ProdutoMenuComponente produtoMenuComponente;
  int index;

  CardProdutoObservacaoRadio(
      this.controllerAbstract, this.produtoMenuComponente, this.index);

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Observer(builder: (_) {
      return Container(
          height: FontUtils.h1(context),
          decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: controllerAbstract.radiovalue == index
                    ? DefaultTheme.accentColor
                    : DefaultTheme.preto),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Center(
            child: _radio(),
          ));
    });
  }

  Widget _radio() {
    return RadioListTile(
        activeColor: DefaultTheme.accentColor,
        title: Text(produtoMenuComponente.descricao!.toUpperCase(),
            style: TextStyle(
                fontSize: FontUtils.h4(context))),
        controlAffinity: ListTileControlAffinity.leading,
        value: index,
        groupValue: controllerAbstract.radiovalue,
        onChanged: (int? n) {
          _adicionaObservacao();
          controllerAbstract.selecaoRadio(n!);
        });
  }

  void _adicionaObservacao() {
    NotaItem? notaItem = NotaItemUtils.observacaoToNotaItem(
        controllerAbstract.produtoCarrinho.notaItem.idNota!,
        produtoMenuComponente);

    NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
        controllerAbstract.produtoCarrinho.notaItem,
        controllerAbstract.produtoMenu!);

    if (menu == null) {
      menu = NotaItemUtils.menuToNotaItem(
          controllerAbstract.produtoCarrinho.notaItem.idNota!,
          controllerAbstract.produtoMenu!);
      menu.subitens.add(notaItem);
      controllerAbstract.produtoCarrinho.notaItem.subitens.add(menu);
    } else {
      menu.subitens.clear();
      menu.subitens.add(notaItem);
    }
  }
}