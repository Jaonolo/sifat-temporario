import 'dart:async';

import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';

part "pedido_finalizado_controller.g.dart";

class PedidoFinalizadoController = PedidoFinalizadoBase
    with _$PedidoFinalizadoController;

abstract class PedidoFinalizadoBase with Store {
  final HomeController homeController = Modular.get();
  final VendaController vendaController = Modular.get();
  final AppController appController = Modular.get();

  late Timer timer;

  void tempoEspera() {
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      timer.cancel();
      homeController.recomecar();
    });
  }

  @action
  void fazerOutroPedido() {
    timer.cancel();
    homeController.palco = ObservableList();
    homeController.changeMenuSelecionado(CardapioMenu());
    vendaController.descartarNota();
    Modular.to.popAndPushNamed("/home");
  }
}
