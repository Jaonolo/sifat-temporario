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

import '../splash/repositories/cardapio_repository.dart';

class ToqueComecarComponent {
  final ToqueComecarController controller = Modular.get();
  late BuildContext context;
  AppController appController = Modular.get();

  initialize(BuildContext context) {
    _validaCardapio();
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
      onTap: () => {
        appController.timerVerificaProdutos!.cancel(),
        controller.comecar()},
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
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: InkWell(
                child: IconButton(
                  icon: Icon(Icons.settings, color: Colors.white, size: 20),
                  color: Colors.white,
                  onPressed: () => controller.configurar())),
            ),
            const Expanded(
              flex: 64,
              child: SizedBox(),
            ),
            Expanded(
                flex: 19,
                child: Center(
                    child: Text(
                  'TOQUE PARA COMEÇAR',
                  style: TextStyle(
                      color: DefaultTheme.branco,
                      shadows: const [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.grey,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      fontSize: FontUtils.h1(context) * 1.2),
                ))),
            Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                      child: Image.asset(
                    "assets/waychef_autoatendimento3.png",
                    width: FontUtils.h1(context) * 4,
                  )),
                ))
          ],
        ),
      ),
    );
  }

  Future<void> _validaCardapio() async {
    appController.timerVerificaProdutos = Timer.periodic(const Duration(minutes: 3), (timer) async {
      List<CardapioMenu> listCardapioMenu =  await CardapioRepository.atualizaCardapio(
          appController.pwsConfig,
          appController.token,
          appController.listCardapioMenu,
          appController.mapProdutos);
      if(listCardapioMenu.isNotEmpty){
        appController.listCardapioMenu = [];
        appController.listCardapioMenu = listCardapioMenu;
      }

    });
  }
}
