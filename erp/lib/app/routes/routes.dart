import 'package:erp/app/pages/sessao/sessao_page.dart';
import 'package:erp/app/pages/splash/splash_page.dart';
import 'package:erp/app/routes/routes_utils.dart';
import 'package:flutter/material.dart';

abstract class Routes {

  Map<String, WidgetBuilderArgs> get routes => {
    "/splash": (context, args) => SplashPage(),
    "/sessao": (context, args) => SessaoPage(),
  };


  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}