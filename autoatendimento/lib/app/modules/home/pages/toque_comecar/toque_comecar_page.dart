import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/toque_comecar/toque_comecar_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ToqueComecarPage extends StatefulWidget {
  const ToqueComecarPage({Key? key}) : super(key: key);

  @override
  _ToqueComecarPageState createState() => _ToqueComecarPageState();
}

class _ToqueComecarPageState extends State<ToqueComecarPage>
    with ToqueComecarComponent {
  HomeController homeController = Modular.get();

  @override
  void initState() {
    appController.desligaTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return Scaffold(
      body: body(),
    );
  }
}
