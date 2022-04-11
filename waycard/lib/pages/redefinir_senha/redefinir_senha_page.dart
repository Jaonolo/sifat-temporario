import 'package:flutter/material.dart';
import 'package:waycard/pages/redefinir_senha/redefinir_senha_page_component.dart';

class RedefinirSenhaPage extends StatefulWidget {
  @override
  _RedefinirSenhaPageState createState() => _RedefinirSenhaPageState();
}

class _RedefinirSenhaPageState extends State<RedefinirSenhaPage>
    with RedefinirSenhaPageComponent {
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
      body: body(),
    );
  }
}
