import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/controller/produto_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

class CardProdutoSelecaoUnica extends StatefulWidget {
  final NotaItem notaItem;
  final ProdutoMenu produtoMenu;
  final ProdutoMenuComponente produtoMenuComponente;

  CardProdutoSelecaoUnica(
      this.notaItem, this.produtoMenu, this.produtoMenuComponente);

  @override
  State<CardProdutoSelecaoUnica> createState() =>
      _CardProdutoSelecaoUnicaState();
}

class _CardProdutoSelecaoUnicaState extends State<CardProdutoSelecaoUnica> {
  bool selecionado = false;
  final ProdutoController controller = Modular.get();
  final AppController appController = Modular.get();

  @override
  Widget build(BuildContext c) {
    return _body();
  }

  Widget _body() {
    return InkWell(
      onTap: () {
        _adicionar.call();
      },
      child: Container(
        height: FontUtils.h1(context),
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color:
                  widget.notaItem.quantidade!.compareTo(BigDecimal.ZERO()) > 0
                      ? DefaultTheme.accentColor
                      : DefaultTheme.preto),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Expanded(flex: 20, child: _imagem()),
            Expanded(flex: 60, child: _txtDescricao()),
            Expanded(flex: 15, child: _txtPreco()),
          ],
        ),
      ),
    );
  }

  Widget _imagem() {
    String url_imagem =
        widget.notaItem.produtoEmpresa!.produto!.imagemPrincipal;
    if (url_imagem.isNotEmpty) {
      return Center(
        child: Image.network(
          url_imagem,
          fit: BoxFit.cover,
          width: FontUtils.h1(context) * 1.5,
        ),
      );
    } else {
      return Center(
        child: Icon(
          Icons.image,
          color: DefaultTheme.cinza,
        ),
      );
    }
  }

  Widget _txtDescricao() {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Text(
        widget.notaItem.descricao!.toUpperCase(),
        style: TextStyle(fontSize: FontUtils.h3(context)),
      ),
    );
  }

  Widget _txtPreco() {
    String preco = widget.notaItem.precoUnitario!.toStringAsFixed(2);
    if (controller.tipoPacote.equals(TipoPacote.COMBO)) {
      BigDecimal valorAdicional = BigDecimal.ZERO();
      switch (controller.produtoMenu!.tipo) {
        case "COMPONENTE_FIXO":
          valorAdicional = widget.produtoMenuComponente
              .getValorComponente(
                  appController.servicoAutoAtendimento.idEmpresa!,
                  appController.tabelaPreco.id!)!
              .subtrair(NotaItemUtils.verificaDiferencaCombo(
                  controller.produtoMenu!,
                  appController.servicoAutoAtendimento.idEmpresa!,
                  appController.tabelaPreco.id!));
          break;
        case "COMPONENTE_EXTRA":
          ProdutoMenuComponenteEmpresa componenteEmpresa =
              widget.produtoMenuComponente.componenteEmpresas.firstWhere(
                  (ce) =>
                      ce.idEmpresa ==
                      controller
                          .produtoCarrinho.notaItem.produtoEmpresa!.idEmpresa!,
                  orElse: () => throw Exception("compomente não encotrado"));

          valorAdicional = componenteEmpresa.gradeEmpresa!
              .precoVenda(appController.tabelaPreco.id!);
          break;
      }
      if (valorAdicional.compareTo(BigDecimal.ZERO()) > 0) {
        preco = valorAdicional.toStringAsFixed(2);
      } else {
        preco = "";
      }
    }

    return Text(
      '+ R\$ $preco',
      style: TextStyle(fontSize: FontUtils.h3(context)),
    );
  }

  void _adicionar() {
    try {
      NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
          controller.produtoCarrinho.notaItem, widget.produtoMenu);

      //Se não localizou um menu lançado, vai criar um novo e add o subitem
      if (menu == null) {
        menu = NotaItemUtils.menuToNotaItem(
            controller.produtoCarrinho.notaItem.idNota!, widget.produtoMenu);
        menu.subitens.add(widget.notaItem);
        controller.produtoCarrinho.notaItem.subitens.add(menu);
      } else {
        //Se tem menu, verifica se já tem algum subitem desse componente lançado para remover
        NotaItem? itemJaLancado = NotaItemUtils.localizaSubitemJaLancado(
            controller.produtoCarrinho.notaItem,
            widget.produtoMenu,
            widget.produtoMenuComponente);

        if (itemJaLancado != null) menu.subitens.remove(itemJaLancado);

        if (widget.notaItem.quantidade!.compareTo(BigDecimal.ZERO()) > 0) {
          menu.subitens.add(widget.notaItem);
        } else {
          //Caso a quantidade do item for 0 siginica que está removendo
          //Verifica se o menu tem subitens, caso não, remove ele também
          if (menu.subitens.isEmpty) {
            controller.produtoCarrinho.notaItem.subitens.remove(menu);
          }
        }
      }

      NotaItemUtils.atualizaTotais(controller.produtoCarrinho.notaItem);
      controller.changeProdutoCarrinho(controller.produtoCarrinho);

      setState(() {
        _body();
      });
      //selecao unica ja passa para o proximo menu automatico
      controller.proximo();
    } catch (e, s) {
      print(s);
    }
  }
}
