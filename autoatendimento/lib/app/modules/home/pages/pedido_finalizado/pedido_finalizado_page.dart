import 'package:autoatendimento/app/modules/home/pages/pedido_finalizado/pedido_finalizado_component.dart';
import 'package:flutter/material.dart';

class PedidoFinalizadoPage extends StatefulWidget {
  const PedidoFinalizadoPage({Key? key}) : super(key: key);

  @override
  _PedidoFinalizadoPageState createState() => _PedidoFinalizadoPageState();
}

class _PedidoFinalizadoPageState extends State<PedidoFinalizadoPage>
    with PedidoFinalizadoComponent {

  @override
  void initState() {
    controller.tempoEspera();
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
