import 'package:erp/pages/menu/botoes_class.dart';
import 'package:erp/templates/pagina_com_appbar/botao_navegacao.dart';
import 'package:erp/templates/pagina_com_appbar/rodape.dart';
import 'package:erp/templates/pagina_com_appbar/pagina_com_appbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import '../../widgets/personalizados/popup_menu_personalizado_more.dart';
import '../../widgets/responsive.dart';

class PaginaComAppBar extends GetView<PaginaComAppBarController> {
  late final Widget _child;
  late final List<Botoes> _botoesNavegacao;

  PaginaComAppBar(
      {required List<Botoes> botoesNavegacao, required Widget child}) {
    this._child = child;
    this._botoesNavegacao = botoesNavegacao;
  }

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.modoNoturno
            ? Color.fromRGBO(33, 36, 38, 1)
            : Color.fromRGBO(243, 243, 243, 1),
        key: _scaffoldState,
        appBar: _appBarHolder(context),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  vertical: 18),
              sliver: SliverToBoxAdapter(
                child: Responsive(
                  larguraMaximaMobile: 1020,
                  mobile: SizedBox.shrink(),
                  desktop: Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                    child: Row(
                      children: [
                        Text(
                          'Plataforma',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: controller.modoNoturno
                                  ? Color.fromRGBO(255, 255, 255, 1)
                                  : Color.fromRGBO(23, 28, 34, 1)),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Icon(Icons.arrow_forward_ios,
                              size: 13,
                              color: controller.modoNoturno
                                  ? Color.fromRGBO(243, 243, 243, 1)
                                  : Color.fromRGBO(23, 28, 34, 1)),
                        ),
                        Text(
                          'Contrato',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: controller.modoNoturno
                                  ? Color.fromRGBO(255, 255, 255, 1)
                                  : Color.fromRGBO(23, 28, 34, 1)),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              //SliverFillRemaining(
              //  hasScrollBody: false,
              child: _child,
            ),
            SliverToBoxAdapter(child: Responsive(
          desktop: SizedBox.shrink(),
          mobile: Rodape(
            botoesNavegacao: _botoesNavegacao,
            modoNoturno: controller.modoNoturno,
          ),),),
          ],
        ),
        /*bottomNavigationBar: Responsive(
          desktop: SizedBox.shrink(),
          mobile: Rodape(
            botoesNavegacao: _botoesNavegacao,
            modoNoturno: controller.modoNoturno,
          ),
          larguraMaximaMobile: 1020,
        ),*/
      ),
    );
  }

  final Neutral10 = Color.fromRGBO(255, 255, 255, 1);
  final Neutral30 = Color.fromRGBO(234, 247, 253, 1);
  final Neutral50 = Color.fromRGBO(194, 199, 207, 1);
  final Neutral80 = Color.fromRGBO(52, 55, 58, 1);
  final Neutral90 = Color.fromRGBO(33, 36, 38, 1);
  final Neutral100 = Color.fromRGBO(23, 28, 34, 1);
  final PrimaryBrand = Color.fromRGBO(19, 124, 185, 1);
  final Brand400 = Color.fromRGBO(35, 160, 232, 1);

  Widget _mobileDrawer() => Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: _botaoPerfil()),
            ..._gerarBotoesNavegacao(),
          ],
        ),
      );

  PreferredSizeWidget _appBarHolder(context) => PreferredSize(
        preferredSize: Size(double.infinity, 190),
        child: Responsive(
          desktop: _appBarDesktop(context),
          mobile: _appBarMobile(context),
          larguraMaximaMobile: 1020,
        ),
      );

  Widget _appBarDesktop(context) => Obx(
        () => Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 10,
                color: Color.fromRGBO(0, 0, 0, 0.18),
              ),
            ],
            color: controller.modoNoturno
                ? Color.fromRGBO(33, 36, 38, 1)
                : Color.fromRGBO(243, 243, 243, 1),
          ),
          padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/waybe.png',
                    height: controller.larguraLimitada(context, 45),
                  ),
                  _botaoTrocarLoja(context),
                  Wrap(
                    spacing: controller.larguraLimitada(context, 80),
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
                  alignment: _botoesNavegacao.length >= 7 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
                  children: _botoesNavegacao.length >= 7 ? _gerarBotoesNavegacao() : _gerarListaAlternada(_gerarBotoesNavegacao(), SizedBox(height: 0, width: 40,)),
                  )
            ],
          ),
        ),
      );

  Widget _appBarMobile(context) => Obx(
        () => Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 10,
                color: Color.fromRGBO(0, 0, 0, 0.18),
              ),
            ],
            color: controller.modoNoturno
                ? Color.fromRGBO(33, 36, 38, 1)
                : Color.fromRGBO(243, 243, 243, 1),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width > 400 ? 24 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(7, 0, 0, 7),
                child: Image.asset(
                  'images/waybe.png',
                  height: 10,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _botaoTrocarLoja(context),
                  Row(
                    children: [
                      ...MediaQuery.of(context).size.width > 510
                          ? [
                              _botaoTrocarModoNoturno(context),
                              SizedBox(
                                height: 0,
                                width: controller.larguraLimitada(context, 80,
                                    minimum: 5),
                              ),
                            ]
                          : [SizedBox.shrink()],
                      ...MediaQuery.of(context).size.width > 400
                          ? [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications_outlined,
                                  color: controller.modoNoturno
                                      ? Neutral10
                                      : PrimaryBrand,
                                ),
                                iconSize: controller
                                    .larguraLimitada(context, 45, minimum: 24),
                              ),
                              SizedBox(
                                height: 0,
                                width: controller.larguraLimitada(context, 80,
                                    minimum: 5),
                              )
                            ]
                          : [SizedBox.shrink()],
                      PopupMenuMore(
                        offsetx: controller.larguraLimitada(context, 45,
                                minimum: 24) *
                            (14 / 24),
                        offsety: controller.larguraLimitada(context, 45,
                                minimum: 24) *
                            (20 / 24),
                        items: _gerarListaAlternada(
                                _gerarBotoesMore(),
                                Divider(
                                  color: controller.modoNoturno
                                      ? Color.fromRGBO(255, 255, 255, 0.2)
                                      : Color.fromRGBO(0, 0, 0, 0.2),
                                  thickness: 1,
                                  height: 1,
                                  indent: 8,
                                  endIndent: 8,
                                ))
                            .map<PopupMenuItem<Function>>(
                                (e) => _gerarItensMore(e))
                            .toList(),
                        onChange: (a) {},
                        child: Icon(
                          Icons.more_vert,
                          color:
                              controller.modoNoturno ? Neutral10 : PrimaryBrand,
                          size: controller.larguraLimitada(context, 45,
                              minimum: 24),
                        ),
                        color: controller.modoNoturno
                            ? Color.fromRGBO(44, 49, 55, 1)
                            : Neutral10,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  List<Widget> _gerarListaAlternada(List list, divisor) => List.generate(
        2 * list.length - 1,
        (i) => i % 2 == 0 ? list[i ~/ 2] : divisor,
      );

  Widget _botaoTrocarLoja(context) => Obx(
        () => TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                MediaQuery.of(context).size.width > 1020
                    ? EdgeInsets.fromLTRB(16, 0, 24, 0)
                    : EdgeInsets.fromLTRB(5, 5, 9, 5),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  controller.modoNoturno
                      ? Color.fromRGBO(44, 49, 55, 1)
                      : Neutral10)),
          onPressed: () {},
          child: Container(
            width: controller.larguraLimitada(context, 437, minimum: 230),
            height: MediaQuery.of(context).size.width > 1020 ? 80 : 53,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
//                  crossAxisAlignment: MediaQuery.of(context).size.width > 1020
//                      ? CrossAxisAlignment.center
//                      : CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.storefront,
                      size: MediaQuery.of(context).size.width > 1020 ? 37 : 24,
                      color: controller.modoNoturno ? Neutral50 : Brand400,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width > 1020 ? 8 : 5,
                      height: 0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Nome da loja",
                          style: GoogleFonts.comfortaa(
                            color:
                                controller.modoNoturno ? Neutral10 : Neutral100,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Matriz',
                          style: GoogleFonts.sourceSansPro(
                            color:
                                controller.modoNoturno ? Neutral30 : Neutral80,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        )
                      ],
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

  Widget _botaoTrocarModoNoturno(context) => Obx(() => Switch(
        value: !controller.modoNoturno,
        onChanged: (a) => controller.trocarModoNoturno(),
        activeColor: Color.fromRGBO(236, 215, 26, 1),
        inactiveThumbColor: Color.fromRGBO(113, 120, 125, 1),
        activeTrackColor: Color.fromRGBO(243, 243, 243, 1),
        inactiveTrackColor: Color.fromRGBO(113, 120, 125, 1),
        inactiveThumbImage: AssetImage('images/dark_mode_icon.png'),
      ));

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

  List<Widget> _gerarBotoesNavegacao() => _botoesNavegacao
      .asMap()
      .entries
      .map(
        (e) => BotaoNavegacao(items: e.value.items, text: e.value.text, icon: e.value.icon, modoNoturno: controller.modoNoturno)
      )
      .toList();

  PopupMenuItem<Function> _gerarItensMore(Widget child) =>
      PopupMenuItem<Function>(
        padding: EdgeInsets.all(0),
        value: () {},
        child: SizedBox(
          width: double.infinity,
          child: child,
        ),
      );

  final List<Botoes> botoesMore = [
    Botoes(
      icon: Icons.account_circle_outlined,
      text: 'Ver perfil',
      items: [],
    ),
    Botoes(
      icon: Icons.settings_outlined,
      text: 'Configurações',
      items: [],
    ),
    Botoes(
      icon: Icons.login,
      text: 'Sair',
      items: [],
    ),
  ];

  List<Widget> _gerarBotoesMore() => [...botoesMore
  .sublist(0, botoesMore.length - 1)
      .map(
        (e) => Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              FaIcon(
                e.icon,
                color: controller.modoNoturno ? Neutral10 : Neutral90,
                size: 16,
              ),
            SizedBox(height: 0, width: 4),
              Text(
                e.text,
                style: GoogleFonts.sourceSansPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: controller.modoNoturno ? Neutral10 : Neutral90),
              ),
            ],
          ),
        ),
      )
      .toList(), Container(
          padding: EdgeInsets.all(8),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            children: [
              FaIcon(
                botoesMore.last.icon,
                color: Color.fromRGBO(255, 53, 53, 1),
                size: 16,
              ),
              Text(
                botoesMore.last.text,
                style: GoogleFonts.sourceSansPro(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(255, 53, 53, 1),
                ),
              ),
            ],
          ),
        )];
}
