import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/responsive.dart';
import 'login_page_controller.dart';

class MenuPage extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _menuBarWidget(),
    );
  }

  final List<Map> _botoes = [
    {
      'icon': FontAwesomeIcons.chartPie,
      'text': 'Dashboard',
    },
    {
      'icon': FontAwesomeIcons.boxesStacked,
      'text': 'Produtos',
    },
    {
      'icon': FontAwesomeIcons.solidUser,
      'text': 'Clientes',
    },
    {
      'icon': FontAwesomeIcons.moneyCheckDollar,
      'text': 'Finanças',
    },
    {
      'icon': FontAwesomeIcons.solidFileLines,
      'text': 'Fiscal',
    },
    {
      'icon': FontAwesomeIcons.magnifyingGlass,
      'text': 'Consultas Rápidas',
    },
    {
      'icon': FontAwesomeIcons.clipboardList,
      'text': 'Análise e relatórios',
    }
  ];

  List<Widget> botoesButtonBar() => _botoes
      .asMap()
      .entries
      .map((e) => SizedBox(
          height: 24,
          child: Obx(() => TextButton(
                style: ButtonStyle(
                  backgroundColor: e.key == controller.menuExibido
                      ? MaterialStateProperty.all<Color>(Colors.blue)
                      : MaterialStateProperty.all<Color>(Colors.red),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
                ),
                onPressed: () {
                  controller.exibirMenu(e.key.toDouble());
                },
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 9,
                  children: [
                    FaIcon(e.value['icon']),
                    Text(e.value['text'], style: GoogleFonts.roboto()),
                    Icon(Icons.expand_more),
                  ],
                ),
              ))))
      .toList();

  PreferredSizeWidget _menuBarWidget() => PreferredSize(
      preferredSize: Size(double.infinity, 190),
      child: Container(
          color: Color.fromRGBO(243, 243, 243, 1),
          padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'images/waybe.png',
                  height: 45,
                ),
                _botaoTrocarLoja(),
                Row(children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_outlined),
                      iconSize: 32),
                  SizedBox(width: 80),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings_outlined),
                      iconSize: 32),
                ]),
                _botaoPerfil(),
              ],
            ),
            SizedBox(height: 15),
            Divider(
              height: 41,
              thickness: 1,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
            ButtonBar(
                buttonPadding: EdgeInsets.all(0),
                alignment: MainAxisAlignment.spaceBetween,
                children: botoesButtonBar())
          ])));

  Widget _botaoTrocarLoja() => TextButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.fromLTRB(16, 0, 24, 0)),
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromRGBO(253, 253, 253, 1))),
      onPressed: () {},
      child: Container(
        width: 437,
        height: 80,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Icon(Icons.storefront, size: 37),
            SizedBox(width: 7.5),
            Text(
              "Nome da loja",
              style: GoogleFonts.comfortaa(),
            ),
          ]),
          Text("Alterar loja"),
        ]),
      ));

  Widget _botaoPerfil() => TextButton(
      style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(0))),
      onPressed: () {},
      child: Row(children: [
        Text(
          "Bem Vindo",
          style: GoogleFonts.comfortaa(),
        ),
        SizedBox(width: 8),
        Icon(Icons.account_circle_outlined, size: 48)
      ]));
}
