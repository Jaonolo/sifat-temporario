import 'package:erp/pages/pagamentos/pagamentos_page_controller.dart';
import 'package:erp/pages/pagamentos/pagamentos_relatorios_controller.dart';
import 'package:erp/pages/plataforma/contratosintegrador/contrato/editar_contato_integrador_controller.dart';
import 'package:erp/pages/plataforma/contratosintegrador/contratocustomizado/contrato_customizado_controller.dart';
import 'package:erp/pages/plataforma/contratosintegrador/extras/plataforma_page_controller.dart';
import 'package:erp/pages/plataforma/contratosplataforma/extras/plataforma_integrador_page_controller.dart';
import 'package:erp/pages/plataforma/contratosplataforma/comissao/comissao_controller.dart';
import 'package:erp/pages/plataforma/contratosplataforma/padrao/editarcontrato/editar_contrato_plataforma_controller.dart';
import 'package:erp/pages/plataforma/empresas/plataforma_empresa_controller.dart';
import 'package:get/get.dart';
import 'app_antigo/config/application.dart';
import 'package:erp/app_antigo/rotas/route_names.dart';
import 'package:erp/app_antigo/rotas/router.dart';
import 'package:erp/app_antigo/services/navigation_service.dart';
import 'package:erp/app_antigo/modules/layout_template/layout_template.dart';
import 'package:erp/locator.dart';
import 'package:flutter/material.dart';
import 'package:models/model/enum/clients.dart';
import 'package:requester/config/pws_config.dart';

void main() {
  // Get.lazyPut(()=> PlataformaIntegradorPageController());
  Get.lazyPut(()=> ComissaoPlataformaPageController());
  Get.lazyPut(()=> EditarContratoIntegradorErpController());
  Get.lazyPut(()=> ContratoCustomizadoController());
  Get.lazyPut(()=> EditarContratoPlataformaErpController());
  Get.lazyPut(()=> PlataformaEmpresaController());
  Get.lazyPut(()=> PlataformaPageController());
  Get.lazyPut(()=> PagamentosPageController());
  Get.lazyPut(()=> PagamentosRelatoriosController());
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
      // initialRoute: PagamentoRoute,
      // initialRoute: SessaoRoute,
      initialRoute: SessaoRoute + "?token=eyJhbGciOiJIUzUxMiJ9.eyJ0aXBvQ2xpZW50IjoiRVJQIiwiaWRTZXNzYW8iOiI2ZGRkNmQ0Mi0wYmYwLTQ0YTctOGJkZC05NmQyNWRhYjU5NWQiLCJleHAiOjE2NzU3MTI1NTAsImlhdCI6MTY3NTY5ODE1MH0.hGfjSB46nk967K1N4GyWq_ku6ECXEEC03wkRWHZaBBxyLx_NkQRkYtU1FC2OoLZk7gLC07DC51Gywfs26z9ndQ",
    );
  }

  void inicializePws(){
    Application.pwsConfigWaychef = PWSConfig(
        urlBase: "http://api.wenderson/api",
        // urlBase: "http://dev.api.waybe.com.br/api",
        client: Clients.ERP,
        clientSecret: "");
    Application.pwsConfigGateway = PWSConfig(
        urlBase: "http://api.wenderson:8081",
        // urlBase: "http://dev.api.waybe.com.br:8081",
        client: Clients.ERP,
        clientSecret: "");
  }

}