import 'package:autopesagem/config/app_config.dart';

import 'package:flutter/material.dart';
import 'package:requester/config/pws_config.dart';

class AutoPesagemUtils {
  static void criarClientPWSWaychef(String url) {
    //Seta na appConfig
    //Caso tenha uma nova url cria o client a partir dessa nova url e fica por responsabilidade da chamada salvar a url
    AppConfig.application.pwsConfigWaychef = PWSConfig(
        urlBase: "http://$url/api",
        client: AppConfig.application.client!,
        clientSecret: AppConfig.clientSecret);
  }

  static void criarClientPWSGateway(String url) {
    //Seta na appConfig
    //Caso tenha uma nova url cria o client a partir dessa nova url e fica por responsabilidade da chamada salvar a url
    AppConfig.application.pwsConfigGateway = PWSConfig(
        urlBase: "http://$url",
        client: AppConfig.application.client!,
        clientSecret: AppConfig.clientSecret);
  }

  static void criaComunicacaoBalanca() {
    AppConfig.pwsUtils = PWSConfig(
        urlBase: "http://localhost:3030",
        client: AppConfig.application.client!,
        clientSecret: AppConfig.clientSecret);
  }

  static showProgress(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ));
  }

  static closeProgress(BuildContext context) {
    Navigator.pop(context);
  }
}
