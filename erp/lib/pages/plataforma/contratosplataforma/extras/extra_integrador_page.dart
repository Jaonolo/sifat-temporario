import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_antigo/config/application.dart';
import 'extra_integrador_component.dart';

import 'extra_integrador_controller.dart';

class ExtraIntegradorPage extends StatelessWidget with ExtraIntegradorPageComponent {
  String? token;
  ExtraIntegradorPage(this.token) {Application.tokenUsuario = token!;

  }

  // ExtraIntegradorPage({Key? key,
  // this.token}) : super(key: key);


  final controller = Get.put(ExtraIntegradorPageController());



  @override
  Widget build(BuildContext context) {
    initialize(context);

    return Scaffold(body: body());
  }
}
