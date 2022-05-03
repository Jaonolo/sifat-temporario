import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
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
  final HomeController homeController = Modular.get();

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

    if(preco.isEmpty || preco == "0.00"){
      return SizedBox();
    }

    return Text(
      '+ R\$ $preco',
      style: TextStyle(fontSize: FontUtils.h3(context)),
    );
  }

  void _adicionar() {
    try {
      //Se tiver alguns observação ou adicionais abre a tela nova
      bool temMenuObservacao = widget.notaItem.produtoEmpresa!.produto!.menus
          .any((element) => element.tipo == "OBSERVACAO");

      NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
          controller.produtoCarrinho.notaItem, widget.produtoMenu);

      //Se não localizou um menu lançado, vai criar um novo e add o subitem
      if (menu == null) {
        menu = NotaItemUtils.menuToNotaItem(
            controller.produtoCarrinho.notaItem.idNota!, widget.produtoMenu);
        widget.notaItem.quantidade = BigDecimal.ONE();
        menu.subitens.add(widget.notaItem);
        if (widget.notaItem.produtoEmpresa!.produto!.pacote.equals(TipoPacote.ADICIONAIS) || temMenuObservacao) {
          controller.trocaPalcoParaSubItem(notaItemPai: controller.produtoCarrinho.notaItem, notaItemAtual:  widget.notaItem, produtoMenuPai: widget.produtoMenu);
          return;
        }
        controller.produtoCarrinho.notaItem.subitens.add(menu);
      } else {
        //Se tem menu, verifica se já tem algum subitem desse componente lançado para remover
        NotaItem? itemJaLancado = NotaItemUtils.localizaSubitemJaLancado(
            controller.produtoCarrinho.notaItem,
            widget.produtoMenu,
            widget.produtoMenuComponente);

        if (itemJaLancado != null) menu.subitens.remove(itemJaLancado);

          //Verifica se o menu tem subitens, caso não, remove ele também
          if (menu.subitens.isEmpty) {
            controller.produtoCarrinho.notaItem.subitens.remove(menu);
        }

        widget.notaItem.quantidade = BigDecimal.ZERO();
      }

      NotaItemUtils.atualizaTotais(controller.produtoCarrinho.notaItem);
      controller.changeProdutoCarrinho(controller.produtoCarrinho);
      controller.onLiberaBotaoMenus();

      setState(() {
        _body();
      });
      //selecao unica ja passa para o proximo menu automatico
      // controller.proximo();
    } catch (e, s) {
      print(s);
    }
  }
}
