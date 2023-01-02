// import 'package:erp/config/application.dart';
import 'package:erp/app_antigo/config/application.dart';
import 'package:erp/app_antigo/modules/sessao/sessao_page_compoment.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SessaoPage extends StatelessWidget with SessaoPageCompoment {
  String token;

  SessaoPage(this.token) {
    print(this.token);
    Application.tokenUsuario = token;
  }

  @override
  Widget build(BuildContext context) {
    initialize(context: context);
    return Scaffold(
      body: body(),
    );
  }
}
