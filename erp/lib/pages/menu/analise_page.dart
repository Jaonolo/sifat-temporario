import 'package:erp/pages/menu/botoes_class.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/responsive.dart';
import 'analise_page_controller.dart';

class AnalisePage extends GetView<AnalisePageController> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldState,
        appBar: _appBarHolder(context),
        drawer: Responsive(
          desktop: SizedBox.shrink(),
          mobile: _mobileDrawer(),
          larguraMaximaMobile: 1020,
        ));
  }

  final Neutral10 = Color.fromRGBO(255, 255, 255, 1);
  final Neutral30 = Color.fromRGBO(234, 247, 253, 1);
  final Neutral50 = Color.fromRGBO(194, 199, 207, 1);
  final Neutral80 = Color.fromRGBO(52, 55, 58, 1);
  final Neutral90 = Color.fromRGBO(33, 36, 38, 1);
  final Neutral100 = Color.fromRGBO(23, 28, 34, 1);
  final PrimaryBrand = Color.fromRGBO(19, 124, 185, 1);
  final Brand400 = Color.fromRGBO(35, 160, 232, 1);

  final List<Botoes> _newBotoes = [
    Botoes(
      icon: FontAwesomeIcons.chartPie,
      text: 'Dashboard',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),
    Botoes(
      icon: FontAwesomeIcons.boxesStacked,
      text: 'Produtos',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),
    Botoes(
      icon: FontAwesomeIcons.solidUser,
      text: 'Clientes',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),
    Botoes(
      icon: FontAwesomeIcons.moneyCheckDollar,
      text: 'Finanças',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),
    Botoes(
      icon: FontAwesomeIcons.solidFileLines,
      text: 'Fiscal',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),
    Botoes(
      icon: FontAwesomeIcons.magnifyingGlass,
      text: 'Consultas Rápidas',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),
    Botoes(
      icon: FontAwesomeIcons.clipboardList,
      text: 'Análise e relatórios',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),
  ];

  Widget _mobileDrawer() => Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: _botaoPerfil()),
            ..._botoesButtonBar(),
          ],
        ),
      );

  PreferredSizeWidget _appBarHolder(context) => PreferredSize(
        preferredSize: Size(double.infinity, 190),
        child: Responsive(
          desktop: _appBarDesktop(context),
          mobile: _appBarMobile(),
          larguraMaximaMobile: 1020,
        ),
      );

  Widget _appBarDesktop(context) => Obx(
        () => Container(
          color: controller.modoNoturno
              ? Color.fromRGBO(33, 36, 38, 1)
              : Color.fromRGBO(243, 243, 243, 1),
          padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/waybe.png',
                    height: (MediaQuery.of(context).size.width / 1440) * 45,
                  ),
                  _botaoTrocarLoja(context),
                  Wrap(
                    spacing: (MediaQuery.of(context).size.width / 1440) * 80,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_outlined,
                            color: controller.modoNoturno
                                ? Neutral10
                                : PrimaryBrand,
                          ),
                          iconSize: 32),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings_outlined,
                            color: controller.modoNoturno
                                ? Neutral10
                                : PrimaryBrand,
                          ),
                          iconSize: 32),
                      //_changeThemeButton(),
                    ],
                  ),
                  _botaoPerfil(),
                ],
              ),
              SizedBox(height: 15),
              Obx(
                () => Divider(
                  height: 41,
                  thickness: 1,
                  color: controller.modoNoturno
                      ? Color.fromRGBO(255, 255, 255, 0.2)
                      : Color.fromRGBO(0, 0, 0, 0.2),
                ),
              ),
              ButtonBar(
                  buttonPadding: EdgeInsets.all(0),
                  alignment: MainAxisAlignment.spaceBetween,
                  children: _botoesButtonBar())
            ],
          ),
        ),
      );

  Widget _appBarMobile() => Obx(
        () => Container(
          color: controller.modoNoturno
              ? Color.fromRGBO(33, 36, 38, 1)
              : Color.fromRGBO(243, 243, 243, 1),
          padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'images/waybe.png',
                height: 45,
              ),
              //_botaoTrocarLoja(),
              Wrap(
                spacing: 80,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_outlined,
                        color:
                            controller.modoNoturno ? Neutral10 : PrimaryBrand,
                      ),
                      iconSize: 32),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings_outlined,
                        color:
                            controller.modoNoturno ? Neutral10 : PrimaryBrand,
                      ),
                      iconSize: 32),
                  _botaoTrocarModoNoturno(),
                  IconButton(
                      onPressed: () =>
                          _scaffoldState.currentState?.openEndDrawer(),
                      icon: Icon(
                        Icons.settings_outlined,
                        color:
                            controller.modoNoturno ? Neutral10 : PrimaryBrand,
                      ),
                      iconSize: 32),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _botaoTrocarLoja(context) => Obx(
        () => TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.fromLTRB(16, 0, 24, 0)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  controller.modoNoturno
                      ? Color.fromRGBO(44, 49, 55, 1)
                      : Neutral10)),
          onPressed: () {},
          child: Container(
            width: (MediaQuery.of(context).size.width / 1440) * 437,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.storefront,
                      size: 37,
                      color: controller.modoNoturno ? Neutral50 : Brand400,
                    ),
                    SizedBox(width: 7.5),
                    Text(
                      "Nome da loja",
                      style: GoogleFonts.comfortaa(
                          color:
                              controller.modoNoturno ? Neutral10 : Neutral100),
                    ),
                  ],
                ),
                Text(
                  "Alterar loja",
                  style: GoogleFonts.sourceSansPro(
                    color: controller.modoNoturno ? Neutral10 : PrimaryBrand,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _botaoTrocarModoNoturno() => Obx(
        () => TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                controller.modoNoturno
                    ? Color.fromRGBO(44, 49, 55, 1)
                    : Neutral10,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              fixedSize: MaterialStateProperty.all<Size>(Size.fromRadius(24))),
          onPressed: () => controller.trocarModoNoturno(),
          child: Icon(
            controller.modoNoturno
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
            color: controller.modoNoturno ? Neutral10 : PrimaryBrand,
          ),
        ),
      );

  Widget _botaoPerfil() => Obx(
        () => TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.all(0))),
          onPressed: () {},
          child: Row(
            children: [
              Text(
                "Bem Vindo",
                style: GoogleFonts.comfortaa(
                    color: controller.modoNoturno ? Neutral10 : Neutral90),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.account_circle_outlined,
                size: 48,
                color: controller.modoNoturno ? Neutral10 : Neutral90,
              )
            ],
          ),
        ),
      );

  List<Widget> _botoesButtonBar() => _newBotoes
      .asMap()
      .entries
      .map(
        (e) => SizedBox(
          height: 24,
          child: Obx(
            () => PopupMenuButton(
              shape: RoundedRectangleBorder(),
              offset: Offset(0, 20),
              padding: EdgeInsets.all(0),
              color: controller.modoNoturno
                  ? Color.fromRGBO(44, 49, 55, 1)
                  : Neutral10,
              position: PopupMenuPosition.under,
              itemBuilder: (context) => e.value.items
                  .map<PopupMenuEntry<Function>>(_gerarItens)
                  .toList(),
              child: Obx(
                () => Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 9,
                  children: [
                    FaIcon(e.value.icon,
                        color: controller.modoNoturno ? Neutral10 : Neutral90),
                    Text(e.value.text,
                        style: GoogleFonts.roboto(
                            color: controller.modoNoturno
                                ? Neutral10
                                : Neutral90)),
                    Icon(Icons.expand_more,
                        color: controller.modoNoturno ? Neutral10 : Neutral90),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
      .toList();

  PopupMenuEntry<Function> _gerarItens(MenuEntries e) =>
      PopupMenuItem<Function>(
        padding: EdgeInsets.all(0),
        value: e.onClick,
        child: SizedBox(
          width: double.infinity,
          child: Text('Item 1'),
        ),
      );
}
