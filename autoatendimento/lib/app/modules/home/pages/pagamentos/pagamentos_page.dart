import 'package:autoatendimento/app/modules/home/pages/pagamentos/pagamentos_component.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PagamentoPage extends StatelessWidget with PagamentosComponent {
  PagamentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return Scaffold(
      body: body(),
    );
  }
}
