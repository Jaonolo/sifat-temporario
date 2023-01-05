import 'dart:async';

import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/utils/autoatendimento_utils.dart';
import 'package:core/application/application.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:models/model/enum/marca_pos.dart';
import 'package:models/model/enum/tipo_estacao.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/enum/clients.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/gerenciador_requester.dart';
import 'package:requester/requester/servico_auto_atendimento_requester.dart';
import 'package:requester/requester/tabela_preco_requester.dart';

import '../../../../utils/dialog_auto.dart';
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

  bool isReiniciando = false;

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

  void _atualizarSessao() {
    appController.timer = Timer.periodic(const Duration(seconds: 20), (timer) {
      GerenciadorRequester.atualizaSessao(
          appController.pwsConfig, appController.token);
    });
  }

  Future<void> _carregarDadosIniciaisAPI(BuildContext context) async {
    _inicializaClientPWS();
    changeStatus("Fazendo login com a API");

    try {
      await _carregaNomeEstacao();

      await _loginAPI(context);

      await _carregaModuloEFormasPagamento();

      await _carregaTef();

      await _carregaCardapio();

      await _carregaTabelaPreco(context);

      await _iniciaImpressao();

      _concluir();
    } catch (e) {
      print(e);
      if(!isReiniciando){
        if (e is WaybeException) {
          if (e.titulo.contains("Estação de trabalho não encontrada")) {
            e.mensagem = "Nome da estação não localizado , nome estação desejada : {$nomeEstacao}";
          };
          changeBotaoDetalhesErro(true, e.mensagem != null? e.mensagem : e.titulo);
          return changeStatus('$erro_base \n\n ${(e.exception != null) ? e.exception.message : ""}');
        }
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

  Future<void> _carregaNomeEstacao() async {
    nomeEstacao =
    await ConfigRepository.carregaNomeEstacao(appController.pwsConfigLocal);
    if (nomeEstacao == null || nomeEstacao!.isEmpty) {
      PwsAlert pws = PwsAlert();
      pws.message = 'Nome da estação não localizado + $nomeEstacao';
      throw WaybeException('Nome da estação não localizado.',
          exception: PwsException(pws));
    }
    //todo retirar isso JOSE
    if(nomeEstacao == "DESKTOP-C2U01ML"){
         nomeEstacao =  nomeEstacao! + "_autoAtendimento";
    }
    if(nomeEstacao == "DSV11"){
      nomeEstacao =  nomeEstacao! + "_autoAtendimento";
    }
  }

  Future<void> _loginAPI(BuildContext context) async {
    await ServicoAutoAtendimentoRequester.login(
        appController.pwsConfig,
        appController.pwsConfig.clientSecret,
        appController.pwsConfig.client.clientKey,
        nomeEstacao!)
        .then((response) async {
          print(nomeEstacao);
      if (response.status == 200) {
        LoginAutoAtendimentoDTO dto = response.content;
        appController.estacaoTrabalho = dto.estacaoTrabalho!;
        if (dto.servicoAutoAtendimento == null) {
          throw WaybeException('Serviço Autoatendimento não localizado');
        }

        appController.servicoAutoAtendimento = dto.servicoAutoAtendimento!;
        appController.token = dto.servicoAutoAtendimento!.token!;
      }
       else if (response.status == 204) {
       await  showDialog(
            context: context,
            barrierDismissible: true,
            builder: (c) =>
            DialogAuto(
              showCancelButton: false,
              title: "Estação de trabalho não encontrada",
              message:
              "Realize a configuração da estação no ERP, nome da estação esperado {$nomeEstacao}.\n"
                  "Após finalizar o cadastro, clique em OK para reiniciar o aplicativo.",
              txtConfirmar: "OK",
              onConfirm: () {
                isReiniciando = true;
                Modular.to.pushNamed("/");
                _carregarDadosIniciaisAPI(c);
              },
            ));
      } else {
        throw WaybeException('Problema ao realizar login na API',
            exception: response.content);
      }
    });

    return Future.value();
  }

  Future<void> _carregaModuloEFormasPagamento() async {
    //Mapeia o módulo e as formas de pagamento
    appController.listFormaPagamento = [];

    if (appController.servicoAutoAtendimento.finalizadoraDebito != null) {
      appController.listFormaPagamento
          .add(appController.servicoAutoAtendimento.finalizadoraDebito!);
    }

    if (appController.servicoAutoAtendimento.finalizadoraCredito != null) {
      appController.listFormaPagamento.add(
          appController.servicoAutoAtendimento.finalizadoraCredito!);
    }

    if (appController.servicoAutoAtendimento.finalizadoraVale != null) {
      appController.listFormaPagamento.add(
          appController.servicoAutoAtendimento.finalizadoraVale!);
    }


    //Transforma a finalizadora de credito em dinheiro para finalizar a venda sem tipo tef //todo apenas testes
    // appController.servicoAutoAtendimento.finalizadoraCredito!.finalizadora!.finalizadoraRFB = "DINHEIRO";

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
          appController.token,
          '${appController.estacaoTrabalho.numeroCaixa}',
          dto!.cnpj.toString());
    }

    return Future.value();
  }

  Future<void> _carregaCardapio() async {
    changeStatus("Carregando cardápio");
    CardapioDTO dto = await CardapioRepository.obterCardapioTipoItens(
        appController.pwsConfig,
        appController.token,
        appController.estacaoTrabalho.cardapio!.id.toString());

    appController.listCardapioMenu = dto.listCardapioMenu;
    appController.mapProdutos = dto.mapProdutos;
    appController.mapMenus = dto.mapMenu;

    return Future.value();
  }
  Future<void> _iniciaImpressao() async {
    changeStatus("Carregando Impressão");
    if (defaultTargetPlatform != TargetPlatform.windows) {
      Application
          .getInstance().setImpressoraService(TipoEstacao.MINI_PDV, MarcaPOS.NENHUMA);
      Application
          .getInstance()
          .impressoraService
          .imprime("Autoatendimento iniciado");
    }else{
      Application
          .getInstance().setImpressoraService(TipoEstacao.AUTO_ATENDIMENTO, MarcaPOS.NENHUMA);
    }

    return Future.value();
  }

  Future<void> _carregaTabelaPreco(BuildContext context) async {
    changeStatus("Carregando tabela de preço");
    TabelaPreco? _tabelaPreco;
    TabelaPrecoRequester.buscarTodos(
        appController.pwsConfig, appController.token)
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
