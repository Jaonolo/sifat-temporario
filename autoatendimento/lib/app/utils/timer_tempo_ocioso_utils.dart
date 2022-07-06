import 'dart:async';

import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TimerTempoOciosoUtils {

  static final AppController _appController = Modular.get();
  static CountDownController _controller = CountDownController();


  static void _iniciaTimerOcioso() {
    _appController.timerTempoOcioso = Timer.periodic(Duration(
        minutes: _appController.clientAutoAtendimento.avisoTempoOcioso!), (
        time) {
      _warningTimer();
    });
  }

  static void reiniciaTimer() {
    desligaTimerOcioso();
    _iniciaTimerOcioso();
  }

  static void desligaTimerOcioso() {
    if (_appController.timerTempoOcioso != null) {
      _appController.timerTempoOcioso!.cancel();
      _appController.timerTempoOcioso = null;
    }
  }

  static _warningTimer() {
    //duração do contador
    int _duration = 30;

    //dialog com contador, caso nao seja feito nenhuma ação na tela volta para toque_comecar
    return showDialog(
      context: _appController.globalKey.currentContext!,
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
                desligaTimerOcioso();
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
}