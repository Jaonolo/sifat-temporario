import 'package:autoatendimento/app/modules/home/pages/configuracao/configuracao_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfiguracaoPageComponent {
  ConfiguracaoController controller = Modular.get();
  late Orientation orientation;

  Widget body() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: StyleUtils.fundoTransparencia(),
      ),
      child: Column(
        children: [
          Expanded(flex: 15, child: const AppBarImage()),
          Row(
            children: [
              Expanded(
                flex: 20,
                child: _cardOpcao(Icon(Icons.card_giftcard),
                    "TEF ADMINISTRATIVO", () => controller.goAdministrativo()),
              ),
              Expanded(
                flex: 20,
                child: _cardOpcao(Icon(Icons.adjust), "PENDENCIA FISCAL",
                    () => controller.goPendenciaFiscal()),
              ),
            ],
          ),
          Expanded(flex: 65, child: SizedBox()),
        ],
      ),
    );
  }

  Widget _cardOpcao(Icon icon, String texto, Function onpressed) {
    return SizedBox(
      width: 20,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: DefaultTheme.accentColor,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(40.0),
          ),
        ),
        child: Column(
          children: [
            Expanded(flex: 10, child: Container()),
            Expanded(flex: 60, child: icon),
            Expanded(
              flex: 4,
              child: Container(),
            ),
            Expanded(
                flex: 20,
                child: Text(texto,
                    style: TextStyle(color: Colors.white, fontSize: 10.00))),
            Expanded(flex: 6, child: Container()),
          ],
        ),
        onPressed: onpressed(),
      ),
    );
  }
}
