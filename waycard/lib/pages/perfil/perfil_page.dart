import 'package:flutter/material.dart';
import 'package:waycard/pages/perfil/perfil_page_component.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> with PerfilPageComponent {
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
