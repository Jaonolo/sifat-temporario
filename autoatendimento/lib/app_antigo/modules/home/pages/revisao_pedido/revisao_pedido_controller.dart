// import 'package:autoatendimento/app/app_controller.dart';
// import 'package:autoatendimento/app/modules/home/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:mobx/mobx.dart';
//
// part "revisao_pedido_controller.g.dart";
//
// class RevisaoPedidoController = RevisaoPedidoBase
//     with _$RevisaoPedidoController;
//
// abstract class RevisaoPedidoBase with Store {
//   HomeController homeController = Modular.get();
//   AppController appController = Modular.get();
//
//   void voltarCardapio() {
//     Modular.to.popUntil(ModalRoute.withName('/home'));
//   }
//
//   void cancelar() {
//     homeController.recomecar();
//   }
//
//   void confirmar() {
//     Modular.to.pushNamed('/viagem');
//   }
// }
