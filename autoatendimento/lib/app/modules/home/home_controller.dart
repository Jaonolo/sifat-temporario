import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';

part "home_controller.g.dart";

class HomeController = HomeBase with _$HomeController;

abstract class HomeBase with Store {
  final VendaController vendaController = Modular.get();

  @observable
  bool habilitarCarrinho = false;

  @observable
  bool apareceCarrinho = true;

  @observable
  CardapioMenu menuSelecionado = CardapioMenu();

  @observable
  ObservableList<Widget> palco = ObservableList();

  @action
  changeMenuSelecionado(CardapioMenu value) {
    menuSelecionado = value;
  }

  @action
  addPalco(Widget value) {
    palco.add(value);
  }

  @action
  removePalco() {
    palco.removeLast();
  }

  onConfirmar() {
    Modular.to.pushNamed("/revisao");
  }

  @action
  void onMostrarCarrinho() {
    apareceCarrinho = !apareceCarrinho;
  }

  @action
  void recomecar() {
    palco = ObservableList();
    changeMenuSelecionado(CardapioMenu());
    vendaController.descartarNota();
    Modular.to.pushNamed("/comecar");
  }
}
