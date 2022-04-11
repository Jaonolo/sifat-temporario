import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_secundario.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:utils/utils/string_utils.dart';

import 'cpf_controller.dart';

class CPFComponent {
  final CPFController controller = CPFController();
  late BuildContext context;
  late Orientation orientation;

  initialize(BuildContext context) {
    this.orientation = MediaQuery
        .of(context)
        .orientation;
    this.context = context;
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
          const Expanded(flex: 15, child: AppBarImage()),
          Expanded(flex: 75, child: _inserirCpf()),
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

  Widget _inserirCpf() {
    return Column(children: [
      Expanded(
        child: Container(),
      ),
      _cabecalho('QUER CPF NA NOTA?'),
      Expanded(
        child: Container(),
      ),
      Row(
        children: [
          Expanded(
            flex: 40,
            child: Container(),
          ),
          Expanded(
            flex: 60,
            child: _txtCPF(),
          ),
          Expanded(
            flex: 40,
            child: Container(),
          ),
        ],
      ),
      Expanded(
        child: Container(),
      ),
      Expanded(
        flex: 60,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 30,
                  child: Container(),
                ),
                _botoesNumericos('7'),
                Expanded(
                  child: Container(),
                ),
                _botoesNumericos('8'),
                Expanded(
                  child: Container(),
                ),
                _botoesNumericos('9'),
                Expanded(
                  flex: 30,
                  child: Container(),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 30,
                  child: Container(),
                ),
                _botoesNumericos('4'),
                Expanded(
                  child: Container(),
                ),
                _botoesNumericos('5'),
                Expanded(
                  child: Container(),
                ),
                _botoesNumericos('6'),
                Expanded(
                  flex: 30,
                  child: Container(),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 30,
                  child: Container(),
                ),
                _botoesNumericos('1'),
                Expanded(
                  child: Container(),
                ),
                _botoesNumericos('2'),
                Expanded(
                  child: Container(),
                ),
                _botoesNumericos('3'),
                Expanded(
                  flex: 30,
                  child: Container(),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 30,
                  child: Container(),
                ),
                _botaoLimpar(),
                Expanded(
                  child: Container(),
                ),
                _botoesNumericos('0'),
                Expanded(
                  child: Container(),
                ),
                _botaoApagar(),
                Expanded(
                  flex: 30,
                  child: Container(),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [_botaoNaoInformar(), _botaoConfirmar()],
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 30,
              child: Container(),
            )
          ],
        ),
      )
    ]);
  }

  Widget _botaoNaoInformar() {
    return BotaoSecundario(
      context: context,
      descricao: "NÃO DESEJO INFORMAR",
      function: () => controller.avancar(),
    );
  }

  Widget _botaoConfirmar() {
    return BotaoPrimario(
      descricao: "CONFIRMAR",
      function: () {
        if (controller.cpfValido()) controller.confirmarCPF();
      },
    );
  }

  Widget _txtCPF() {
    return Observer(builder: (_) {
      return Container(
          width: 400,
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: (controller.cpf.length < 11)
                  ? Colors.black45
                  : controller.cpfValido()
                  ? Colors.green
                  : Colors.red,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  StringUtils.mascaraCPF(controller.cpf),
                  style: TextStyle(fontSize: FontUtils.h2(context)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: controller.cpf.length < 11
                  ? Container()
                  : IconButton(
                onPressed: controller.cpfValido()
                    ? () => controller.confirmarCPF()
                    : () => controller.cpf = "",
                icon: Icon(
                  controller.cpfValido() ? Icons.done : Icons.clear,
                  color:
                  controller.cpfValido() ? Colors.green : Colors.red,
                  size: FontUtils.h2(context),
                ),
              ),
            )
          ]));
    });
  }

  //Botões do teclado

  Widget _botaoApagar() {
    return SizedBox(
      height: FontUtils.h1(context) * 1.2,
      width: FontUtils.h1(context) * 1.2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              side: const BorderSide(width: 3, color: Colors.black)),
          //splashColor: DefaultTheme.accentColor, Desativado pelo uso do ElevatedButton
        ),
        child: Icon(
          Icons.backspace,
          color: Colors.black,
          size: orientation == Orientation.landscape
              ? FontUtils.h2(context)
              : FontUtils.h3(context),
        ),
        onPressed: () => controller.backspace(),
      ),
    );
  }

  Widget _botaoLimpar() {
    return SizedBox(
      height: FontUtils.h1(context) * 1.2,
      width: FontUtils.h1(context) * 1.2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              side: const BorderSide(width: 3, color: Colors.black)),
          //splashColor: DefaultTheme.accentColor, Desativado pelo uso do ElevatedButton
        ),
        child: Icon(
            Icons.delete, size: FontUtils.h2(context), color: Colors.black),
        onPressed: () => controller.limpaCampo(),
      ),
    );
  }

  Widget _botoesNumericos(String numero) {
    return SizedBox(
      height: FontUtils.h1(context) * 1.2,
      width: FontUtils.h1(context) * 1.2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90.0),
              side: const BorderSide(width: 3, color: Colors.black)),
          // splashColor: DefaultTheme.accentColor, Desativado pelo uso do ElevatedButton
        ),
        child: Text(
          numero,
          style: TextStyle(
              color: Colors.black,
              fontSize: orientation == Orientation.landscape
                  ? FontUtils.h2(context)
                  : FontUtils.h3(context)),
        ),
        onPressed: () => controller.formatTyped(numero),
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
