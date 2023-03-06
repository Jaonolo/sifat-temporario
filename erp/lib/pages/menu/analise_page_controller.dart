import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalisePageController extends GetxController {
  final _menuExibido = double.infinity.obs;
  final _modoNoturno = false.obs;

  String imagemGerada = "";
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  get modoNoturno => _modoNoturno.value;

  get menuExibido => _menuExibido.value;

  set menuExibido(value) {
    _menuExibido.value = value;
  }

  void trocarModoNoturno() {
    _modoNoturno.value = !modoNoturno;
  }

  void exibirMenu(double value) {
    menuExibido = (value != _menuExibido.value) ? value : double.infinity;
  }
}
