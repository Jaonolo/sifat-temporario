import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/splash/repositories/config_repository.dart';
import 'package:autoatendimento/app/modules/home/pages/splash/splash_controller.dart';
import 'package:autoatendimento/app/utils/autoatendimento_utils.dart';
import 'package:autoatendimento/app/utils/dialog_auto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/string_utils.dart';

part "wizard_controller.g.dart";

class WizardController = WizardBase with _$WizardController;

abstract class WizardBase with Store {
  AppController appController = Modular.get();
  SplashController splashController = Modular.get();
  TextEditingController controllerCNPJ = TextEditingController();
  TextEditingController controllerUrlApi = TextEditingController();
  TextEditingController controllerClientSecret = TextEditingController();

  Future<void> gravar(BuildContext context) async {
    ConfigPropertiesDTO dto = ConfigPropertiesDTO();
    dto.cnpj = StringUtils.removeMascaraInscricaoFederal(controllerCNPJ.text);
    dto.host = 'http://${controllerUrlApi.text}/api';
    dto.hostGateway = 'http://${controllerUrlApi.text}:8081';
    dto.clientSecret = controllerClientSecret.text;
    splashController.inicializaClientPWSSpring();

    ConfigRepository.criaConfiguracao(appController.pwsConfigLocal, dto)
        .then((value) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) =>
              DialogAuto(
                showCancelButton: false,
                title: "Configurações",
                message:
                "O arquivo de configurações foi criado, o aplicativo será reiniciado.",
                txtConfirmar: "OK",
                onConfirm: () {
                  Modular.to.pushReplacementNamed("/");
                },
              ));
    }).catchError((e, s) {
      AutoatendimentoUtils.catchError(e, s, context);
    });
  }
}
