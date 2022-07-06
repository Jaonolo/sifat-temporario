import 'dart:async';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/pages/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:requester/requester/micro-service/sessao/sessao_usuario_requester.dart';
import 'package:requester/requester/micro-service/sessao/sessao_client_requester.dart';

class SessaoService {

  static void startAtualizaSessaoClient() {
    AppConfig.timerAtualizaSessaoClient = Timer.periodic(Duration(hours: 4), (timer) => _atualizaSessaoClient());
  }

  static void startAtualizaSessaoUsuario() {
    AppConfig.timerAtualizaSessaoUsuario = Timer.periodic(Duration(minutes: 1), (timer) => _atualizaSessaoUsuario());
  }

  static void stopTimer() {
    if (AppConfig.timerAtualizaSessaoUsuario != null)
      AppConfig.timerAtualizaSessaoUsuario?.cancel();
  }

  //Atualiza Sessao Usuario
  static void _atualizaSessaoUsuario() {
    //Caso tenha dado 401 no caso Credenciais inválidas no FactoryToast.run(e) faz a tratativa para mandar para tela de login
    SessaoUsuarioRequester.atualizarSessao(
            AppConfig.application.pwsConfigGateway, AppConfig.application.tokenUsuario)
        .then((response) async {
      if (response.status == 200) {
        TokenDTO tokenDTO = response.content;
        AppConfig.application.tokenUsuario = tokenDTO.token!;
      } else {
        stopTimer();
        await SessaoUsuarioRequester.encerrarSessao(AppConfig.application.pwsConfigGateway, AppConfig.application.tokenUsuario);
        metodoVoltar();
      }
    });
  }

  //Atualiza Sessao Client
 static void _atualizaSessaoClient() {
    SessaoClientRequest.atualizarSessao(
        AppConfig.application.pwsConfigGateway, AppConfig.application.tokenClient)
        .then((response) async {
      if (response.status == 200) {
        AppConfig.application.tokenClient = response.content!.token;
        print('INICIOU ATUALIZA SESSAO');
      } else {
        print('Ocorreu um erro ao atualizar a sessao: ${response.content}');
        AppConfig.timerAtualizaSessaoClient!.cancel();
        metodoVoltar();
      }
    });
  }

  static Future<void> metodoVoltar() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("manter_logado", false);
    Navigator.pushReplacement( AppConfig.globalContext,
        MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
