import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/abstract/controller_abstract.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_page.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

// ignore: must_be_immutable
class CardProdutoExtra extends StatelessWidget {
   ControllerAbstract controllerAbstract;
   ProdutoMenuComponente produtoMenuComponente;
   NotaItem notaItem;

  CardProdutoExtra(this.notaItem, this.produtoMenuComponente, this.controllerAbstract);

  late BuildContext context;
  final HomeController homeController = Modular.get();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      height: FontUtils.h1(context),
      decoration: BoxDecoration(
        border: Border.all(
            width: 2,
            color: notaItem.quantidade!.compareTo(BigDecimal.ZERO()) > 0
                ? DefaultTheme.accentColor
                : DefaultTheme.preto),
        borderRadius: BorderRadius.all(
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
    Orientation orientation = MediaQuery.of(context).orientation;

    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Text(
        notaItem.descricao!.toUpperCase(),
        style: TextStyle(
            fontSize: orientation == Orientation.landscape
                ? FontUtils.h3(context)
                : FontUtils.h4(context)),
      ),
    );
  }

  Widget _txtPreco() {
    if(notaItem.precoUnitario!.compareTo(BigDecimal.ZERO()) == 0)
      return const SizedBox();

    return Text(
      '+ R\$ ${notaItem.precoUnitario!.toStringAsFixed(2)}',
      style: TextStyle(
          fontSize: FontUtils.h3(context)),
    );
  }

  Widget _txtQuantidadeLancada() {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Text('${notaItem.quantidade} UN',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: orientation == Orientation.landscape
                ? FontUtils.h3(context)
                : FontUtils.h4(context)));
  }

   Widget _btnAdicionar() {
     Orientation orientation = MediaQuery.of(context).orientation;
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
     Orientation orientation = MediaQuery.of(context).orientation;
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
    notaItem.quantidade =
        notaItem.quantidade!.somar(BigDecimal.ONE());
    _atualizaNotaItem();
  }

  void _remover() {
    if (notaItem.quantidade!.compareTo(BigDecimal.ZERO()) <= 0) return;

    notaItem.quantidade =
        notaItem.quantidade!.subtrair(BigDecimal.ONE());

    _atualizaNotaItem(removendo: true);
  }

  bool _podeAdicionar() {
    bool podeAdd = false;

    //Valida a quantidade máxima por item
    if (produtoMenuComponente.quantidadeMaxima == 0)
      podeAdd = true;
    else
      podeAdd = (notaItem.quantidade!.toInt() <
          produtoMenuComponente.quantidadeMaxima!);

    //Valida a quantidade máxima por menu (Precisa localizar o menu novamente para atualizar as qtdes)
    NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
        controllerAbstract.produtoCarrinho.notaItem,
        controllerAbstract.produtoMenu!);
    if (menu != null && podeAdd) {
      BigDecimal qtdeItensDoMenu = BigDecimal.ZERO();
      menu.subitens.forEach((element) {
        qtdeItensDoMenu = qtdeItensDoMenu.somar(element.quantidade);
      });
      podeAdd = (qtdeItensDoMenu.toInt() <  controllerAbstract.produtoMenu!.quantidadeMaxima!);
    }

    return podeAdd;
  }

  bool _podeRemover() {
    return notaItem.quantidade!.compareTo(BigDecimal.ZERO()) > 0;
  }

  void _atualizaNotaItem({removendo = false}) {
    try {

      NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
          controllerAbstract.produtoCarrinho.notaItem,
          controllerAbstract.produtoMenu!);

      //Se não localizou um menu lançado, vai criar um novo e add o subitem
      if (menu == null) {
        menu = NotaItemUtils.menuToNotaItem(
            controllerAbstract.produtoCarrinho.notaItem.idNota!,
            controllerAbstract.produtoMenu!);
        menu.subitens.add(notaItem);
        controllerAbstract.produtoCarrinho.notaItem.subitens.add(menu);
      } else {
        //Se tem menu, verifica se já tem algum subitem desse componente lançado para remover
        NotaItem? itemJaLancado = NotaItemUtils.localizaSubitemJaLancado(
            controllerAbstract.produtoCarrinho.notaItem,
            controllerAbstract.produtoMenu!,
            produtoMenuComponente);

        if (itemJaLancado != null) menu.subitens.remove(itemJaLancado);

        if (notaItem.quantidade!.compareTo(BigDecimal.ZERO()) > 0) {
          menu.subitens.add(notaItem);
        } else {
          //Caso a quantidade do item for 0 siginica que está removendo
          //Verifica se o menu tem subitens, caso não, remove ele também
          if (menu.subitens.isEmpty)
            controllerAbstract.produtoCarrinho.notaItem.subitens
                .remove(menu);
        }
      }

      if(!removendo) {
        //Se tiver alguns observação ou adicionais abre a tela nova
        bool temMenuObservacao = notaItem.produtoEmpresa!.produto!.menus
            .any((element) => element.tipo == "OBSERVACAO");

        if (controllerAbstract.produtoCarrinho.notaItem.tipo == "COMBO" &&
            (notaItem.produtoEmpresa!.produto!.pacote == "ADICIONAIS" ||
                temMenuObservacao)) {
          homeController
              .addPalco(ProdutoAdicionalPage(ProdutoCarrinho(notaItem)));
          return;
        }
      }


      NotaItemUtils.atualizaTotais(
          controllerAbstract.produtoCarrinho.notaItem);
      controllerAbstract
          .changeProdutoCarrinho(controllerAbstract.produtoCarrinho);
    } catch (e, s) {
      print(s);
    }
  }
}
