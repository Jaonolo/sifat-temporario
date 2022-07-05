import 'package:erp/app/config/application.dart';
import 'package:erp/app/routes/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:models/model/enum/clients.dart';
import 'package:requester/config/pws_config.dart';

class SplashPageComponent {
//-------------------------------------------------- VARIAVEIS ------------------------------------------------------------

//-------------------------------------------------- WIDGETS --------------------------------------------------------------
  Widget body() {
    return Container(
      child: Center(
        child: Text("Iniciando")
      ),
    );
  }

//-------------------------------------------------- FUNCOES --------------------------------------------------------------

  Future initialize({required BuildContext context}) async {
    Application.pwsConfigWaychef = PWSConfig(
        urlBase: "http://api.jose/api", client: Clients.ERP, clientSecret: "");
    Application.pwsConfigGateway = PWSConfig(
        urlBase: "http://api.jose:8081", client: Clients.ERP, clientSecret: "");

    Application.tokenClient = "eyJhbGciOiJIUzUxMiJ9.eyJpZEVzdGFjYW9UcmFiYWxobyI6IjE3OSIsImlkU2Vzc2FvIjoiN2RiYWZkZTQtMWMyMC00YjVlLWI3ZmUtNmY4MWQxMGIyNmRlIiwiY2xpZW50IjoiV0FJVEVSIiwiaWRFbXByZXNhIjoiMTY0IiwiZXhwIjoxNjU2OTc4NTY1LCJpYXQiOjE2NTY5NjQxNjV9.Y9DxZ-lB5tibEeJNX6KogBU7ZE185VxmTlfRo6EYq3H6wUDR3lxmZP2TvJhB97WtSb5bre-uOJPackGikRtjYw";

    await Future.delayed(Duration(seconds: 1));


    navigatorKey.currentState?.pushNamed('/sessao');
  }
}
