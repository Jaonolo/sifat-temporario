import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/abstract/controller_abstract.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/card_produto_extra.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/card_produto_observacao_checkbox.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/card_produto_observacao_radio.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/card_produto_selecao_unica.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

class ListViewCompomentes extends StatelessWidget {
  final ControllerAbstract controllerAbstract;

  ListViewCompomentes(this.controllerAbstract);

  final AppController appController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if(controllerAbstract.produtoMenu == null)
        return SizedBox();

      return SingleChildScrollView(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controllerAbstract.produtoMenu!.componentes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: devolveCardProdutoCompomente(index),
              );
            }),
      );
    });
  }

  //veriica se é menu extra ou observaçao
  Widget devolveCardProdutoCompomente(int index) {
    ProdutoMenuComponente compomente =
        controllerAbstract.produtoMenu!.componentes[index];

    NotaItem? notaItem = criaNotaItem(index);

    switch (controllerAbstract.produtoMenu!.tipo) {
      case "OBSERVACAO":
        if (validaQuantidadeIgualUm)
          return CardProdutoObservacaoRadio(
              controllerAbstract, compomente, index);
        else
          return CardProdutoObservacaoCheckbox(
              notaItem, controllerAbstract, compomente);
      case "COMPONENTE_EXTRA":
      case "COMPONENTE_FIXO":
        if (validaQuantidadeIgualUm)
          return CardProdutoSelecaoUnica(
              notaItem!, controllerAbstract, compomente);
        else
          return CardProdutoExtra(notaItem!, compomente, controllerAbstract);
      default:
        throw Exception(
            controllerAbstract.produtoMenu!.tipo! + " não implementado");
    }
  }

  bool get validaQuantidadeIgualUm =>
      (controllerAbstract.produtoMenu!.quantidadeMinima! <= 1 &&
          controllerAbstract.produtoMenu!.quantidadeMaxima! <= 1);

  NotaItem? criaNotaItem(int index) {
    NotaItem? notaItem;
    switch (controllerAbstract.produtoMenu!.tipo) {
      case "OBSERVACAO":
        notaItem = NotaItemUtils.localizaObservacaoJaLancada(
            controllerAbstract.produtoCarrinho.notaItem,
            controllerAbstract.produtoMenu!,
            controllerAbstract.produtoMenu!.componentes[index]);
        break;

      case "COMPONENTE_EXTRA":
        //Verifica se já tem algum subitem desse componente lançado no item principal
        notaItem = NotaItemUtils.localizaSubitemJaLancado(
            controllerAbstract.produtoCarrinho.notaItem,
            controllerAbstract.produtoMenu!,
            controllerAbstract.produtoMenu!.componentes[index]);

        if (notaItem == null)
          switch (controllerAbstract
              .produtoCarrinho.notaItem.produtoEmpresa!.produto!.pacote) {
            case TipoPacote.ADICIONAIS:
            case TipoPacote.COMBO:
            case TipoPacote.COMPOSTO:
              notaItem = NotaItemUtils.adicionalToNotaItem(
                  controllerAbstract.produtoCarrinho.notaItem.idNota!,
                  controllerAbstract.produtoMenu!.componentes[index],
                  controllerAbstract
                      .produtoCarrinho.notaItem.produtoEmpresa!.idEmpresa!,
                  appController.tabelaPreco.id!,
                  quantidade: BigDecimal.ZERO());
              break;
            default:
              throw Exception(
                  "TipoPacote: ${controllerAbstract.produtoCarrinho.notaItem.produtoEmpresa!.produto!.pacote} não implementado");
          }
        break;

      case "COMPONENTE_FIXO":
        //Verifica se já tem algum subitem desse componente lançado no item principal
        notaItem = NotaItemUtils.localizaSubitemJaLancado(
            controllerAbstract.produtoCarrinho.notaItem,
            controllerAbstract.produtoMenu!,
            controllerAbstract.produtoMenu!.componentes[index]);

        if (notaItem == null) {
          switch (controllerAbstract
              .produtoCarrinho.notaItem.produtoEmpresa!.produto!.pacote) {
            case TipoPacote.COMBO:
              notaItem = NotaItemUtils.itemComboToNotaItem(
                  controllerAbstract.produtoCarrinho.notaItem.idNota!,
                  controllerAbstract.produtoMenu!.componentes[index],
                  controllerAbstract
                      .produtoCarrinho.notaItem.produtoEmpresa!.idEmpresa!,
                  appController.tabelaPreco.id!,
                  quantidade: BigDecimal.ZERO());
              break;
            case TipoPacote.COMPOSTO:
              notaItem = NotaItemUtils.itemCompostoToNotaItem(
                  controllerAbstract.produtoCarrinho.notaItem.idNota!,
                  controllerAbstract.produtoMenu!.componentes[index],
                  controllerAbstract
                      .produtoCarrinho.notaItem.produtoEmpresa!.idEmpresa!,
                  appController.tabelaPreco.id!,
                  quantidade: BigDecimal.ZERO());
              break;
            case TipoPacote.ADICIONAIS:
              throw Exception(
                  "TipoPacote ADICIONAIS não deveria ter COMPONENTE_FIXO");
            default:
              throw Exception(
                  controllerAbstract.produtoMenu!.tipo! + " não implementado");
          }
        }
        break;
    }

    //Caso seja observacao não cria notaItem ele cria dentro do card ao apertar, caso não tenha lançado
    if (notaItem == null &&
        controllerAbstract.produtoMenu!.tipo != "OBSERVACAO")
      throw Exception(
          "NotaItem do compomente ${controllerAbstract.produtoMenu!.componentes[index]}, não foi criado corretamente!");

    return notaItem;
  }
}
