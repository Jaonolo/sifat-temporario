import 'package:flutter/cupertino.dart';

class FontUtils {
  static double aspectRatioPerfeito(BuildContext context) =>
      (MediaQuery.of(context).orientation == Orientation.landscape)
          ? 0.50
          : 0.60;

  /*
    Regra de responsividade

    1- AspectRatio base é 0.60 em modo retrato e 0.30 em modo landsCape
    2- Fonte base é (h1=68 | h2=42 | h3=26 | h4=16)
    3- É calculado a diferença do aspectRatio base com o atual
    3- Para cada 0.10 a mais que haver de diferença deve diminuir 1 da font (Se der negativo irá aumentar a fonte)

  */

  static double h1(BuildContext context) {
    var aspectRatio = MediaQuery.of(context).size.aspectRatio;
    var diffAspectRatio = (aspectRatioPerfeito(context) - aspectRatio) * 10;
    double retorno =
        (MediaQuery.of(context).size.width / 18) + (diffAspectRatio);

    return retorno;
  }

  static double h2(BuildContext context) {
    var aspectRatio = MediaQuery.of(context).size.aspectRatio;
    var diffAspectRatio = (aspectRatioPerfeito(context) - aspectRatio) * 10;
    double retorno =
        (MediaQuery.of(context).size.width / 36) + (diffAspectRatio);

    return retorno;
  }

  static double h3(BuildContext context) {
    var aspectRatio = MediaQuery.of(context).size.aspectRatio;
    var diffAspectRatio = (aspectRatioPerfeito(context) - aspectRatio) * 10;
    double retorno =
        (MediaQuery.of(context).size.width / 45) + (diffAspectRatio);
    return retorno;
  }

  static double h4(BuildContext context) {
    var aspectRatio = MediaQuery.of(context).size.aspectRatio;
    var diffAspectRatio = (aspectRatioPerfeito(context) - aspectRatio) * 10;
    double retorno =
        (MediaQuery.of(context).size.width / 60) + (diffAspectRatio);
    return retorno;
  }

  static void debugFonts(BuildContext context) {
    var aspectRatio = MediaQuery.of(context).size.aspectRatio;
    var diffAspectRatio = (aspectRatioPerfeito(context) - aspectRatio) * 10;
    print(
        'Font H1: ${(MediaQuery.of(context).size.width / 15) + (diffAspectRatio)}');
    print(
        'Font H2: ${(MediaQuery.of(context).size.width / 24) + (diffAspectRatio)}');
    print(
        'Font H3: ${(MediaQuery.of(context).size.width / 38) + (diffAspectRatio)}');
    print(
        'Font H4: ${(MediaQuery.of(context).size.width / 60) + (diffAspectRatio)}');
  }
}
