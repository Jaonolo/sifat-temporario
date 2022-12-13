import 'package:erp/pages/empresas/plano/detalhes_plano_page.dart';
import 'package:erp/pages/integrador/contratocustomizado/contrato_customizado_segundo_page.dart';
import 'package:erp/pages/integrador/contratos/contratos_integrador.dart';
import 'package:erp/pages/integrador/plataforma_integrador_page.dart';
import 'package:erp/pages/plataforma/contratointegrador/contrato_integrador_page.dart';
import 'package:get/get.dart';
import 'package:erp/pages/plataforma/plataforma_page.dart';

import '../empresas/plano/comissao_page.dart';
import '../empresas/plano/extras_page.dart';
import '../empresas/plano/plano_page.dart';
import '../empresas/plataforma_empresa_page.dart';
import '../integrador/contratocustomizado/contrato_customizado_page.dart';
import '../integrador/contratocustomizado/contrato_customizado_terceira_page.dart';
import '../integrador/plataforma_integrador_page_bindings.dart';
import '../plataforma/contratointegrador/contrato_padrao.dart';
import '../plataforma/plataforma_page_bindings.dart';

part 'app_routes.dart';


class AppPages {
  static final routes = [
    GetPage(
      name: Routes.PLATAFORMA,
      page: () => PlataformaPage(),
      binding: PlataformaPageBindings(),
    ),
    GetPage(
      name: Routes.PLATAFORMAINTEGRADOR,
      page: () => PlataformaIntegradorPage(),
      binding: PlataformaIntegradorPageBindings(),
    ),

    // ************ PLATAFORMA EMPRESAS ABAIXO *************************
    GetPage(
      name: Routes.PLATAFORMAEMPRESA,
      page: () => PlataformaEmpresaPage(),
      //   binding: PlataformaPageBindings(),
    ),
    GetPage(
      name: Routes.DETALHESDOPLANO,
      page: () => DetalhesPlanoPage(),
      //   binding: PlataformaPageBindings(),
    ),
    GetPage(
      name: Routes.EMPRESA_PLANO,
      page: () => PlanoPage(),
      //   binding: PlataformaPageBindings(),
    ),
    GetPage(
      name: Routes.EMPRESA_EXTRA,
      page: () => ExtrasPage(),
      //   binding: PlataformaPageBindings(),
    ),
    GetPage(
      name: Routes.EMPRESA_COMISSAO,
      page: () => ComissaoPage(),
      //   binding: PlataformaPageBindings(),
    ),

    // ************ PLATAFORMA EMPRESAS ACIMA *************************
    // ************ PLATAFORMA EMPRESAS INTEGRADO ABAIXO *************************

    // GetPage(
    //   name: Routes.CONTRATO,
    //   page: () => ContratoIntegradorPage(),
    //   //   binding: PlataformaPageBindings(),
    // ),
    GetPage(
      name: Routes.CONTRATO_INTREGRADOR,
      page: () => ContratoIntegradorPage(),
      //   binding: PlataformaPageBindings(),
    ),
    GetPage(
      name: Routes.CONTRATO_INTREGRADOR_CUSTOMIZADO,
      page: () => ContratoCustomizadoPage(),
      //   binding: PlataformaPageBindings(),
    ),



    // ************ PLATAFORMA EMPRESAS INTEGRADOR ACIMA *************************

  ];
}