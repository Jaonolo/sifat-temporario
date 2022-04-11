import 'package:flutter/material.dart';

class DefaultTheme {
  static Color icons = Colors.grey;
  static Color labels = Colors.grey;
  static Color accentColor = Colors.red[900]!;
  static Color accentColorLight = Colors.red[600]!;
  static Color primaryColor = Color.fromARGB(255, 51, 51, 51);

  static ThemeData get() {
    return ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: accentColor,
            selectionColor: accentColor,
            selectionHandleColor: accentColor),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(accentColor),
          fillColor: MaterialStateProperty.all(accentColorLight),
        ),
        primaryColorLight: accentColorLight,
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(color: primaryColor),
        hintColor: Colors.white,
        //cor da label do textFormField sem focus
        focusColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: TextStyle(color: Colors.white),
            //cor da label do textFormField com focus
            iconColor: accentColorLight),
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
            )));
  }
}
