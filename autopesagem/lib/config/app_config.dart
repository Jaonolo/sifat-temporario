import 'dart:async';

import 'package:core/application/application.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:utils/utils/string_utils.dart';
import 'package:models/model/enum/clients.dart' as c;

class AppConfig {
  static ClientAutoPesagem clientAutoPesagem = ClientAutoPesagem();
  static EstacaoTrabalho estacaoTrabalho = EstacaoTrabalho();
  static Empresa empresa = Empresa();
  static List<DriverImpressora> driversImpressora = [];
  static Timer? timerAtualizaSessao;
  static EstacaoImpressora impressoraPadrao = EstacaoImpressora();

  //Tela configuração
  static String urlApiWaychef = "";
  static String urlApiGateway = '';
  static String clientSecret = "";
  static String nomeEstacao = '';

  //Comunicação com a balança
  static PWSConfig pwsUtils = new PWSConfig(
      clientSecret: '', urlBase: '', client: c.Clients.AUTOPESAGEM);

  static String token = StringUtils.stringToMd5(
      "${clientSecret}${DateTime
          .now()
          .millisecond
          .toString()}");

  static GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  static Application application = Application.getInstance()
    ..client = c.Clients.AUTOPESAGEM;

  static get globalContext => globalKey.currentContext;
}
