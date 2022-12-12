import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_theme.dart';


class WidgetsUtils{


  static snackBarError(String titulo, String mensagem){
    return Get.snackbar(
        titulo, mensagem,
        backgroundColor: AppTheme.cancel,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.close, color: Colors.white),
        maxWidth: 300);
  }

  static snackBarSucesso(String titulo, String mensagem){
    return Get.snackbar(
        titulo, mensagem,
        backgroundColor: AppTheme.confirm,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.check, color: Colors.white),
        maxWidth: 300);
  }

}