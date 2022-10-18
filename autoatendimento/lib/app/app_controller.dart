import 'dart:async';

import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
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
  late PWSConfig pwsConfigLocal;
  late String token;
  late EstacaoTrabalho estacaoTrabalho;
  late ServicoAutoAtendimento servicoAutoAtendimento;
  late TabelaPreco tabelaPreco;
  late Map<num, ProdutoEmpresa> mapProdutos;
  late Map<num, ProdutoMenu> mapMenus;
  List<CardapioMenu> listCardapioMenu = [];
  List<FinalizadoraEmpresa> listFormaPagamento = [];
  Timer? timer;
  Timer? timerAtualizaSessao;
  bool maiorIdade = false;
  CountDownController _controller = CountDownController();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  TransacaoCartao? transacaoCartao;
  List<Map<String, String?>?> transacoes = [];

  EstacaoImpressora getImpressoraVenda() {
    return estacaoTrabalho.impressoras.firstWhere((element) =>
    element.modulo == "AUTOATENDIMENTO" &&
        element.relatorio == "TICKET_VENDA");
  }

  void iniciaTimer() {
    timer = Timer.periodic(Duration(minutes: servicoAutoAtendimento.avisoTempoOcioso!), (time) {
      warningTimer();
    });
  }

  void reiniciaTimer() {
    desligaTimer();
    iniciaTimer();
  }

  void desligaTimer() {
    if (timer != null) {
      timer!.cancel();
      timer = null;
    }
  }

  warningTimer() {
    //duração do contador
    int _duration = 30;

    //dialog com contador, caso nao seja feito nenhuma ação na tela volta para toque_comecar
    return showDialog(
      context: _globalKey.currentContext!,
      builder: (context) =>
          AlertDialog(
            shape: const RoundedRectangleBorder(
              side: BorderSide(),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            title: Center(
                child: Text(
                  "VOCÊ AINDA ESTA AÍ?",
                  style: TextStyle(fontSize: FontUtils.h3(context)),
                )),
            content: CircularCountDownTimer(
              // Countdown duration in Seconds.
              duration: _duration,
              controller: _controller,

              width: FontUtils.h1(context) * 1.5,
              height: FontUtils.h1(context) * 1.5,

              //color: Colors.grey[300],

              fillColor: DefaultTheme.accentColor.withAlpha(300),

              backgroundColor: DefaultTheme.accentColor,

              strokeWidth: 10,

              strokeCap: StrokeCap.round,

              textStyle: TextStyle(
                  fontSize: FontUtils.h3(context),
                  color: Colors.white,
                  fontWeight: FontWeight.bold),

              textFormat: CountdownTextFormat.SS,

              isReverse: true,

              isReverseAnimation: true,

              isTimerTextShown: true,

              autoStart: true,

              onStart: () {},

              onComplete: () {
                desligaTimer();
                HomeController homeController = Modular.get();
                homeController.recomecar();
              },
              ringColor: Colors.white,
            ),
            actions: [
              Row(
                children: [
                  SizedBox(
                    width: FontUtils.h1(context) * 4.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: Text(
                        "SIM",
                        style: TextStyle(
                            fontSize: FontUtils.h3(context),
                            color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        reiniciaTimer();
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
    );
  }

  set globalKey(GlobalKey<ScaffoldState> value) {
    _globalKey = value;
  }
}
