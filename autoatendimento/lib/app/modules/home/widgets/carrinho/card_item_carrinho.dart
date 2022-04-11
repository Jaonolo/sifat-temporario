import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_page.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/combo/produto_combo_page.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/dialog_auto.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:utils/utils/nota_item_utils.dart';
import 'package:utils/utils/string_utils.dart';

class CardItemCarrinho extends StatefulWidget {
  final int index;
  final ProdutoCarrinho produtoCarrinho;

  CardItemCarrinho(this.produtoCarrinho, this.index);

  @override
  _CardItemCarrinhoState createState() => _CardItemCarrinhoState();
}

class _CardItemCarrinhoState extends State<CardItemCarrinho> {
  final VendaController vendaController = Modular.get();
  final HomeController homeController = Modular.get();
  late Orientation orientation;
  late double heightBtn;
  late double widthBtn;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this.orientation = MediaQuery
        .of(context)
        .orientation;
    this.heightBtn = orientation == Orientation.landscape
        ? FontUtils.h3(context)
        : FontUtils.h2(context) * 1.4;
    this.widthBtn = orientation == Orientation.landscape
        ? FontUtils.h3(context)
        : FontUtils.h2(context) * 1.4;
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(flex: 8, child: _botaoRemove()),
                Expanded(flex: 4, child: _txtUnidade()),
                Expanded(flex: 8, child: _botaoAdd()),
                Expanded(flex: 54, child: _txtDescricao()),
                Expanded(
                    flex: 12,
                    child: (widget.produtoCarrinho.notaItem.produtoEmpresa!
                        .produto!.pacote ==
                        "NENHUM" ||
                        widget.produtoCarrinho.notaItem.produtoEmpresa!
                            .produto!.grades.isEmpty)
                        ? const SizedBox()
                        : _botaoEditar()),
                Expanded(flex: 14, child: _txtValor()),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
            if (widget.produtoCarrinho.notaItem.subitens.isNotEmpty)
              _txtSubItens(),
          ],
        ),
      ),
    );
  }

  Widget _botaoAdd() {
    return SizedBox(
      height: heightBtn,
      width: widthBtn,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: DefaultTheme.accentColor,
          onPrimary: DefaultTheme.branco,
          elevation: 4.0,
          shape: const CircleBorder(),
        ),
        onPressed: () => widget.produtoCarrinho.adicionar(),
        child: Icon(
          Icons.add,
          size: FontUtils.h3(context),
        ),
      ),
    );
  }

  Widget _txtUnidade() {
    return Observer(builder: (_) {
      String qtde = widget.produtoCarrinho.notaItem.quantidade.toString();
      return Text(
        qtde,
        textAlign: TextAlign.center,
        softWrap: false,
        style: TextStyle(
            color: DefaultTheme.preto, fontSize: FontUtils.h3(context)),
      );
    });
  }

  Widget _botaoRemove() {
    return SizedBox(
      height: heightBtn,
      width: widthBtn,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: DefaultTheme.accentColor,
          onPrimary: DefaultTheme.branco,
          elevation: 4.0,
          shape: const CircleBorder(),
          //splashColor: Colors.grey, Desativado pelo uso do ElevatedButton
        ),
        onPressed: () {
          //se for o ultimo pedido aparece uma dialog de confirmação
          widget.produtoCarrinho.remover(
              ultimoPedido: (index) =>
                  showDialog(
                      context: context,
                      builder: (context) =>
                          DialogAuto(
                            message: "Deseja remover o item do carrinho?",
                            txtConfirmar: "SIM",
                            txtCancelar: "NÃO",
                            onConfirm: () =>
                                vendaController.removerProdutoCarrinho(index),
                            title: '',
                          )));
        },
        child: Icon(
          Icons.remove,
          size: FontUtils.h3(context),
        ),
      ),
    );
  }

  Widget _botaoEditar() {
    double larguraTela = MediaQuery
        .of(context)
        .size
        .width;
    double alturaTela = MediaQuery
        .of(context)
        .size
        .height;

    return orientation == Orientation.landscape
        ? Center(
        child: SizedBox(
            height: alturaTela * 0.1,
            width: larguraTela * 0.1,
            child: IconButton(
              onPressed: onEditar,
              icon: Icon(
                Icons.edit,
                color: Colors.black,
              ),
            )))
        : Center(
      child: SizedBox(
          height: FontUtils.h2(context) * 1,
          width: FontUtils.h2(context) * 8,
          child: ElevatedButton(
            onPressed: onEditar,
            child: Text('EDITAR',
                style: TextStyle(
                    fontSize: FontUtils.h4(context), color: Colors.black)),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90.0),
                  side: const BorderSide(width: 3, color: Colors.grey)),
            ),
          )),
    );
  }

  void onEditar() {
    //caso o item tiver grade botao editar adiciona o palco do cardapio com a grade do produto
    if (widget.produtoCarrinho.notaItem.produtoEmpresa!.gradesAtivas.length >
        1) {
      homeController.habilitarCarrinho = true;
      homeController.addPalco(
          ProdutoAdicionalPage(vendaController.itensLancados[widget.index]));
      return;
    }
    switch (widget.produtoCarrinho.notaItem.produtoEmpresa!.produto!.pacote!
        .toUpperCase()) {
      case "ADICIONAIS":
        homeController.habilitarCarrinho = true;
        homeController.addPalco(
            ProdutoAdicionalPage(vendaController.itensLancados[widget.index]));
        break;
      case "COMBO":
        homeController.habilitarCarrinho = true;
        homeController.addPalco(
            ProdutoComboPage(vendaController.itensLancados[widget.index]));
        break;
    }
  }

  Widget _txtDescricao() {
    return Text(
      "${widget.produtoCarrinho.notaItem.descricao!.toUpperCase()} ",
      style:
      TextStyle(color: DefaultTheme.preto, fontSize: FontUtils.h3(context)),
    );
  }

  Widget _txtValor() {
    return Observer(builder: (_) {
      return Center(
        child: Text(
          'R\$ ${NotaItemUtils.getSubtotal(widget.produtoCarrinho.notaItem)
              .toStringAsFixed(2)}',
          textAlign: TextAlign.end,
          style: TextStyle(
              color: DefaultTheme.preto, fontSize: FontUtils.h3(context)),
        ),
      );
    });
  }

  Widget _txtSubItens() {
    return Row(
      children: [
        Expanded(
          flex: 14,
          child: Container(),
        ),
        Expanded(
          flex: 74,
          child: Wrap(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                StringUtils.montaDescricaoSubItensAuto(
                    (widget.produtoCarrinho.notaItem)),
                style: TextStyle(fontSize: FontUtils.h4(context)),
              ),
            )
          ]),
        ),
        Expanded(
          flex: 12,
          child: Container(),
        )
      ],
    );
  }
}
