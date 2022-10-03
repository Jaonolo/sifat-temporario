import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'configuracao_controller.g.dart';

class ConfiguracaoController = ConfiguracaoBase with _$ConfiguracaoController;

abstract class ConfiguracaoBase with Store {
  void goAdministrativo() {
    Modular.to.pushNamed("/administrativo_tef");
  }
  void goPendenciaFiscal() {
    Modular.to.pushNamed("/pendencia_fiscal");
  }
}
