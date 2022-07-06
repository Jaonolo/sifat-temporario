import 'package:erp/app/config/application.dart';
import 'package:erp/app/modules/sessao/sessao_page_compoment.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SessaoPage extends StatelessWidget with SessaoPageCompoment {
  String token;

  SessaoPage(this.token) {
    Application.tokenUsuario = token;
  }

  @override
  Widget build(BuildContext context) {
    initialize();
    return Scaffold(
      body: body(),
    );
  }
}
