import 'dart:async';

import 'package:autopesagem/config/app_config.dart';
import 'package:autopesagem/utils/auto_pesagem_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/enum/clients.dart' as enumClient;
import 'package:models/model/models.dart';
import 'package:requester/requester/client_auto_pesagem_requester.dart';
import 'package:requester/requester/driver_impressora_requester.dart';
import 'package:requester/requester/micro-service/sessao/sessao_client_requester.dart';

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
      await criarSessaoClient();

      //Busca configuraçoes do client e estacao
      await buscaConfiguracoes();

      //Carrega Drivers da impressora
      await carregaDrivers();

      //Verifica se imprime e se lançaautomatico
      await verificaConfigEstacao();

      //Rotina de atualiza sessao
      AppConfig.timerAtualizaSessao =
          Timer.periodic(Duration(seconds: 10), (_) => _atualizaSessao());

      //Deu tudo certo manda para tela de home
      onSucess.call();
    }  catch (error, stackTrace) {
      print(stackTrace);
      if (error is PwsException && error.pws != null) {
        onErrorLogin.call(error.pws!.message!);
        return;
      }
      onErrorLogin.call("Occoreu um erro ao realizar o login");
    }
  }

  Future<void> criarSessaoClient() async {
    LoginClientDTO loginClientDTO = new LoginClientDTO();
    loginClientDTO.client = enumClient.Clients.AUTOPESAGEM;
    loginClientDTO.clientKey = enumClient.Clients.AUTOPESAGEM.clientKey;
    loginClientDTO.versao = enumClient.Clients.AUTOPESAGEM.versao;
    loginClientDTO.clientSecret = AppConfig.clientSecret;
    loginClientDTO.nomeEstacao = AppConfig.nomeEstacao;

    await SessaoClientRequest.criarSessao(
            AppConfig.application.pwsConfigGateway,  loginClientDTO)
        .then((response) {
      if (response.status == 200) {
        AppConfig.token = response.content!.token!;
        print("TOKEN: Bearer ${AppConfig.token}");
      } else {
        throw PwsException(response.content);
      }
    });
  }

  Future<void> buscaConfiguracoes() async {
    await ClientAutoPesagemRequester.buscaConfiguracoes(
        AppConfig.application.pwsConfigWaychef,
        AppConfig.token)
        .then((response) {
      if (response.status == 200) {
        //Seta na application
        ConfiguracoesAutoPesagemDTO configuracoesAutoPesagemDTO = response.content;
        AppConfig.clientAutoPesagem = configuracoesAutoPesagemDTO.clientAutoPesagem!;
        AppConfig.estacaoTrabalho = configuracoesAutoPesagemDTO.estacaoTrabalho!;
        AppConfig.empresa = configuracoesAutoPesagemDTO.empresa!;
        AppConfig.impressoraPadrao = AppConfig.estacaoTrabalho.impressoras
            .firstWhere((e) =>
        e.relatorio!.contains("TICKET_VENDA") && e.impressora != null,
            orElse: () => EstacaoImpressora());
      } else {
        throw PwsException(response.content);
      }
    });
  }

  Future<void> verificaConfigEstacao() async {
    if (!AppConfig.clientAutoPesagem.imprimirPeso &&
        AppConfig.clientAutoPesagem.lancamentoAutomatico == "NENHUM") {
      PwsAlert pwsAlert = new PwsAlert();
      pwsAlert.message = "Aplicativo não pode ser iniciado. \n "
          "Acesse o ERP e finalize as parametrizações do serviço AutoPesagem";
      throw PwsException(pwsAlert);
    }
  }

  Future<void> carregaDrivers() async {
    await DriverImpressoraRequester.listar(
        AppConfig.application.pwsConfigWaychef, AppConfig.token)
        .then((response) {
      if (response.status == 200)
        AppConfig.driversImpressora = response.content;
      else
        throw PwsException(response.content);
    });
  }

  void _atualizaSessao() {
    SessaoClientRequest.atualizarSessao(
        AppConfig.application.pwsConfigGateway, AppConfig.token)
        .then((response) {
      if (response.status == 200) {
        AppConfig.token = response.content!.token;
      } else {

        print('Ocorreu um erro ao atualizar a sessao: ${response.content}');
        AppConfig.timerAtualizaSessao!.cancel();
        onErrorLogin.call('por favor refaça o login!');
      }
    });
  }
}
