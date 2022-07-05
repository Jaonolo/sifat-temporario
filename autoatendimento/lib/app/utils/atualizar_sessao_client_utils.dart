import 'dart:async';
import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:requester/requester/micro-service/sessao/sessao_client_requester.dart';

import '../modules/home/widgets/dialog_info.dart';

class AtualizarSessaoClientUtils{
  static final AppController _appController = Modular.get();
  static final HomeController homeController = Modular.get();

  static void startAtualizaSessaoClient() {
    _appController.timerAtualizaSessaoClient = Timer.periodic(Duration(minutes: 1), (timer) => _atualizaSessaoClient());
  }

  //Atualiza Sessao Client

  static void _atualizaSessaoClient() {

    SessaoClientRequest.atualizarSessao(
        _appController.pwsConfigGateway, _appController.tokenClient)
        .then((response) async {
      if (response.status == 200) {
        _appController.tokenClient = response.content!.token;
        print('INICIOU ATUALIZA SESSAO');
      } else {
        print('Ocorreu um erro ao atualizar a sessao: ${response.content}');
        dialogInfo(_appController.globalKey.currentContext!, "Ocorreu um erro ao atualizar a sessao");
      }
    }).catchError((e, s) {
      print(e);
    });
  }

  static Future<void> dialogInfo(BuildContext context, String error) {
    //Indepedente do que acontecer ele reinicia o time
    return showDialog(
        context: context,
        builder: (_) => DialogInfo(
              title: "Aconteceu um erro",
              message: error,
              txtCancelar: "Confirmar",
              onCancel: () {
                _appController.timerAtualizaSessaoClient!.cancel();
                _appController.timerTempoOcioso!.cancel();
                Modular.to.pushReplacementNamed("/");
              },
            ));
  }
}