import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BotaoSetaVoltar extends StatelessWidget {
  final Function? function;

  BotaoSetaVoltar({this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: DefaultTheme.accentColor,
        shape: const CircleBorder(),
      ),
      child: Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: FontUtils.h1(context) * 0.8,
      ),
      onPressed: () {
        if (function != null) {
          function!.call();
        } else {
          Modular.to.pop();
        }
      },
    );
  }
}
