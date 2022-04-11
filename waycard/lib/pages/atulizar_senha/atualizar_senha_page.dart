import 'package:flutter/material.dart';

import 'atualizar_senha_page_component.dart';

class AtualizarSenhaPage extends StatefulWidget {

  @override
  _AtualizarSenhaPageState createState() => _AtualizarSenhaPageState();
}

class _AtualizarSenhaPageState extends State<AtualizarSenhaPage>
    with AtualizarSenhaPageComponent {

  @override
  void initState() {
    initialize(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    setSize(size);

    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }
}