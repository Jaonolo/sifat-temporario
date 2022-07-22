import 'package:autoatendimento/app/modules/home/pages/tef/administrativo_tef/administrativo_tef_component.dart';
import 'package:flutter/material.dart';

class AdministrativoTefPage extends StatelessWidget
    with AdministrativoTefComponent {
  AdministrativoTefPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: body()
    );
  }
}