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
      initialRoute: SessaoRoute + "?token=eyJhbGciOiJIUzUxMiJ9.eyJ0aXBvQ2xpZW50IjoiQVBJIiwiaWRTZXNzYW8iOiJiNmY4OTc5My0yYWViLTQwY2MtOWIwZC02OTg0NWEyYjI3ZWYiLCJleHAiOjE2NzU4NzY3NTQsImlhdCI6MTY3NTg2MjM1NH0.WvwuKZbAJTWDt0un115y_8ZdK8uR_isWnj9gfL1NwWHwFUbkRMp-zBeo2GrLyrOCJ0rONnUSDVbNdgTznsY2Ig",
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