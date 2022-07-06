import 'package:erp/app/services/navigation_service.dart';
import 'package:erp/locator.dart';
import 'package:flutter/material.dart';

class SnackBarUtils{

  static void exibir(String msg){
    SnackBar snackBar = SnackBar(
      duration: Duration(seconds: 15),
      content: Text(msg),
    );


    locator<NavigationService>().snackbarGlobalKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}