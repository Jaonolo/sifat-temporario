import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:waycard/pages/detalhes_cartao/detalhes_cartao_page_component.dart';

class DetalhesCartaoPage extends StatefulWidget {
  final ClienteCartao cartao;

  const DetalhesCartaoPage({required this.cartao});

  @override
  _DetalhesCartaoPageState createState() => _DetalhesCartaoPageState();
}

class _DetalhesCartaoPageState extends State<DetalhesCartaoPage>
    with DetalhesCartaoPageComponent {
  @override
  void initState() {
    initialize(context: context, cartao: widget.cartao);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      bottomNavigationBar: bottomBarValorFatura(),
    );
  }
}
