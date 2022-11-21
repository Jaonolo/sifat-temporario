import 'package:autoatendimento/app/modules/home/pages/transacao_tef/transacao_tef_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_secundario.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:autoatendimento/app/utils/dialog_auto.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TransacaoTefComponent {
  final TransacaoTefController controller = Modular.get();
  final VendaController vendaController = Modular.get();

  late BuildContext context;

  initialize(BuildContext context) {
    this.context = context;
  }

 Widget body() {
    return Observer(
      builder: (_) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: StyleUtils.fundoTransparencia(),
          ),
          child: (controller.bufferSitef != null)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(flex: 15, child: AppBarImage()),
                    Expanded(
                      flex: 75,
                      child: Center(
                        child: Text(
                          controller.bufferSitef!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize:  defaultTargetPlatform == TargetPlatform.windows
                            ? FontUtils.h2(context)
                            : 20,
                            color: Colors.black,),
                        ),
                      ),
                    ),
                    Expanded(flex: 10, child: _botaoCancelar()),
                  ],
                )
              : Container(),
        );
      },
    );
  }

  Widget _botaoCancelar() {
    return Observer(builder: (_) {
      if (controller.permiteCancelar) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BotaoSecundario(
                context: context,
                descricao: "CANCELAR",
                function: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => DialogAuto(
                            title: "Cancelar transação",
                            message: "Deseja realmente cancelar a transação ?",
                            txtConfirmar: "SIM",
                            txtCancelar: "NÃO",
                            onConfirm: () => controller.cancelar(),
                          ));
                }),
          ],
        );
      }
      return Container();
    });
  }
}
