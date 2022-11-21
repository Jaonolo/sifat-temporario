import 'package:autoatendimento/app/modules/home/pages/revisao_pedido/revisao_pedido_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/revisao_pedido/widgets/card_item_revisao_pedido.dart';
import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_secundario.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class RevisaoPedidoComponent {
  final RevisaoPedidoController controller = RevisaoPedidoController();
  final VendaController vendaController = Modular.get();

  late BuildContext context;

  initialize(BuildContext context) {
    this.context = context;
  }

  body() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: StyleUtils.fundoTransparencia(),
      ),
      child: Column(
        children: [
          const Expanded(flex: 20, child: AppBarImage()),
          Expanded(flex: 70, child: _pedidos()),
          Expanded(flex: 10, child: _rodape()),
        ],
      ),
    );
  }

  Widget _pedidos() {
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    return Row(
      children: [
        const Expanded(flex: 10, child: SizedBox()),
        Expanded(
          flex: 80,
          child: Column(
            children: [
              Expanded(child: Container()),
              Center(
                child: Text(
                  'CONFIRA SEU PEDIDO',
                  style: TextStyle(fontSize: FontUtils.h1(context)),
                ),
              ),
              Expanded(child: Container()),
              Expanded(
                flex: 90,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Scrollbar(
                      radius: Radius.circular(10),
                      trackVisibility: true,
                      isAlwaysShown: true,
                      child:ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: vendaController.itensLancados.length,
                      itemBuilder: (c, index) {
                        return CardItemRevisaoPedido(index: index);
                      },
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 5, child: Container()),
              Center(
                child: Text(
                  'VALOR TOTAL R\$ ${vendaController.nota.valorTotal!
                      .toStringAsFixed(2)} ',
                  style: TextStyle(
                      fontSize: orientation == Orientation.landscape
                          ? FontUtils.h2(context)
                          : FontUtils.h2(context) * 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(flex: 5, child: Container()),
              BotaoPrimario(descricao: "CONFIRMAR",
                  function: () => controller.confirmar()),
              Expanded(child: Container()),
            ],
          ),
        ),
        const Expanded(flex: 10, child: SizedBox()),
      ],
    );
  }

  Widget _rodape() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BotaoSecundario(
            context: context,
            descricao: "CANCELAR PEDIDO",
            function: () => controller.cancelar()),
        BotaoSecundario(
            context: context,
            descricao: "VOLTAR AO CARDÁPIO",
            function: () => controller.voltarCardapio()),
      ],
    );
  }
}
