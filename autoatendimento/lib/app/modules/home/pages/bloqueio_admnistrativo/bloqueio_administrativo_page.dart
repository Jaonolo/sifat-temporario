import 'package:autoatendimento/app/modules/home/pages/bloqueio_admnistrativo/bloqueio_administrativo_component.dart';
import 'package:autoatendimento/app/modules/home/pages/bloqueio_admnistrativo/bloqueio_administrativo_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_numerico.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BloqueioAdministrativoPage extends StatefulWidget {
  TextEditingController senha = TextEditingController();

  @override
  State<BloqueioAdministrativoPage> createState() =>
      _BloqueioAdministrativoPageState();
}

class _BloqueioAdministrativoPageState
    extends State<BloqueioAdministrativoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: StyleUtils.fundoTransparencia(),
      ),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(flex: 15, child: AppBarImage()),
          Expanded(flex: 75, child: _inserirCpf()),
          // Expanded(flex: 10, child: _rodape()),
        ],
      ),
    ));
  }

  Widget _cabecalho(String titulo) {
    return Expanded(
      flex: 15,
      child: Row(
        children: [
          Expanded(
              flex: 20,
              child: BotaoSetaVoltar(
                function: () {
                  Modular.to.pushNamed('/comecar');
                },
              )),
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
      _cabecalho('Digite a senha:'),
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
                BotaoNumerico(
                    numero: '7',
                    funcBotao: () {
                      setState(() {
                        widget.senha.text += '7';
                      });
                    }),
                Expanded(
                  child: Container(),
                ),
                BotaoNumerico(
                    numero: '8',
                    funcBotao: () {
                      setState(() {
                        widget.senha.text += '8';
                      });
                    }),
                Expanded(
                  child: Container(),
                ),
                BotaoNumerico(
                    numero: '9',
                    funcBotao: () {
                      setState(() {
                        widget.senha.text += '9';
                      });
                    }),
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
                BotaoNumerico(
                    numero: '4',
                    funcBotao: () {
                      setState(() {
                        widget.senha.text += '4';
                      });
                    }),
                Expanded(
                  child: Container(),
                ),
                BotaoNumerico(
                    numero: '5',
                    funcBotao: () {
                      setState(() {
                        widget.senha.text += '5';
                      });
                    }),
                Expanded(
                  child: Container(),
                ),
                BotaoNumerico(
                    numero: '6',
                    funcBotao: () {
                      setState(() {
                        widget.senha.text += '6';
                      });
                    }),
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
                BotaoNumerico(
                    numero: '1',
                    funcBotao: () {
                      setState(() {
                        widget.senha.text += '1';
                      });
                    }),
                Expanded(
                  child: Container(),
                ),
                BotaoNumerico(
                    numero: '2',
                    funcBotao: () {
                      setState(() {
                        widget.senha.text += '2';
                      });
                    }),
                Expanded(
                  child: Container(),
                ),
                BotaoNumerico(
                    numero: '3',
                    funcBotao: () {
                      setState(() {
                        widget.senha.text += '3';
                      });
                    }),
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
                apagarLetra(),
                Expanded(
                  child: Container(),
                ),
                BotaoNumerico(
                    numero: '0',
                    funcBotao: () {
                      setState(() {
                        widget.senha.text += '0';
                      });
                    }),
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
                    children: [_botaoConfirmar()],
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

  Widget _botaoConfirmar() {
    return BotaoPrimario(
      descricao: "CONFIRMAR",
      function: () {
        int ano = DateTime.now().year;
        int mes = DateTime.now().month;
        int dia = DateTime.now().day;
        int hora = DateTime.now().hour;
        int calc = ano - mes - dia - hora;
        int result = int.parse(widget.senha.text);
        if (calc != result) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Senha Inválida",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
          ));
          print('ERRO');
        } else {
          Modular.to.pushNamed("/configuracao");
        }
      },
    );
  }

  Widget _txtCPF() {
    return Container(
        width: 400,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.black45),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget.senha,
                style: TextStyle(fontSize: FontUtils.h2(context)),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Container()),
        ]));
  }

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
          Icons.delete_forever,
          color: Colors.black,
          size: FontUtils.h3(context),
        ),
        onPressed: () {
          widget.senha.clear();
        },
      ),
    );
  }

  Widget apagarLetra() {
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
          size: FontUtils.h3(context),
        ),
        onPressed: () {
          setState(() {
            if (widget.senha.text.length > 0) {
              print(widget.senha.text.length);
              widget.senha.text = widget.senha.text.substring(0,widget.senha.text.length - 1);
            }
          });
        },
      ),
    );
  }
}
