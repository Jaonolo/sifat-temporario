// // import 'package:erp/extensions/string_extension.dart';
// // import 'package:erp/modules/home/home_page.dart';
// // import 'package:erp/modules/intregador/pages/contrato_page.dart';
// // import 'package:erp/modules/not_found/not_found_page.dart';
// // import 'package:erp/modules/sessao/sessao_page.dart';
// import 'package:erp/pages/routes/app_route_names.dart';
// import 'package:erp/config/application.dart';
// import 'package:erp/extensions/string_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:erp/pages/routes/app_router.dart';
// import 'package:get/get.dart';
//
// import '../../app_antigo/modules/home/home_page.dart';
// import '../../app_antigo/modules/not_found/not_found_page.dart';
// import '../plataforma/contratosintegrador/contrato/planos/contratos_integrador_page.dart';
// import '../plataforma/contratosintegrador/contratocustomizado/contrato_customizado_segundo_page.dart';
// import '../plataforma/contratosintegrador/extras/plataforma_integrador_page.dart';
// import '../plataforma/empresas/plataforma_empresa_bindigs.dart';
// import '../plataforma/empresas/plataforma_empresa_page.dart';
// import 'app_pages.dart';
// import 'app_routes.dart';
//
// Route<dynamic> generateRoute(RouteSettings settings) {
//   var routingData = settings.name!.getRoutingData; // Get the routing Data
//
//   try {
//     print(routingData.route);
//     switch (routingData.route) {
//     // Switch on the path from the data
//       case HomeRoute:
//         return _getPageRoute(HomePage(), settings);
//       case SessaoRoute:
//         return _getPageRoute(PlataformaIntegradorPage(), settings);
//       case ContratoRoute:
//         return _getPageRoute(ContratoCustomizadoSegundoPage(), settings);
//       case ContratoIntegradorRoute:
//         return _getPageRoute(PlataformaIntegradorPage(), settings);
//
//
//       default:
//         return _getPageRoute(NotFoundPage(), settings);
//     }
//   } catch (e, s) {
//     print('Ocorreu um erro ao acessar o path: ${routingData.route}');
//     // s.printStackTrace();
//     throw e;
//   }
// }
//
// PageRoute _getPageRoute(Widget child, RouteSettings settings) {
//   return _FadeRoute(child: child, routeName: settings.name!);
// }
//
// class _FadeRoute extends PageRouteBuilder {
//   final Widget child;
//   final String routeName;
//
//   _FadeRoute({required this.child, required this.routeName})
//       : super(
//     settings: RouteSettings(name: routeName),
//     pageBuilder: (
//         BuildContext context,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//         ) =>
//     child,
//     transitionsBuilder: (
//         BuildContext context,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//         Widget child,
//         ) =>
//         FadeTransition(
//           opacity: animation,
//           child: child,
//         ),
//   );
// }
