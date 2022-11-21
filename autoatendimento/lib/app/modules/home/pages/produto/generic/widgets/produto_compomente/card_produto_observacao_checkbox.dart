import 'package:autoatendimento/app/modules/home/pages/produto/abstract/controller_abstract.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

// ignore: must_be_immutable
class CardProdutoObservacaoCheckbox extends StatelessWidget {
  ControllerAbstract controllerAbstract;
  ProdutoMenuComponente produtoMenuComponente;
  NotaItem? notaItem;
  @observable
  bool selecionado = false;

  @observable
  bool newValue = false;

  CardProdutoObservacaoCheckbox(this.notaItem, this.controllerAbstract, this.produtoMenuComponente){
    selecionado = notaItem != null;
  }

  @action
  atualizaSelecionado(bool value) {
    selecionado = value;
    newValue = value;
    newValue ? _adicionaObservacao() : _removeObservacao();
  }

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return InkWell(
      onTap: () {
        if (selecionado) {
          atualizaSelecionado(false);
        } else {
          atualizaSelecionado(true);
        }
      },
      child: Container(
          height: FontUtils.h1(context),
          decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color:
                selecionado ? DefaultTheme.accentColor : DefaultTheme.preto),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 8,
                  child: Checkbox(
                      activeColor: DefaultTheme.accentColor,
                      value: selecionado,
                      onChanged: (bool? newValue) {
                        atualizaSelecionado(newValue!);
                      })),
              Expanded(
                flex: 50,
                child: Text(produtoMenuComponente.descricao!.toUpperCase(),
                    style: TextStyle(
                        fontSize:
                            defaultTargetPlatform == TargetPlatform.windows
                                ? FontUtils.h4(context)
                                : FontUtils.h3(context))),
              ),
            ],
          )),
    );
  }

  void _adicionaObservacao() {
    notaItem = NotaItemUtils.observacaoToNotaItem(
        controllerAbstract.produtoCarrinho.notaItem.idNota!,
        produtoMenuComponente);

    NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
        controllerAbstract.produtoCarrinho.notaItem,
        controllerAbstract.produtoMenu!);

    if (menu == null) {
      menu = NotaItemUtils.menuToNotaItem(
          controllerAbstract.produtoCarrinho.notaItem.idNota!,
          controllerAbstract.produtoMenu!);
      menu.subitens.add(notaItem!);
      controllerAbstract.produtoCarrinho.notaItem.subitens.add(menu);
    } else {
      menu.subitens.add(notaItem!);
    }

    controllerAbstract.changeProdutoCarrinho( controllerAbstract.produtoCarrinho);
  }

  void _removeObservacao() {
    NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
        controllerAbstract.produtoCarrinho.notaItem,
        controllerAbstract.produtoMenu!);
    menu!.subitens.remove(notaItem);

    //Caso a quantidade do item for 0 siginica que está removendo
    //Verifica se o menu tem subitens, caso não, remove ele também
    if (menu.subitens.isEmpty)
      controllerAbstract.produtoCarrinho.notaItem.subitens.remove(menu);

    notaItem = null;

    controllerAbstract.changeProdutoCarrinho(controllerAbstract.produtoCarrinho);
  }
}
