import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class LoginPageController extends GetxController {
  //------------------------------------------------ Variaveis Observáveis --------------------------------------------------

  final _exibirSenha = false.obs;
  final _usuario = ''.obs;
  final _senha = ''.obs;
  final _recuperaUsuario = ''.obs;

  //------------------------------------------------ VARIAVEIS --------------------------------------------------------------

  String imagemGerada = "";
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController recuperaEmailController = TextEditingController();

  //-------------------------------------------------- Getters/Setters ------------------------------------------------------

  get exibirSenha => _exibirSenha.value;

  set exibirSenha(value) {
    _exibirSenha.value = value;
  }

  get usuario => _usuario.value;

  set usuario(value) {
    _usuario.value = value;
  }

  get senha => _senha.value;

  set senha(value) {
    _senha.value = value;
  }

  get recuperaUsuario => _recuperaUsuario.value;

  set recuperaUsuario(value) {
    _recuperaUsuario.value = value;
  }

  //-------------------------------------------------- FUNCOES --------------------------------------------------------------

  void alterarExibirSenha() {
    exibirSenha = !exibirSenha;
  }

  String? validaEmail(String value) {
    if (GetUtils.isEmail(value)) {
      return null;
    } else {
      return "Insira um e-mail válido";
    }
  }

  String? validaSenha(String value) {
    if (value.isNotEmpty) {
      return null;
    } else {
      return "Insira uma senha válida";
    }
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
      recuperaUsuario = recuperaEmailController.text;
      Get.defaultDialog(
        title: "Sucesso",
        content: const Text(
          "E-mail de recuperação enviado, aguarde pois entraremos em contato!",
          style: TextStyle(color: Colors.green),
        ),
      );
      print("Recuperação do usuário $recuperaUsuario enviada");
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
