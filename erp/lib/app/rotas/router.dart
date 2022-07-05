import 'package:erp/app/extensions/string_extension.dart';
import 'package:erp/app/modules/home/home_page.dart';
import 'package:erp/app/modules/intregador/pages/contrato_page.dart';
import 'package:erp/app/modules/not_found/not_found_page.dart';
import 'package:erp/app/modules/sessao/sessao_page.dart';
import 'package:erp/app/rotas/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name!.getRoutingData; // Get the routing Data

  switch (routingData.route) {// Switch on the path from the data
    case HomeRoute:
      return _getPageRoute(HomePage(), settings);
    case SessaoRoute:
      return _getPageRoute(SessaoPage(routingData["token"]), settings);
    case ContratoRoute:
      return _getPageRoute(ContratoPage(), settings);

    default:
      return _getPageRoute(NotFoundPage(), settings);
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
