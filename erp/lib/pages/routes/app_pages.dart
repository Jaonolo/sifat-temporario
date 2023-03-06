import 'package:erp/app_antigo/config/application.dart';
import 'package:erp/pages/menu/analise_page.dart';
import 'package:erp/pages/menu/analise_page_bindings.dart';
import 'package:erp/pages/plataforma/contratosintegrador/extras/plataforma_page.dart';
import 'package:get/get.dart';

import '../login/login_page.dart';
import '../login/login_page2.dart';
import '../login/login_page_bindings.dart';
import '../plataforma/contratosintegrador/extras/plataforma_page_bindings.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.ANALISE_E_RELATORIOS,
      page: () => AnalisePage(),
      binding: AnalisePageBindings(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginPageBindings(),
    ),
    // PLATAFORMA EMPRESAS ABAIXO
    GetPage(
      name: Routes.PLATAFORMA_CONTRATOS_INTEGRADOR_EXTRA,
      page: () => PlataformaPage(Application.tokenUsuario),
      binding: PlataformaPageBindings(),
    ),
    // GetPageRoute(
    //   name: PLATAFORMA_EMPRESA_PLANO,
    //   page: () => PlanoPage(),
    //   binding: PlanoBindings(),
    // ),
    // GetPage(
    //   name: Routes.PLATAFORMA_EMPRESA_EXTRA,
    //   page: () => ExtrasPage(),
    //   binding: ExtrasBindings(),
    // ),
    // GetPage(
    //   name: Routes.PLATAFORMA_EMPRESA_COMISSAO,
    //   page: () => ComissaoPage(),
    //   binding: ComissaoBindings(),
    // ),
    //
  ];
}
