// ignore_for_file: unnecessary_new

import 'package:autoatendimento/app/modules/home/pages/pedido_viagem/pedido_viagem_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_secundario.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/material.dart';

class PedidoViagemComponent {
  final PedidoViagemController controller = PedidoViagemController();
  late BuildContext context;
  late Orientation orientation;

  initialize(BuildContext context) {
    this.context = context;
    orientation = MediaQuery
        .of(context)
        .orientation;
  }

  body() {
    return Container(
      decoration: BoxDecoration(
        image: StyleUtils.fundoTransparencia(),
      ),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          const Expanded(flex: 15, child: SizedBox()),
          Expanded(flex: 75, child: _escolhaOndeComer()),
          Expanded(flex: 10, child: _rodape()),
        ],
      ),
    );
  }

  Widget _escolhaOndeComer() {
    return Column(
      children: [
        Expanded(child: Container()),
        _cabecalho('ONDE PREFERE COMER?'),
        Expanded(child: Container()),
        Expanded(
          flex: 60,
          child: Wrap(
            spacing: 40,
            runSpacing: 4.0,
            children: [
              _cardOpcao("assets/comerAqui.png", "AQUI"),
              _cardOpcao('assets/sacola.png', "VOU LEVAR"),
            ],
          ),
        ),
        Expanded(child: Container()),
      ],
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

  Widget _cardOpcao(String urlImage, String texto) {
    double tamanhoMinimo = 100;
    double tamanhoProporcao = FontUtils.h1(context) * 3.8;
    return SizedBox(
      width:
      tamanhoProporcao > tamanhoMinimo ? tamanhoProporcao : tamanhoMinimo,
      height:
      tamanhoProporcao > tamanhoMinimo ? tamanhoProporcao : tamanhoMinimo,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: DefaultTheme.accentColor,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(40.0),
          ),
        ),
        child: Column(
          children: [
            Expanded(flex: 10, child: Container()),
            Expanded(flex: 60, child: Image.asset(urlImage)),
            Expanded(
              flex: 4,
              child: Container(),
            ),
            Expanded(
                flex: 20,
                child: Text(
                  texto,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: orientation == Orientation.landscape
                          ? FontUtils.h2(context)
                          : FontUtils.h3(context)),
                )),
            Expanded(flex: 6, child: Container()),
          ],
        ),
        onPressed: () => controller.selecionaOpcao(texto),
      ),
    );
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
