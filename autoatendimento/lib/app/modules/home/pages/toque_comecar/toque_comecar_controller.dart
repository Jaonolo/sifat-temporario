import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'toque_comecar_controller.g.dart';

class ToqueComecarController = ToqueComecarBase with _$ToqueComecarController;

abstract class ToqueComecarBase with Store {

  void comecar() {
    Modular.to.pushNamed("/home");
  }
  void configurar() {
    Modular.to.pushNamed("/configuracao");
  }
}
