import 'package:autoatendimento/app/modules/home/pages/splash/splash_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_secundario.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:utils/utils/funcoes.dart';

class SplashComponent {
  SplashController controller = Modular.get();
  late BuildContext _context;

  Widget body(BuildContext c) {
    _context = c;
    Orientation orientation = MediaQuery
        .of(c)
        .orientation;

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: DefaultTheme.vinho,
      child: Column(
        children: [
          Expanded(child: Container()),
          Row(
            children: [
              Expanded(child: Container()),
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/waychef_autoatendimento_inicio.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Observer(builder: (_) {
                    if (controller.status.isNotEmpty) {
                      return Text(controller.status,
                          style: TextStyle(
                              fontSize: orientation == Orientation.landscape
                                  ? FontUtils.h2(c)
                                  : FontUtils.h3(c),
                              color: DefaultTheme.branco));
                    }
                    return Container();
                  }),
                ),
                Observer(
                  builder: (_) {
                    if (controller.status.contains(controller.erro_base)) {
                      return const SizedBox();
                    }
                    return SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                            strokeWidth: 10,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                DefaultTheme.branco)));
                  },
                ),
                _botaoDetalhesErro(),
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget _botaoDetalhesErro() {
    return Observer(builder: (_) {
      if (controller.botaoDetalhesErro) {
        return BotaoSecundario(
            context: _context,
            descricao: 'Detalhes',
            function: () {
              return Funcoes.showError(_context, controller.exception);
            });
      }
      return const SizedBox();
    });
  }
}
