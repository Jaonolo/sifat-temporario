import 'dart:async';

import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/configuracao/configuracao_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/toque_comecar/toque_comecar_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:models/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:collection/collection.dart';
import 'package:google_fonts/google_fonts.dart';

import '../splash/repositories/cardapio_repository.dart';

class ToqueComecarComponent {
  final ToqueComecarController controller = Modular.get();
  late BuildContext context;
  AppController appController = Modular.get();

  initialize(BuildContext context) {
    this.context = context;
  }

  Widget body() {
    final position = MediaQuery.of(context).orientation;
    String image = '';
    ArquivoAutoAtendimento? first;
    if (appController.servicoAutoAtendimento.arquivos.length == 1) {
      first = appController.servicoAutoAtendimento.arquivos.first;
    } else if (position == Orientation.landscape) {
      first = appController.servicoAutoAtendimento.arquivos.firstWhereOrNull(
          (element) => VisaoFoto.LANDSCAPE.equals(element.visaoFoto!));
    } else {
      first = appController.servicoAutoAtendimento.arquivos.firstWhereOrNull(
          (element) => VisaoFoto.PORTRAIT.equals(element.visaoFoto!));
    }

    if (first != null) {
      image = first.link!;
    }

    return InkWell(
      onTap: () => {controller.comecar()},
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.4), BlendMode.softLight),
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Container(),
              // child:
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Expanded(
              //       child: Container(),
              //     ),
              //     InkWell(
              //       onTap: () {
              //         controller.configurar();
              //       },
              //       child: Image.asset(
              //         'assets/setting.png',
              //       ),
              //     ),
              //   ],
              // ),
            ),
            // ),
            Column(
              children: [
                Container(
                  child: Transform.scale(
                    scale: 1.1,
                    child: Image.asset('assets/way_chef_inicio.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 58),
                  child: Stack(
                    children: [
                      Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromRGBO(249, 77, 24, 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Toque na tela para começar',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 41,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                      FractionalTranslation(
                        translation: Offset(4.1, 0.65),
                        child: Image.asset('assets/hand.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _validaCardapio() async {
    appController.timerVerificaProdutos =
        Timer.periodic(const Duration(minutes: 3), (timer) async {
      List<CardapioMenu> listCardapioMenu =
          await CardapioRepository.atualizaCardapio(
              appController.pwsConfig,
              appController.token,
              appController.listCardapioMenu,
              appController.mapProdutos);
      if (listCardapioMenu.isNotEmpty) {
        appController.listCardapioMenu = [];
        appController.listCardapioMenu = listCardapioMenu;
      }
    });
  }
}
