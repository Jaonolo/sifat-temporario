import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/controller/produto_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/enum/tipo_botao.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

class PalcoProdutoGenerico extends StatefulWidget {
  final ProdutoCarrinho produtoCarrinho;
  final Widget conteudoPrincipal;

  PalcoProdutoGenerico(this.produtoCarrinho, this.conteudoPrincipal);

  @override
  State<PalcoProdutoGenerico> createState() => _PalcoProdutoGenericoState();
}

class _PalcoProdutoGenericoState extends State<PalcoProdutoGenerico> {
  final HomeController homeController = Modular.get();
  final ProdutoController controller = Modular.get();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(),
        ),
        Expanded(
          flex: 96,
          child: _card(),
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
      ],
    );
  }

  Widget _card() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 90,
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Expanded(flex: 10, child: _cabecalhoCard()),
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  flex: 74,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: widget.conteudoPrincipal,
                  ),
                ),
                Expanded(flex: 15, child: _rodapeCard()),
                const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }

  Widget _cabecalhoCard() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Observer(builder: (_) {
            return BotaoSetaVoltar(
              function: (controller.anteriorMenu == null)
                  ? () {
                      homeController.removePalco();
                      homeController.habilitarCarrinho = false;
                    }
                  : () => controller.anterior(),
            );
          }),
        ),
        Align(alignment: Alignment.center, child: _title()),
      ],
    );
  }

  Widget _title() {
    return InkWell(
        //################# DEBUG ################################
        // onTap: () {
        //   print('------- ${controller.produtoCarrinho.notaItem.descricao}  + quantidade ${controller.produtoCarrinho.notaItem.quantidade}-------');
        //   controller.produtoCarrinho.notaItem.subitens.forEach((element) {
        //     print('-- ${element.descricao}');
        //     element.subitens.forEach((itemCombo) {
        //       print(
        //           '---- ${itemCombo.descricao}  |qtde: ${itemCombo.quantidade}|unitario: ${itemCombo.precoUnitario}|total: ${itemCombo.precoTotal}|');
        //     });
        //   });
        // },
        child: Text(
      controller.produtoCarrinho.notaItem.descricao!,
      style: TextStyle(
        fontSize: FontUtils.h2(context),
      ),
    ));
  }

  Widget _rodapeCard() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                Expanded(child: _txtSubTotal()),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const Expanded(flex: 20, child: SizedBox()),
              Expanded(flex: 60, child: _botaoNavegacao()),
              const Expanded(flex: 20, child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _botaoNavegacao() {
    return Observer(builder: (_) {
      return controller.tipoBotaoMenus.botaoPronto(context, controller);
    });
  }

  Widget _txtSubTotal() {
    if (controller.tipoPacote.equals(TipoPacote.ADICIONAIS)) {
      return Observer(builder: (_) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Text(
                    'SUBTOTAL R\$ ${controller.produtoCarrinho.notaItem.precoTotal!.somar(NotaItemUtils.calcularAdicionais(controller.produtoCarrinho.notaItem)).toStringAsFixed(2)}',
                    softWrap: false,
                    style: TextStyle(fontSize: FontUtils.h2(context)))),
          ],
        );
      });
    }
    return SizedBox();
  }
}
