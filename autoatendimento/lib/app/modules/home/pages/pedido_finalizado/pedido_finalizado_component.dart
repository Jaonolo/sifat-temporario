import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/pedido_finalizado/pedido_finalizado_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PedidoFinalizadoComponent {
  final PedidoFinalizadoController controller = PedidoFinalizadoController();
  final VendaController vendaController = Modular.get();
  final AppController appController = Modular.get();

  late BuildContext context;

  initialize(BuildContext context) {
    this.context = context;
  }

  body() {
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;
    return Container(
      decoration: BoxDecoration(
        image: StyleUtils.fundoTransparencia(),
      ),
      child: Column(
        children: [
          const Expanded(flex: 15, child: AppBarImage()),
          Expanded(
            flex: 85,
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Text(
                  'PEDIDO FINALIZADO',
                  style: TextStyle(
                      fontSize: orientation == Orientation.landscape
                          ? 35
                          : FontUtils.h1(context)),
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.done,
                  size: FontUtils.h1(context) * 4,
                  color: Colors.green,
                ),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Wrap(children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          appController.clientAutoAtendimento
                              .mensagemFinalAtendimento ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: orientation == Orientation.landscape
                                  ? 20
                                  : FontUtils.h1(context)),
                        ))
                  ]),
                ),

                // Wrap(
                //   children: [
                //     Align(
                //         alignment: Alignment.center,
                //         child: Text(
                //           'RETIRE SEU COMPROVANTE E',
                //           style: TextStyle(fontSize: FontUtils.h2(context)),
                //         )),
                //     Align(
                //         alignment: Alignment.center,
                //         child: Text(
                //           'ACOMPANHE PELO PAINEL DE SENHAS.',
                //           style: TextStyle(fontSize: FontUtils.h2(context)),
                //         ))
                //   ],
                // ),
                Expanded(
                  child: Container(),
                ),
                Text(vendaController.nota.consumo!.senhaAtendimento == null
                    ? 'O NÚMERO DO SEU PEDIDO É'
                    : 'A SENHA DO SEU ATENDIMENTO É'),
                Text(
                  '${vendaController.nota.consumo!.senhaAtendimento == null
                      ? vendaController.nota.consumo!.comanda
                      : vendaController.nota.consumo!.senhaAtendimento}',
                  style: TextStyle(
                      color: DefaultTheme.accentColor,
                      fontSize: orientation == Orientation.landscape
                          ? 25
                          : FontUtils.h1(context) * 3),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                _botaoFazerOutroPedido(),
                Expanded(
                  child: Container(),
                ),
                Text('MUITO OBRIGADO E VOLTE SEMPRE!',
                    style: TextStyle(
                        color: DefaultTheme.accentColor,
                        fontSize: orientation == Orientation.landscape
                            ? FontUtils.h2(context)
                            : FontUtils.h1(context))),
                Expanded(
                  flex: 5,
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _botaoFazerOutroPedido() {
    return BotaoPrimario(
        descricao: 'FAZER OUTRO PEDIDO',
        function: () => controller.fazerOutroPedido());
  }
}
