import 'package:erp/pages/integrador/plataforma_integrador_page.dart';
import 'package:get/get.dart';
import 'package:erp/pages/plataforma/plataforma_page.dart';

import '../empresas/plano/comissao_page.dart';
import '../empresas/plano/extras_page.dart';
import '../empresas/plano/plano_page.dart';
import '../empresas/plataforma_empresa_page.dart';
import '../integrador/plataforma_integrador_page_bindings.dart';
import '../plataforma/contrato/contrato_padrao.dart';
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
    GetPage(
      name: Routes.EMPRESA,
      page: () => PlataformaEmpresaPage(),
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
    GetPage(
      name: Routes.CONTRATO,
      page: () => ContratoPadraoPage(),
    //   binding: PlataformaPageBindings(),
    ),

  ];
}