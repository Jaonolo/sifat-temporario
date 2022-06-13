import 'dart:async';

import 'package:autopesagem/config/app_config.dart';
import 'package:autopesagem/utils/auto_pesagem_utils.dart';
import 'package:flutter/material.dart';
import 'package:models/model/enum/client.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/driver_impressora_requester.dart';
import 'package:requester/requester/servico_auto_pesagem_requester.dart';
import 'package:requester/requester/usuario_requester.dart';

part "splash_controller.g.dart";

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  Function onSucess = () {};
  Function(String value) onErrorLogin = (_) {};

  void verificaDadosConexao(Function onSucess, Function(String value) onError) {
    this.onSucess = onSucess;
    this.onErrorLogin = onError;

    //Verifica se possui os dados
    if (AppConfig.urlApiWaychef.isEmpty || AppConfig.clientSecret.isEmpty) {
      onErrorLogin.call("Por favor, informe os dados!");
    } else {
      realizaLogin();
    }
  }

  Future<void> realizaLogin() async {
    try {
      //Configura PWSWAYCEHF
      AutoPesagemUtils.criarClientPWSWaychef(AppConfig.urlApiWaychef);

      //Configura PWSGATEWAY
      AutoPesagemUtils.criarClientPWSGateway(AppConfig.urlApiGateway);

      //Cria a comunicação com a balança
      AutoPesagemUtils.criaComunicacaoBalanca();

      //Cria Sessao client
      print('UrlGateway: ' + AppConfig.urlApiGateway);

      //Login
      await login();

      //Carrega Drivers da impressora
      await carregaDrivers();

      //Verifica se imprime e se lançaautomatico
      await verificaConfigEstacao();

      //Rotina de atualiza sessao
      AppConfig.timerAtualizaSessao =
          Timer.periodic(Duration(seconds: 30), _atualizaSessao);

      //Deu tudo certo manda para tela de home
      onSucess.call();
    } catch (error, stackTrace) {
      print(stackTrace);
      if (error is PwsException) {
        onErrorLogin.call(error.pws!.message!);
        return;
      }
      onErrorLogin.call("Occoreu um erro ao realizar o login");
    }
  }

  Future<void> login() async {
    await ServicoAutoPesagemRequester.login(
        AppConfig.application.pwsConfigWaychef,
        AppConfig.token,
        AppConfig.clientSecret,
        AppConfig.application.client!
            .clientKey,
        //Client error // !AppConfig.application.app.client.clientKey - ANTES
        AppConfig.nomeEstacao)
        .then((response) {
      if (response.status == 200) {
        //Seta na application
        LoginAutoPesagemDTO loginAutoPesagemDTO = response.content;
        AppConfig.servicoAutoPesagem = loginAutoPesagemDTO.servicoAutoPesagem!;
        AppConfig.estacaoTrabalho = loginAutoPesagemDTO.estacaoTrabalho!;
        AppConfig.empresa = loginAutoPesagemDTO.empresa!;
        AppConfig.token = loginAutoPesagemDTO.servicoAutoPesagem!.token!;
        AppConfig.impressoraPadrao = AppConfig.estacaoTrabalho.impressoras
            .firstWhere((e) =>
        e.relatorio!.contains("TICKET_VENDA") && e.impressora != null,
            orElse: () => EstacaoImpressora());
      } else {
        _pwsError(response.content);
      }
    });
  }

  Future<void> verificaConfigEstacao() async {
    if (!AppConfig.servicoAutoPesagem.imprimirPeso &&
        AppConfig.servicoAutoPesagem.lancamentoAutomatico == "NENHUM") {
      PwsAlert pwsAlert = new PwsAlert();
      pwsAlert.message = "Aplicativo não pode ser iniciado. \n "
          "Acesse o ERP e finalize as parametrizações do serviço AutoPesagem";
      _pwsError(pwsAlert);
    }
  }

  Future<void> carregaDrivers() async {
    await DriverImpressoraRequester.listar(
        AppConfig.application.pwsConfigWaychef, AppConfig.token)
        .then((response) {
      if (response.status == 200) {
        AppConfig.driversImpressora = response.content;
      } else {
        _pwsError(response.content);
      }
    });
  }

  static void _atualizaSessao(Timer timer) {
    UsuarioRequester.atualizarSessao(
        AppConfig.application.pwsConfigWaychef, AppConfig.token)
        .then((response) {
      if (response.isSuccess) {
        print("Sessão atualizada");
      } else {
        print("Erro ao atualizar sessão: ${response.content}");
      }
    });
  }

  void _pwsError(PwsAlert alert) {
    throw PwsException(alert);
  }
}
