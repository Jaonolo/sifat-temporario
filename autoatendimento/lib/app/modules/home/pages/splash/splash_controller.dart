import 'dart:async';

import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/utils/atualizar_sessao_client_utils.dart';
import 'package:autoatendimento/app/utils/autoatendimento_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/enum/clients.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/micro-service/sessao/sessao_client_requester.dart';
import 'package:requester/requester/client_auto_atendimento_requester.dart';
import 'package:requester/requester/tabela_preco_requester.dart';

import 'model/cardapio_dto.dart';
import 'repositories/cardapio_repository.dart';
import 'repositories/config_repository.dart';
import 'repositories/sitef_repository.dart';

part "splash_controller.g.dart";

class SplashController = SplashBase with _$SplashController;

abstract class SplashBase with Store {
  String erro_base = "Não foi possível concluir a inicialização.";
  AppController appController = Modular.get();
  ConfigPropertiesDTO? dto;
  String? nomeEstacao;
  var exception;

  @observable
  String status = "";

  @observable
  bool botaoDetalhesErro = false;

  @action
  void changeStatus(String value) {
    status = value;
  }

  void verificaSeTaConfigurado(BuildContext context) async {
    inicializaClientPWSSpring();
    await ConfigRepository.carregaConfiguracao(appController.pwsConfigLocal)
        .then((value) async {
      dto = value;
      if (dto != null) {
        await _carregaNomeEstacao();
        _carregarDadosIniciaisAPI(context);
      } else {
        _abreWizard();
      }
    }).catchError((e, s) {
      AutoatendimentoUtils.catchError(e, s, context);
      changeStatus(("Problema na inicialização.\n\n $e"));
    });
  }


  Future<void> _carregarDadosIniciaisAPI(BuildContext context) async {
    _inicializaClientPWS();

    _inicializaClientPWSGateway();

    changeStatus("Fazendo login com a API");

    try {
      await _carregaNomeEstacao();

      //Cria Sessao client
      await _criarSessaoClient();

      await _buscarClientAutoAtendimento();

      await _carregaModuloEFormasPagamento();

      // await _carregaTef();

      await _carregaCardapio();

      await _carregaTabelaPreco(context);

      _concluir();
    } catch (e) {
      print(e);
      if (e is WaybeException) {
        changeBotaoDetalhesErro(true, e.mensagem);
        return changeStatus('$erro_base \n\n ${(e.exception != null) ? e.exception.message : ""}');
      }
    }
  }

  void inicializaClientPWSSpring() {
    appController.pwsConfigLocal = PWSConfig(
        urlBase: "http://localhost:8080",
        client: Clients.AUTOATENDIMENTO,
        clientSecret: "");
  }

  void _inicializaClientPWS() {
    appController.pwsConfig = PWSConfig(
      urlBase: dto!.host.toString(),
      client: Clients.AUTOATENDIMENTO,
      clientSecret: dto!.clientSecret.toString(),
    );
  }

  void _inicializaClientPWSGateway() {
    appController.pwsConfigGateway = PWSConfig(
      urlBase: dto!.hostGateway.toString(),
      client: Clients.AUTOATENDIMENTO,
      clientSecret: dto!.clientSecret.toString(),
    );
  }

  Future<void> _carregaNomeEstacao() async {
    nomeEstacao =
    await ConfigRepository.carregaNomeEstacao(appController.pwsConfigLocal);
    if (nomeEstacao == null || nomeEstacao!.isEmpty) {
      PwsAlert pws = PwsAlert();
      pws.message = 'Nome da estação não localizado';
      throw WaybeException('Nome da estação não localizado.',
          exception: PwsException(pws));
    }
    //todo retirar isso JOSE
    if(nomeEstacao == "DSV11"){
         nomeEstacao =  nomeEstacao! + "_autoAtendimento";
    }
  }

  Future<void> _criarSessaoClient() async {
    LoginClientDTO loginClientDTO = new LoginClientDTO();
    loginClientDTO.client = Clients.AUTOATENDIMENTO;
    loginClientDTO.clientKey = Clients.AUTOATENDIMENTO.clientKey;
    loginClientDTO.versao = Clients.AUTOATENDIMENTO.versao;
    loginClientDTO.clientSecret = dto!.clientSecret.toString();
    loginClientDTO.nomeEstacao = nomeEstacao;

    await SessaoClientRequest.criarSessao(
        appController.pwsConfigGateway,  loginClientDTO)
        .then((response) {
      if (response.status == 200) {
        appController.tokenClient = response.content!.token;
        print("TOKEN: Bearer ${appController.tokenClient}");
      } else {
        throw WaybeException('Problema ao realizar login na API',
                    exception: response.content);
      }
    });
  }

