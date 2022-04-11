// ignore_for_file: unnecessary_const

import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/pagamentos/pagamentos_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_secundario.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widget/card_forma_pagamento.dart';

class PagamentosComponent {
  PagamentosController controller = PagamentosController();
  VendaController vendaController = Modular.get();
  AppController appController = Modular.get();

  late BuildContext context;

  initialize(BuildContext context) {
    this.context = context;
  }

  body() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: StyleUtils.fundoTransparencia(),
      ),
      child: Column(
        children: [
          const Expanded(flex: 15, child: const AppBarImage()),
          Expanded(flex: 75, child: _formaPagamento()),
          Expanded(flex: 10, child: _rodape()),
        ],
      ),
    );
  }

  Widget _cabecalho(String titulo) {
    return Expanded(
      flex: 15,
      child: Row(
        children: [
          Expanded(flex: 20, child: BotaoSetaVoltar()),
          Expanded(
            flex: 60,
            child: Center(
              child: Text(
                titulo,
                style: TextStyle(fontSize: FontUtils.h1(context)),
              ),
            ),
          ),
          Expanded(flex: 20, child: Container()),
        ],
      ),
    );
  }

  Widget _formaPagamento() {
    return Column(children: [
      Expanded(
        child: Container(),
      ),
      _cabecalho('FORMA DE PAGAMENTO'),
      Expanded(
        child: Container(),
      ),
      Expanded(
        flex: 60,
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: Container(),
            ),
            Expanded(
              flex: 80,
              child: Align(
                alignment: Alignment.topCenter,
                child: Wrap(
                    spacing: 40.0,
                    runSpacing: 20.0,
                    children: List.generate(
                        appController.listFormaPagamento.length, (index) {
                      var finalizadoraEmpresa =
                      appController.listFormaPagamento[index];
                      return CardFormaPagamento(
                          finalizadoraEmpresa.finalizadora!,
                          controller.acaoFormaPagamento(
                              finalizadoraEmpresa, context));
                    })),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _rodape() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      BotaoSecundario(
          context: context,
          descricao: "CANCELAR PEDIDO",
          function: () => controller.cancelar()),
      BotaoSecundario(
          context: context,
          descricao: "VOLTAR AO CARDÁPIO",
          function: () => controller.voltarCardapio()),
    ]);
  }
}
