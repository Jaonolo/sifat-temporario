import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part "cpf_controller.g.dart";

class CPFController = CPFBase with _$CPFController;

abstract class CPFBase with Store {
  VendaController vendaController = Modular.get();
  HomeController homeController = Modular.get();
  AppController appController = Modular.get();

  @observable
  String cpf = "";

  @action
  void formatTyped(String value) {
    if (value == 'LIMPAR') {
      cpf = '';
      return;
    }

    if (cpf.length < 11) cpf += value;
  }

  @action
  void limpaCampo() {
    cpf = '';
    return;
  }

  @action
  void backspace() {
    cpf = cpf.substring(0, cpf.length - 1);
  }

  void voltarCardapio() {
    Modular.to.popUntil(ModalRoute.withName('/home'));
  }

  void cancelar() {
    homeController.recomecar();
  }

  void confirmarCPF() {
    vendaController.nota.consumidorDocumento = cpf;
    avancar();
  }

  void avancar() {
    Modular.to.pushNamed("/pagamento");
  }

  bool cpfValido() {
    bool cpfValido = false;
    if (cpf.length == 11) {
      cpfValido = CPFValidator.isValid(cpf);
    }
    return cpfValido;
  }
}
