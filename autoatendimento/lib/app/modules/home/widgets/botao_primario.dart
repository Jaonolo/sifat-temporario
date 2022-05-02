import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: must_be_immutable
class BotaoPrimario extends StatelessWidget {
  late double widthScreen;
  late double heightScreen;
  final Function()? function;
  String descricao;
  double largura;
  double altura;

  double borderRadius;
  IconData? iconData;

  BotaoPrimario({
    this.function,
    this.descricao = "",
    this.largura = 0.35,
    this.altura = 0.050,
    this.borderRadius = 90.0,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    AppController appController = Modular.get();
    heightScreen = MediaQuery
        .of(context)
        .size
        .height;
    widthScreen = MediaQuery
        .of(context)
        .size
        .width;

    return SizedBox(
      width: widthScreen * largura,
      height: heightScreen * altura,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: (iconData == null)
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.spaceBetween,
          children: [
            Text(descricao,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: FontUtils.h2(context))),
            if (iconData != null)
              Icon(
                iconData,
                size: FontUtils.h2(context),
                color: Colors.white,
              ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: function != null ? DefaultTheme.accentColor : DefaultTheme.cinza,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: () {
          if (function != null) {
            function!.call();
          }
          if (appController.timer != null) {
            //toda vez que aperta reinica o time ocioso da tela
            appController.reiniciaTimer();
          }
        },
      ),
    );
  }
}
