import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part "pedido_viagem_controller.g.dart";

class PedidoViagemController = PedidoViagemBase with _$PedidoViagemController;

abstract class PedidoViagemBase with Store {
  VendaController vendaController = Modular.get();
  HomeController homeController = Modular.get();
  AppController appController = Modular.get();

  void voltarCardapio() {
    Modular.to.popUntil(ModalRoute.withName('/home'));
  }

  void cancelar() {
    homeController.recomecar();
  }

  void selecionaOpcao(String value) {
    vendaController.obsOndePrefereComer = "Onde prefere comer: " + value;
    Modular.to.pushNamed("/home");
  }
}
