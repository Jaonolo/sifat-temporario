import 'package:autoatendimento/app/modules/home/pages/transacao_tef/transacao_tef_component.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TransacaoTefPage extends StatelessWidget with TransacaoTefComponent {
  TransacaoTefPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return Scaffold(
      body: body(),
    );
  }
}
