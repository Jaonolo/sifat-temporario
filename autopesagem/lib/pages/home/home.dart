import 'package:autopesagem/config/app_config.dart';
import 'package:autopesagem/pages/home/home_controller.dart';
import 'package:autopesagem/widgets/cards_widget.dart';
import 'package:autopesagem/widgets/configuracao/dialog_config_app.dart';
import 'package:autopesagem/widgets/configuracao/dialog_config_estacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:models/model/models.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ClientAutoPesagem clientAutoPesagem = AppConfig.clientAutoPesagem;
  HomeController controller = HomeController();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.iniciaTimer(context);
    AppConfig.globalKey = key;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Container(
        color: Color.fromRGBO(43, 49, 53, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: CardsWidget(
                      textCampo: "Tara do Prato",
                      valor: clientAutoPesagem.tara != null
                          ? clientAutoPesagem.tara!.toStringAsFixed(3)
                          : "0",
                      color: Color.fromRGBO(249, 77, 24, 1)),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: CardsWidget(
                    textCampo: "Preço por KG",
                    valor: clientAutoPesagem.gradeEmpresa!.getPrecoVenda
                        .toStringAsFixed(2),
                    color: Color.fromRGBO(255, 129, 72, 1),
                  ),
                ),
                Observer(builder: (_) {
                  return Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: CardsWidget(
                      textCampo: "Peso do Prato",
                      valor: controller.peso.toStringAsFixed(3),
                      color: Color.fromRGBO(249, 77, 24, 1),
                    ),
                  );
                }),
              ],
            ),
            centro(),
            footerWidget(),
          ],
        ),
      ),
    );
  }

  Widget centro() {
    return Observer(
      builder: (_) {
        return Container(
          color: Color.fromRGBO(43, 49, 53, 1),
          padding: EdgeInsets.all(50),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  controller.controleBalanca
                      ? ">> Retire o prato <<"
                      : ">> Coloque o prato <<",
                  style: TextStyle(
                      fontSize: 70,
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 120,
                    minWidth: 250,
                    maxWidth: 250,
                  ),
                  child: Card(
                    color: Color.fromRGBO(249, 77, 24, 1),
                    child: Text(
                        "Total Prato: \n R\$ ${controller.valorTotal
                            .toStringAsFixed(2)}"
                            .replaceAll(".", ","),
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: 'Roboto'),
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget footerWidget() {
    return Container(
        color: Color.fromRGBO(249, 77, 24, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextButton(
                onPressed: onConfigApp,
                child: Icon(
                  Icons.computer_outlined,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: onConfigEstacao,
                child: Icon(
                  Icons.settings,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> onConfigApp() {
    return showDialog( barrierDismissible: false, context: context, builder: (_) => DialogConfigApp());
  }

  Future<void> onConfigEstacao() async {
    controller.desligaTimer();

    await showDialog(
      context: context,
      builder: (_) => DialogConfigEstacao(),
    );

    controller.reiniciaTimer(context);
  }
}
