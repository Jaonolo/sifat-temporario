import 'package:erp/app/config/application.dart';
import 'package:erp/app/rotas/route_names.dart';
import 'package:erp/app/rotas/router.dart';
import 'package:erp/app/services/navigation_service.dart';
import 'package:erp/app/modules/layout_template/layout_template.dart';
import 'package:erp/locator.dart';
import 'package:flutter/material.dart';
import 'package:models/model/enum/clients.dart';
import 'package:requester/config/pws_config.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    inicializePws();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => LayoutTemplate(child: child!),
      key: locator<NavigationService>().navigatorKey,
      scaffoldMessengerKey: locator<NavigationService>().snackbarGlobalKey,
      onGenerateRoute: generateRoute,
      initialRoute: SessaoRoute + "?token=eyJhbGciOiJIUzUxMiJ9.eyJpZEVzdGFjYW9UcmFiYWxobyI6IjE3OSIsImlkU2Vzc2FvIjoiNWRmNWVhNDMtY2RkZC00ZGJjLTk4MDMtY2Q5YmVjNWI5MzhhIiwiY2xpZW50IjoiV0FJVEVSIiwiaWRFbXByZXNhIjoiMTY0IiwiZXhwIjoxNjU3MTM4MzI0LCJpYXQiOjE2NTcxMjM5MjR9.U81pezIopx0KnoocO_xG9_MBM-ovMMeIuYIfA7ACK_gGqf3DIdZczmWdXmFyHrSF7KAlMfGmv12UxTNhkZ5img",
    );
  }

  void inicializePws(){
    Application.pwsConfigWaychef = PWSConfig(
        urlBase: "http://api.jose/api",
        client: Clients.ERP,
        clientSecret: "");
    Application.pwsConfigGateway = PWSConfig(
        urlBase: "http://api.jose:8081",
        client: Clients.ERP,
        clientSecret: "");
  }
}