import 'package:flutter/material.dart';

class DefaultTheme {
  static Color icons = Colors.grey;
  static Color labels = Colors.grey;
  static Color accentColor = Colors.deepOrange;
  static Color primaryColor = Color.fromARGB(255, 51, 51, 51);

  static ThemeData get() {
    return ThemeData.dark().copyWith(
      accentColor: accentColor,
      colorScheme: ColorScheme.dark(
        primary: accentColor, //cor primaria do app
        secondary: Colors.white,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: accentColor,
        cursorColor: accentColor,
        selectionHandleColor: accentColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black12),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.white, //cor do texto do botao
        ),
      )),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.white, //cor do texto do botao
        ),
      )),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        //cor da label do textFormField
        suffixStyle: TextStyle(color: accentColor),
        //cor do icone
        prefixStyle: TextStyle(color: accentColor),
        //cor do icone
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: accentColor), //focus do textFormField
        ),
      ),
      primaryColor: primaryColor,
      toggleableActiveColor: accentColor,
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
    );
  }
}
