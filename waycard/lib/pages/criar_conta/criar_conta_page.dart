import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:waycard/pages/criar_conta/criar_conta_page_component.dart';

class CriarContaPage extends StatefulWidget {
  final Usuario? user;

  CriarContaPage({this.user});

  @override
  _CriarContaPageState createState() => _CriarContaPageState();


}

class _CriarContaPageState extends State<CriarContaPage>
    with CriarContaPageComponent {
  @override
  void initState() {
    initialize(context: context, user: widget.user);
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
      floatingActionButton: fab(),
    );
  }
}