  Future<void> _buscarClientAutoAtendimento() async {
    await ClientAutoAtendimentoRequester.buscarConfiguracoes(
        appController.pwsConfig, appController.tokenClient)
        .then((response) {
      if (response.status == 200) {
        ConfiguracoesAutoAtendimentoDTO dto = response.content;
        appController.estacaoTrabalho = dto.estacaoTrabalho!;
        if (dto.clientAutoAtendimento == null) {
          throw WaybeException('Serviço Autoatendimento não localizado');
        }

        appController.clientAutoAtendimento = dto.clientAutoAtendimento!;
      } else if (response.status == 204) {
        throw WaybeException('Estação de trabalho não encontrada');
      } else {
        throw WaybeException('Problema ao realizar login na API',
            exception: response.content);
      }
    });

    return Future.value();
  }

  Future<void> _carregaModuloEFormasPagamento() async {
    //Mapeia o módulo e as formas de pagamento
    if (appController.clientAutoAtendimento.finalizadoraDebito != null) {
      appController.listFormaPagamento
          .add(appController.clientAutoAtendimento.finalizadoraDebito!);
    }

    if (appController.clientAutoAtendimento.finalizadoraCredito != null) {
      appController.listFormaPagamento.add(
          appController.clientAutoAtendimento.finalizadoraCredito!);
    }


    //Transforma a finalizadora de credito em dinheiro para finalizar a venda sem tipo tef //todo apenas testes
    // appController.clientAutoAtendimento.finalizadoraCredito!.finalizadora!.finalizadoraRFB = "DINHEIRO";

    if (appController.listFormaPagamento.isEmpty) {
      throw WaybeException(
          'Nenhuma forma de pagamento vinculada ao módulo Autoatendimento');
    }


    return Future.value();
  }

  Future<void> _carregaTef() async {
    if (appController.estacaoTrabalho.tipoTEF == "SITEF") {
      changeStatus("Iniciando Sitef");

      await SitefRepository.startSitef(
          appController.pwsConfigLocal,
          appController.pwsConfig,
          appController.tokenClient,
          '${appController.estacaoTrabalho.numeroCaixa}',
          dto!.cnpj.toString());
    }

    return Future.value();
  }

  Future<void> _carregaCardapio() async {
    changeStatus("Carregando cardápio");
    CardapioDTO dto = await CardapioRepository.obterCardapioTipoItens(
        appController.pwsConfig,
        appController.tokenClient,
        appController.estacaoTrabalho.cardapio!.id.toString());

    appController.listCardapioMenu = dto.listCardapioMenu;
    appController.mapProdutos = dto.mapProdutos;

    return Future.value();
  }

  Future<void> _carregaTabelaPreco(BuildContext context) async {
    changeStatus("Carregando tabela de preço");
    TabelaPreco? _tabelaPreco;
    TabelaPrecoRequester.buscarTodos(
        appController.pwsConfig, appController.tokenClient)
        .then((value) {
      if (value.isSuccess) {
        List<TabelaPreco> tabelas = value.content ?? [];
        tabelas.forEach((element) {
          if (element.padrao) _tabelaPreco = element;
        });
      }

      if (_tabelaPreco == null) {
        throw WaybeException('Nenhuma tabela de preço padrão localizada');
      } else {
        appController.tabelaPreco = _tabelaPreco!;
      }
    }).catchError((e, s) {
      AutoatendimentoUtils.catchError(e, s, context);
      changeStatus(("Problema ao carregar tabela de preço.\n\n $e"));
    });
  }

  Future<void> _concluir() async {
    _atualizarSessao();
    await Future.delayed(const Duration(seconds: 2));
    Modular.to.pushReplacementNamed("/comecar");
  }

  void _atualizarSessao() {
    AtualizarSessaoClientUtils.startAtualizaSessaoClient();
  }

  Future<void> _abreWizard() async {
    await Future.delayed(const Duration(seconds: 2));
    Modular.to.pushReplacementNamed("/wizard");
  }

  @action
  void changeBotaoDetalhesErro(bool value, var e) {
    botaoDetalhesErro = value;
    exception = e;
  }
}
