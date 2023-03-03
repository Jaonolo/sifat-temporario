import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class LoginPageController extends GetxController {
  //------------------------------------------------ Variaveis Observáveis --------------------------------------------------

  final _menuExibido = double.infinity.obs;
  final _darkMode = false.obs;

  //------------------------------------------------ VARIAVEIS --------------------------------------------------------------

  String imagemGerada = "";
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController recuperaEmailController = TextEditingController();

  //-------------------------------------------------- Getters/Setters ------------------------------------------------------

  get darkMode => _darkMode.value;

  get menuExibido => _menuExibido.value;

  set menuExibido(value) {
    _menuExibido.value = value;
  }

  //-------------------------------------------------- FUNCOES --------------------------------------------------------------

  void changeDarkMode() {
    _darkMode.value = !darkMode;
  }

  void exibirMenu(double value) {
    menuExibido = (value != _menuExibido.value) ? value : double.infinity;
  }

  //TODO: Finalizar validação de usuario na API
  void validaLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (isValid) {
      Get.toNamed(Routes.PLATAFORMA_CONTRATOS_INTEGRADOR_EXTRA);
      print("Email e senha válidos!");
    } else {
      print("Email e senha inválidos!");
    }
  }

  //TODO: Finalizar envio de recuperação na API
  void enviaEmailRecuperacao() {
    if (GetUtils.isEmail(recuperaEmailController.text)) {
      //recuperaUsuario = recuperaEmailController.text;
      Get.defaultDialog(
        title: "Sucesso",
        content: const Text(
          "E-mail de recuperação enviado, aguarde pois entraremos em contato!",
          style: TextStyle(color: Colors.green),
        ),
      );
      //print("Recuperação do usuário $recuperaUsuario enviada");
    } else {
      print("Teste: ${recuperaEmailController.text}");
      Get.defaultDialog(
        title: "Erro",
        content: const Text(
          "E-mail Inválido!",
          style: TextStyle(color: Colors.red),
        ),
      );
    }
  }
}
