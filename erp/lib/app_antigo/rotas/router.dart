import 'package:erp/app_antigo/extensions/string_extension.dart';
import 'package:erp/app_antigo/modules/home/home_page.dart';
import 'package:erp/app_antigo/modules/not_found/not_found_page.dart';
import 'package:erp/app_antigo/rotas/route_names.dart';
import 'package:erp/pages/pagamentos/pagamentos_relatorio_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../pages/pagamentos/componentes/cartao.dart';
import '../../pages/pagamentos/contratos/contratos_pagamentos_page.dart';
import '../../pages/pagamentos/pagamentos_page.dart';
import '../../pages/plataforma/contratosintegrador/contrato/editar_contrato_integrador_page.dart';
import '../../pages/plataforma/contratosintegrador/contrato/planos/contratos_integrador_page.dart';
import '../../pages/plataforma/contratosintegrador/contratocustomizado/cadastrarplanos/cadastrar_contrato_integrador_page.dart';
import '../../pages/plataforma/contratosintegrador/contratocustomizado/contrato_customizado_page.dart';
import '../../pages/plataforma/contratosintegrador/contratocustomizado/contrato_customizado_segundo_page.dart';
import '../../pages/plataforma/contratosintegrador/contratocustomizado/contrato_customizado_terceira_page.dart';
import '../../pages/plataforma/contratosintegrador/extras/plataforma_page.dart';
import '../../pages/plataforma/contratosplataforma/comissao/comissao_page.dart';
import '../../pages/plataforma/contratosplataforma/extras/plataforma_integrador_page.dart';
import '../../pages/plataforma/contratosplataforma/padrao/editarcontrato/editar_contrato_plataforma_page.dart';
import '../../pages/plataforma/contratosplataforma/padrao/plataforma_contrato_page.dart';
import '../../pages/plataforma/empresas/comissao/comissao_page.dart';
import '../../pages/plataforma/empresas/extras/extras_page.dart';
import '../../pages/plataforma/empresas/plano/plano_page.dart';
import '../../pages/plataforma/empresas/plataforma_empresa_page.dart';


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
        // return _getPageRoute(ContratosPagamentosPage(routingData["token"]), settings);
        return _getPageRoute(PlataformaEmpresaPage(), settings);
      // case ContratoRoute:
      //   return _getPageRoute(PlataformaPage(routingData["token"]), settings);
      case PagamentoRoute:
        return _getPageRoute(ComissaoPage(), settings);
        // return _getPageRoute(Cartao(), settings);
      // case ContratoRoute:
      //   return _getPageRoute(ContratosPagamentosPage(), settings);

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
