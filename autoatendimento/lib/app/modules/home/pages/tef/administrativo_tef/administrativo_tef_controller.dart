import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'administrativo_tef_controller.g.dart';

class AdministrativoTefController = AdministrativoTefBase with _$AdministrativoTefController;

abstract class AdministrativoTefBase with Store {

  void cancelamentoTef() {
    Modular.to.pushNamed("/cancelamento_tef");
  }
}