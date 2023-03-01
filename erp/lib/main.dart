import 'package:erp/pages/pagamentos/pagamentos_page_controller.dart';
import 'package:erp/pages/pagamentos/pagamentos_relatorios_controller.dart';
import 'package:erp/pages/plataforma/contratosintegrador/contrato/editar_contato_integrador_controller.dart';
import 'package:erp/pages/plataforma/contratosintegrador/contratocustomizado/contrato_customizado_controller.dart';
import 'package:erp/pages/plataforma/contratosintegrador/extras/plataforma_page_controller.dart';
import 'package:erp/pages/plataforma/contratosplataforma/comissao/comissao_controller.dart';
import 'package:erp/pages/plataforma/contratosplataforma/extras/extra_integrador_controller.dart';
import 'package:erp/pages/plataforma/contratosplataforma/padrao/editarcontrato/editar_contrato_plataforma_controller.dart';
import 'package:erp/pages/plataforma/empresas/plataforma_empresa_controller.dart';
import 'package:erp/pages/routes/app_pages.dart';
import 'package:erp/theme/app_theme.dart';
import 'package:get/get.dart';
import 'app_antigo/config/application.dart';
import 'package:erp/app_antigo/services/navigation_service.dart';
import 'package:erp/app_antigo/modules/layout_template/layout_template.dart';
import 'package:erp/locator.dart';
import 'package:flutter/material.dart';
import 'package:models/model/enum/clients.dart';
import 'package:requester/config/pws_config.dart';

import 'pages/modules/error/tela_de_erro.dart';


void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    // theme: AppTheme.get(),
    theme: AppTheme.get(),
    initialRoute: Routes.LOGIN,
    getPages: AppPages.routes,
    unknownRoute: GetPage(name: '/paginanaoencontrada', page: () => TELADEERRO()),
  ));
}


//
// void main() {
//   // Get.lazyPut(()=> PlataformaIntegradorPageController());
//   // Get.lazyPut(()=> ComissaoPlataformaPageController());
//   // Get.lazyPut(()=> EditarContratoIntegradorErpController());
//   // Get.lazyPut(()=> ContratoCustomizadoController());
//   // Get.lazyPut(()=> EditarContratoPlataformaErpController());
//   // Get.lazyPut(()=> PlataformaEmpresaController());
//   // Get.lazyPut(()=> PlataformaPageController());
//   // Get.lazyPut(()=> PagamentosPageController());
//   // Get.lazyPut(()=> PagamentosRelatoriosController());
//   // Get.lazyPut(()=> ExtraIntegradorPageController());
//   // setupLocator();
//   runApp(MyApp(
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     inicializePws();
//     return GetMaterialApp(
//       title: 'Waychef',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
//       ),
//       debugShowCheckedModeBanner: false,
//       builder: (context, child) => LayoutTemplate(child: child!),
//       key: locator<NavigationService>().navigatorKey,
//       scaffoldMessengerKey: locator<NavigationService>().snackbarGlobalKey,
//       unknownRoute: GetPage(name: '/404', page: () =>  Container(child: Text('Pagina não encontrada'),)),
//       initialRoute: Routes.LOGIN,
//       getPages: AppPages.routes,
//       // onGenerateRoute: generateRoute,
//       // initialRoute: PagamentoRoute,
//       // initialRoute: TelaErrorRoute,
//       // initialRoute: ContratoRoute + "?token=eyJhbGciOiJIUzUxMiJ9.eyJ0aXBvQ2xpZW50IjoiRVJQIiwiaWRTZXNzYW8iOiIzZDM4OTViYi01NDMwLTRiZTgtYTVmZC1iOGMxZmZlYTA0MGYiLCJleHAiOjE2Nzc1Mjg4MDUsImlhdCI6MTY3NzUxNDQwNX0.WciEoU-g-p4cu5WJ6anKIYHPhILhTmcb3ZrukC_r2YlWhOmGRdgiiF91kqSr4gT63UjGfLm8uQDdtfp_8M3sSA",
//     );
//   }
//
//   void inicializePws(){
//     Application.pwsConfigWaychef = PWSConfig(
//         urlBase: "http://api.wenderson/api",
//         // urlBase: "http://dev.api.waybe.com.br/api",
//         client: Clients.ERP,
//         clientSecret: "");
//     Application.pwsConfigGateway = PWSConfig(
//         urlBase: "http://api.wenderson:8081",
//         // urlBase: "http://dev.api.waybe.com.br:8081",
//         client: Clients.ERP,
//         clientSecret: "");
//   }
//
// }