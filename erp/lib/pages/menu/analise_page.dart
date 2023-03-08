import 'package:erp/pages/menu/botoes_class.dart';
import 'package:erp/templates/page_with_appbar/pagina_com_appbar_template.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'analise_page_controller.dart';

class AnalisePage extends GetView<AnalisePageController> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return PaginaComAppBar(
      botoesNavegacao: _botoesNavegacao,
      child: SizedBox.square(dimension: 0),
    );
  }

  final List<Botoes> _botoesNavegacao = [
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
}
