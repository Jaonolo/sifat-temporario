import 'package:autoatendimento/app/modules/home/pages/pedido_viagem/pedido_viagem_component.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PedidoViagemPage extends StatelessWidget with PedidoViagemComponent {
  PedidoViagemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return Scaffold(
      body: body(),
    );
  }
}
