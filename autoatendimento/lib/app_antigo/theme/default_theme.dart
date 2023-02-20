import 'package:flutter/material.dart';
import 'package:utils/utils/hex_color.dart';

class DefaultTheme {
//  static Color icons = Colors.grey;
//  static Color labels = Colors.grey;
//  static Color accentColor = Colors.deepOrange[900];
//  static Color primaryColor = Colors.blue;

  static Color branco = HexColor("#FFFFFF");
  static Color laranja = HexColor("#FF6107");
  static Color vermelho = HexColor("E9290F");
  static Color vinho = HexColor("C40018");
  static Color cinza = HexColor("707070");
  static Color preto = HexColor("292725");

  static Color icons = cinza;
  static Color labels = cinza;
  static Color accentColor = vinho;
  static Color primaryColor = branco;

  static ThemeData get() {
    return ThemeData(
      fontFamily: 'Franklin Gothic',
      primaryColor: primaryColor,
      toggleableActiveColor: accentColor,
      textTheme: TextTheme(
        caption: TextStyle(color: cinza),
        headline1: TextStyle(color: cinza),
        headline2: TextStyle(color: cinza),
        headline3: TextStyle(color: cinza),
        headline4: TextStyle(color: cinza),
        headline5: TextStyle(color: cinza),
        headline6: TextStyle(color: cinza),
        subtitle1: TextStyle(color: cinza),
        subtitle2: TextStyle(color: cinza),
        bodyText1: TextStyle(color: cinza),
        bodyText2: TextStyle(color: cinza),
      ),
      iconTheme: IconThemeData(color: icons),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: accentColor,
        elevation: 8,
      ),
      buttonTheme: ButtonThemeData(
          buttonColor: accentColor, textTheme: ButtonTextTheme.normal),
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: accentColor),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accentColor,
        selectionColor: accentColor,
        selectionHandleColor: accentColor,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor, primary: accentColor),
    );
  }
}
