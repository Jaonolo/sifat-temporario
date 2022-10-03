import 'package:autoatendimento/app/app_controller.dart';
import 'package:flutter/material.dart';

import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: must_be_immutable
class BotaoSecundario extends StatelessWidget {
  double? _widthScreen;
  double? _heightScreen;
  final Function()? function;
  String? descricao;
  double largura = 0.35;
  double altura = 0.050;
  BuildContext context;
  Color colorText;

  BotaoSecundario({
    this.function,
    this.descricao,
    this.largura = 0.35,
    this.altura = 0.050,
    required this.context,
    this.colorText = Colors.black,

  }) {
    _heightScreen = MediaQuery
        .of(context)
        .size
        .height;
    _widthScreen = MediaQuery
        .of(context)
        .size
        .width;
  }

  @override
  Widget build(BuildContext context) {
    AppController appController = Modular.get();
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    return SizedBox(
      width: _widthScreen! * largura,
      height: _heightScreen! * altura,
      child: ElevatedButton(
        child: Text(descricao!,
            style: TextStyle(color: colorText,
                fontSize: orientation == Orientation.landscape
                    ? FontUtils.h2(context)
                    : FontUtils.h3(context))),
        onPressed: () {
          if (function != null) {
            function!.call();
          }
          if (appController.timer != null) {
            //toda vez que aperta reinica o time ocioso da tela
            appController.reiniciaTimer();
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90.0),
              side: BorderSide(width: 3, color: DefaultTheme.accentColor)),
        ),
      ),
    );
  }
}
