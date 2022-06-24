import 'package:autoatendimento/app/app_controller.dart';
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

class CardProdutoSelecaoUnica extends StatelessWidget {
  NotaItem notaItem;
  ControllerAbstract controllerAbstract;
  ProdutoMenuComponente produtoMenuComponente;

  CardProdutoSelecaoUnica(
      this.notaItem, this.controllerAbstract, this.produtoMenuComponente);

  late BuildContext context;
  AppController appController = Modular.get();
  HomeController homeController = Modular.get();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return InkWell(
      onTap: () {
        _adicionar.call();
      },
      child: Container(
        height: FontUtils.h1(context),
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: notaItem.quantidade!.compareTo(BigDecimal.ZERO()) > 0
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
    String url_imagem = notaItem.produtoEmpresa!.produto!.imagemPrincipal;
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
        notaItem.descricao!.toUpperCase(),
        style: TextStyle(fontSize: FontUtils.h3(context)),
      ),
    );
  }

  Widget _txtPreco() {
    BigDecimal valorAdicional = notaItem.precoUnitario!;

    if (controllerAbstract.produtoMenu != null &&
        controllerAbstract.produtoCarrinho.notaItem.tipo == "ITEM_COMBO") {
      ProdutoMenuComponenteEmpresa componenteEmpresa =
          produtoMenuComponente.componenteEmpresas.firstWhere(
              (ce) =>
                  ce.idEmpresa ==
                  controllerAbstract
                      .produtoCarrinho.notaItem.produtoEmpresa!.idEmpresa,
              orElse: () =>
                  throw Exception("CompomeenteEmpresa não encontrado"));

      switch (controllerAbstract.produtoMenu!.tipo) {
        case "COMPONENTE_FIXO":
          valorAdicional = produtoMenuComponente
              .getValorComponente(appController.estacaoTrabalho.idEmpresa!,
                  appController.tabelaPreco.id!)!
              .subtrair(NotaItemUtils.verificaDiferencaCombo(
                  controllerAbstract.produtoMenu!,
                  appController.estacaoTrabalho.idEmpresa!,
                  appController.tabelaPreco.id!));
          break;
        case "COMPONENTE_EXTRA":
          valorAdicional = componenteEmpresa.gradeEmpresa!
              .precoVenda(appController.tabelaPreco.id!);
          break;
      }
    }

    return Text(
      '+ R\$ $valorAdicional',
      style: TextStyle(fontSize: FontUtils.h3(context)),
    );
  }

  void _adicionar() {
    try {
      //Se tiver alguns observação ou adicionais abre a tela nova
      bool temMenuObservacao = notaItem.produtoEmpresa!.produto!.menus
          .any((element) => element.tipo == "OBSERVACAO");

      NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
          controllerAbstract.produtoCarrinho.notaItem,
          controllerAbstract.produtoMenu!);

      //Se não localizou um menu lançado, vai criar um novo e add o subitem
      if (menu == null) {
        menu = NotaItemUtils.menuToNotaItem(
            controllerAbstract.produtoCarrinho.notaItem.idNota!,
            controllerAbstract.produtoMenu!);
        notaItem.quantidade = BigDecimal.ONE();
        menu.subitens.add(notaItem);
        controllerAbstract.produtoCarrinho.notaItem.subitens.add(menu);
      } else {
        //Se tem menu, verifica se já tem algum subitem desse componente lançado para remover
        NotaItem? itemJaLancado = NotaItemUtils.localizaSubitemJaLancado(
            controllerAbstract.produtoCarrinho.notaItem,
            controllerAbstract.produtoMenu!,
            produtoMenuComponente);

        if (itemJaLancado != null) menu.subitens.remove(itemJaLancado);

        //Verifica se o menu tem subitens, caso não, remove ele também
        if (menu.subitens.isEmpty) {
          controllerAbstract.produtoCarrinho.notaItem.subitens.remove(menu);
        }

        notaItem.quantidade = BigDecimal.ZERO();
      }

      if (controllerAbstract.produtoCarrinho.notaItem.tipo == "ITEM_COMBO" &&
          (notaItem.produtoEmpresa!.produto!.pacote == "ADICIONAIS" ||
              temMenuObservacao)) {
        homeController
            .addPalco(ProdutoAdicionalPage(ProdutoCarrinho(notaItem)));
        return;
      }

      NotaItemUtils.atualizaTotais(controllerAbstract.produtoCarrinho.notaItem);
      controllerAbstract
          .changeProdutoCarrinho(controllerAbstract.produtoCarrinho);
    } catch (e, s) {
      print(s);
    }
  }
}
