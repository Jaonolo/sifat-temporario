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
      initialRoute: SessaoRoute + "?token=eyJhbGciOiJIUzUxMiJ9.eyJpZFNlc3NhbyI6IjBhN2EzMzUxLTA2Y2ItNGM5Ni05YjY3LWQ3NWNlYmI3OGUwYiIsImNsaWVudCI6IkVSUCIsImV4cCI6MTY1NzEyNzg0MiwiaWF0IjoxNjU3MTEzNDQyfQ.GRqkdoWNnTXOxnr5SCD7pgJnvvqK_QoVtp24taVSvaEVtD19Y3VypwhkZuzSW1HFsyNnwz6RBfcW0Nwew7RRVw",
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