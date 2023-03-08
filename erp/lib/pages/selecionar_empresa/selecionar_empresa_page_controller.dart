import 'package:get/get.dart';
import 'package:models/model/models.dart';

class SelecionarEmpresaPageController extends GetxController {
  //------------------------------------------------ Variaveis Observáveis --------------------------------------------------

  RxBool _temaNoturnoAtivo = false.obs;

  //------------------------------------------------ VARIAVEIS --------------------------------------------------------------
  Empresa _empresaSelecionada = Empresa();

  //-------------------------------------------------- Getters/Setters ------------------------------------------------------

  set setEmpresaSelecionada(Empresa empresa) {
    _empresaSelecionada = empresa;
  }

  get getTemaNoturnoAtivo {
    return _temaNoturnoAtivo.value;
  }

  //-------------------------------------------------- FUNCOES --------------------------------------------------------------

  void mudarTemaNoturno() {
    _temaNoturnoAtivo.value = !_temaNoturnoAtivo.value;
  }

  void voltarTela() {
    Get.back();
  }
}
