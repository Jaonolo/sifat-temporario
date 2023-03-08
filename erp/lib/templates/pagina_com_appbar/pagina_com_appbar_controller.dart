import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:math';

class PaginaComAppBarController extends GetxController {
  final _menuExibido = double.infinity.obs;
  final _modoNoturno = false.obs;

  get modoNoturno => _modoNoturno.value;

  get menuExibido => _menuExibido.value;

  set menuExibido(value) {
    _menuExibido.value = value;
  }

  void trocarModoNoturno() {
    _modoNoturno.value = !modoNoturno;
  }

  void exibirMenu(int value) {
    menuExibido = (value != _menuExibido.value) ? value : double.infinity;
  }

  double larguraLimitada(context, largura) {
    return min((MediaQuery.of(context).size.width / 1440) * largura, largura);
  }
}
