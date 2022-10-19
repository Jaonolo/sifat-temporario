import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'bloqueio_administrativo_controller.g.dart';

class BloqueioAdministrativoController = BloqueioAdministrativoBase with _$BloqueioAdministrativoController;
abstract class BloqueioAdministrativoBase with Store {
  @observable
  String senha = "";

  @action
  void formatTyped(String value) {
    if (value == 'LIMPAR') {
      senha = '';
      return;
    }

  void goAdministrativo() {
    Modular.to.pushNamed("/administrativo_tef");
  }

  void voltaInicial(){
    Modular.to.pushNamed("/comecar");
  }

}}