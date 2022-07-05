import 'package:autoatendimento/app/utils/timer_tempo_ocioso_utils.dart';
import 'package:flutter/material.dart';

import 'home_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeComponent {
  @override
  Widget build(BuildContext context) {
    initialize(context);
    return Scaffold(
      key: key,
      appBar: appBar(),
      body: body(),
    );
  }

  @override
  void initState() {
    appController.maiorIdade = false;
    TimerTempoOciosoUtils.reiniciaTimer();
    controller.changeMenuSelecionado(appController.listCardapioMenu.first);
    super.initState();
  }
}
