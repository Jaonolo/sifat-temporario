// import 'dart:html';
//
// import 'package:erp/pages/modules/layout_template/layout_template.dart';
// import 'package:erp/pages/plataforma/empresas/plano/plano_page.dart';
// import 'package:erp/pages/plataforma/empresas/plataforma_empresa_page.dart';
// import 'package:erp/pages/routes/app_router.dart';
// import 'package:erp/pages/routes/app_routes.dart';
// import 'package:erp/services/navigation_service.dart';
// import 'package:flutter/material.dart';
import 'package:erp/pages/plataforma/contratosintegrador/contratocustomizado/contrato_customizado_terceira_page.dart';
import 'package:erp/pages/plataforma/contratosintegrador/extras/plataforma_integrador_page_controller.dart';
import 'package:erp/pages/plataforma/contratosplataforma/comissao/comissao_controller.dart';
import 'package:get/get.dart';
// import 'package:erp/theme/app_theme.dart';
// import 'package:erp/pages/routes/app_pages.dart';
// import 'package:requester/config/pws_config.dart';
// import 'package:models/model/enum/clients.dart';
//
// import 'config/application.dart';
// import 'locator.dart';
//
// void main() {
//   Get.lazyPut(()=> PlataformaIntegradorPageController());
//   setupLocator();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     inicializePws();
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
//       ),
//       debugShowCheckedModeBanner: false,
//       builder: (context, child) => LayoutTemplate(child: child!),
//       key: locator<NavigationService>().navigatorKey,
//       scaffoldMessengerKey: locator<NavigationService>().snackbarGlobalKey,
//       onGenerateRoute: generateRoute,
//       // initialRoute: HomeRoute,
//       // initialRoute: SessaoRoute + "?token=eyJhbGciOiJIUzUxMiJ9.eyJpZFVzdWFyaW9FbXByZXNhIjoiMjQ0IiwidGlwb0NsaWVudCI6IkVSUCIsImlkU2Vzc2FvIjoiNDY0MmJlOWMtM2EzNy00ZjA4LWIwZDAtNjg0ZWM4NDQ5MDhmIiwiaWRFbXByZXNhIjoiMSIsImV4cCI6MTY3MTczMzYyNSwiaWF0IjoxNjcxNzE5MjI1fQ.nCi-5nrcX418yIAWLN-tarrn9our6ap8ED1kPTaMdvxUT5rnfz53SoALhbg0dr9LuX59QCkyl0DIXt3D6Kgy0Q",
//     );
//   }
//
//   void inicializePws(){
//     Application.pwsConfigWaychef = PWSConfig(
//         urlBase: "http://api.wenderson/api",
//         client: Clients.ERP,
//         clientSecret: "");
//     Application.pwsConfigGateway = PWSConfig(
//         urlBase: "http://api.wenderson:8081",
//         client: Clients.ERP,
//         clientSecret: "");
//   }
// }



// void main() {
//
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     // TODO: Configurar Thema do aplicativo
//     theme: ThemeData(
//       primaryColor: AppTheme.primary,
//       primarySwatch: AppTheme.swatchPadrao,
//       backgroundColor: AppTheme.background,
//     ),
//
//     initialRoute: Routes.CONTRATO_INTREGRADOR_EXTRAS,
//     // initialRoute: SessaoRoute + "?token=eyJhbGciOiJIUzUxMiJ9.eyJpZEVzdGFjYW9UcmFiYWxobyI6IjE3OSIsImlkU2Vzc2FvIjoiNWRmNWVhNDMtY2RkZC00ZGJjLTk4MDMtY2Q5YmVjNWI5MzhhIiwiY2xpZW50IjoiV0FJVEVSIiwiaWRFbXByZXNhIjoiMTY0IiwiZXhwIjoxNjU3MTM4MzI0LCJpYXQiOjE2NTcxMjM5MjR9.U81pezIopx0KnoocO_xG9_MBM-ovMMeIuYIfA7ACK_gGqf3DIdZczmWdXmFyHrSF7KAlMfGmv12UxTNhkZ5img",
//
//     getPages: AppPages.routes,
//   ));
//
//   void inicializePws(){
//     Application.pwsConfigWaychef = PWSConfig(
//         urlBase: "http://api.wenderson/api",
//         client: Clients.ERP,
//         clientSecret: "");
//     Application.pwsConfigGateway = PWSConfig(
//         urlBase: "http://api.wenderson:8081",
//         client: Clients.ERP,
//         clientSecret: "");
//   }
// }

//
//
import 'config/application.dart';
//
// import 'package:erp/app_antigo/config/application.dart';
import 'package:erp/app_antigo/rotas/route_names.dart';
import 'package:erp/app_antigo/rotas/router.dart';
import 'package:erp/app_antigo/services/navigation_service.dart';
import 'package:erp/app_antigo/modules/layout_template/layout_template.dart';
import 'package:erp/locator.dart';
import 'package:flutter/material.dart';
import 'package:models/model/enum/clients.dart';
import 'package:requester/config/pws_config.dart';

void main() {
  Get.lazyPut(()=> PlataformaIntegradorPageController());
  Get.lazyPut(()=> ComissaoPlataformaPageController());
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    inicializePws();
    return GetMaterialApp(
      title: 'Waychef',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => LayoutTemplate(child: child!),
      key: locator<NavigationService>().navigatorKey,
      scaffoldMessengerKey: locator<NavigationService>().snackbarGlobalKey,
      onGenerateRoute: generateRoute,
      initialRoute: ContratoRoute,
      // initialRoute: Sessa,
      // initialRoute: SessaoRoute + "?token=eyJhbGciOiJIUzUxMiJ9.eyJ0aXBvQ2xpZW50IjoiRVJQIiwiaWRTZXNzYW8iOiJlZDY2NmRkMS05YWMyLTQxMjMtODU4OC0zODM5OWRhMDE3OTciLCJleHAiOjE2NzI3MTM3MTksImlhdCI6MTY3MjY5OTMxOX0.e-f-cvnU8a4s7mRZ3lBvAQWJCzTTp8lALR3NZRmZOqIx6w_B7nxk-6Z8I-4ORlpOBcGgO7-QaBdA8YcTOJWvwg",
    );
  }

  void inicializePws(){
    Application.pwsConfigWaychef = PWSConfig(
        urlBase: "http://api.wenderson/api",
        client: Clients.ERP,
        clientSecret: "");
    Application.pwsConfigGateway = PWSConfig(
        urlBase: "http://api.wenderson:8081",
        client: Clients.ERP,
        clientSecret: "");
  }
}