import 'package:flutter/material.dart';
import 'package:waycard/config/app_config.dart';
import 'package:models/model/enum/client.dart';

class SobrePageComponent {

//-------------------------------------------------- WIDGETS --------------------------------------------------------------

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Text("Sobre"),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _txtNomeApp(),
        SizedBox(
          height: 8,
        ),
        _txtVersao(),
      ],
    );
  }

  Widget _txtNomeApp() {
    return Text(
      "Waywallet",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _txtVersao() {
    return Text(
      "Versão: ${AppConfig.application.client!.versao}",
      style: TextStyle(fontSize: 18),
      textAlign: TextAlign.center,
    );
  }
}
