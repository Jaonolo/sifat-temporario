import 'package:autoatendimento/app/pages/toque_comecar/toque_comecar_component.dart';
import 'package:autoatendimento/app/pages/toque_comecar/toque_comecar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ToqueComecarPage extends StatefulWidget {
  ToqueComecarPage({Key? key}) : super(key: key);

  final controller = Get.put(ToqueComecarController());

  @override
  _ToqueComecarPageState createState() => _ToqueComecarPageState();
}

class _ToqueComecarPageState extends State<ToqueComecarPage> with ToqueComecarComponent {

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return Scaffold(
      body: body(),
    );
  }
}
