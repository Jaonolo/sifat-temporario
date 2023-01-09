import 'package:erp/app_antigo/extensions/string_extension.dart';
import 'package:erp/app_antigo/modules/home/home_page.dart';
import 'package:erp/app_antigo//modules/intregador/pages/contrato_page.dart';
import 'package:erp/app_antigo/modules/not_found/not_found_page.dart';
import 'package:erp/app_antigo/modules/sessao/sessao_page.dart';
import 'package:erp/app_antigo/rotas/route_names.dart';
import 'package:erp/pages/plataforma/empresas/comissao/comissao_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


import '../../pages/plataforma/contratosintegrador/contrato/editar_contrato_integrador_page.dart';
import '../../pages/plataforma/contratosintegrador/contratocustomizado/contrato_customizado_page.dart';
import '../../pages/plataforma/contratosintegrador/extras/plataforma_integrador_page.dart';
import '../../pages/plataforma/contratosplataforma/padrao/editarcontrato/editar_contrato_plataforma_page.dart';
import '../../pages/plataforma/contratosplataforma/padrao/plataforma_contrato_page.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name!.getRoutingData; // Get the routing Data

  try {
    print(routingData.route);
    print(routingData["token"]);
    switch (routingData.route) {
      // Switch on the path from the data
      case HomeRoute:
        return _getPageRoute(HomePage(), settings);
      case SessaoRoute:
        return _getPageRoute(PlataformaIntegradorPage(routingData["token"]), settings);
      case ContratoRoute:
        return _getPageRoute(ContratoCustomizadoPage(), settings);
      // case ContratoIntegradorRoute:
      //   return _getPageRoute(PlataformaIntegradorPage(), settings);


      default:
        return _getPageRoute(NotFoundPage(), settings);
    }
  } catch (e, s) {
    print('Ocorreu um erro ao acessar o path: ${routingData.route}');
    // s.printStackTrace();
    throw e;
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name!);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
