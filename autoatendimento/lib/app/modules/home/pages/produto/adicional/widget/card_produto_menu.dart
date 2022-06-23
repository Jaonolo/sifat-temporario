import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/card_produto_extra.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/card_produto_observacao_checkbox.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/card_produto_observacao_radio.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

class CardProdutoMenu extends StatefulWidget {

  @override
  _CardProdutoMenuState createState() => _CardProdutoMenuState();
}

class _CardProdutoMenuState extends State<CardProdutoMenu> {
  final AppController appController = Modular.get();
  final ProdutoAdicionalController produtoAdicionalController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Center(
                  child: Text(
                    produtoAdicionalController.produtoMenu!.descricao!.toUpperCase(),
                style: TextStyle(
                    fontSize: FontUtils.h3(context)),
              )),
              _mostrarQuantidade(),
              _listGenerate(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mostrarQuantidade() {
    if (produtoAdicionalController.produtoMenu!.tipo == 'COMPONENTE_EXTRA' &&
        produtoAdicionalController.produtoMenu!.quantidadeMaxima != 0)
      return Center(
        child: Text(
            (produtoAdicionalController.produtoMenu!.quantidadeMaxima == 1)
                ? 'Escolha no máximo ${produtoAdicionalController.produtoMenu!.quantidadeMaxima} opção'
                : (produtoAdicionalController.produtoMenu!.quantidadeMaxima! > 1)
                    ? 'Escolha no máximo ${produtoAdicionalController.produtoMenu!.quantidadeMaxima} opções'
                    : '',
            style: TextStyle(fontSize: FontUtils.h4(context))),
      );
    else
      return Container();
  }

  Widget _listGenerate() {
    return Observer(
      builder: (_) {
        return Column(
            children: List.generate(produtoAdicionalController.produtoMenu!.componentes.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: _extraOuObservacao(index),
          );
        }));
      }
    );
  }

  //veriica se é menu extra ou observaçao
  _extraOuObservacao(int index) {
    NotaItem? notaitem;
    switch (produtoAdicionalController.produtoMenu!.tipo) {
      case "OBSERVACAO":
        if (produtoAdicionalController.produtoMenu!.quantidadeMinima! <= 1 &&
            produtoAdicionalController.produtoMenu!.quantidadeMaxima! <= 1)
          return CardProdutoObservacaoRadio(
              produtoAdicionalController.produtoMenu!, produtoAdicionalController.produtoMenu!.componentes[index], index);
        else
          return CardProdutoObservacaoCheckbox(
              produtoAdicionalController.produtoMenu!, produtoAdicionalController.produtoMenu!.componentes[index]);

      case "COMPONENTE_EXTRA":
        //Verifica se já tem algum subitem desse componente lançado no item principal
        notaitem = NotaItemUtils.localizaSubitemJaLancado(
            produtoAdicionalController.produtoCarrinho.notaItem,
            produtoAdicionalController.produtoMenu!,
            produtoAdicionalController.produtoMenu!.componentes[index]);

        if (notaitem == null)
          notaitem = NotaItemUtils.adicionalToNotaItem(
              produtoAdicionalController.produtoCarrinho.notaItem.idNota!,
              produtoAdicionalController.produtoMenu!.componentes[index],
              produtoAdicionalController
                  .produtoCarrinho.notaItem.produtoEmpresa!.idEmpresa!,
              appController.tabelaPreco.id!,
              quantidade: BigDecimal.ZERO());

        return CardProdutoExtra(notaitem, produtoAdicionalController.produtoMenu!,
            produtoAdicionalController.produtoMenu!.componentes[index]);
    }
  }
}
