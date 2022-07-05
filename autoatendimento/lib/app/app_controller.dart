import 'dart:async';

import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:autoatendimento/app/utils/timer_tempo_ocioso_utils.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  late PWSConfig pwsConfig;
  late PWSConfig pwsConfigGateway;
  late PWSConfig pwsConfigLocal;
  late String tokenClient;
  late EstacaoTrabalho estacaoTrabalho;
  late ClientAutoAtendimento clientAutoAtendimento;
  late TabelaPreco tabelaPreco;
  late Map<num, ProdutoEmpresa> mapProdutos;
  List<CardapioMenu> listCardapioMenu = [];
  List<FinalizadoraEmpresa> listFormaPagamento = [];
  Timer? timerTempoOcioso;
  Timer? timerAtualizaSessaoClient;
  bool maiorIdade = false;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  EstacaoImpressora getImpressoraVenda() {
    return estacaoTrabalho.impressoras.firstWhere((element) =>
    element.modulo == "AUTOATENDIMENTO" &&
        element.relatorio == "TICKET_VENDA");
  }

  set globalKey(GlobalKey<ScaffoldState> value) {
    _globalKey = value;
  }

  GlobalKey<ScaffoldState> get globalKey => _globalKey;
}
