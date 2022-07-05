import 'package:erp/app/routes/routes.dart';
import 'package:erp/app/routes/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());//tira o # da url
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with Routes {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: super.generateRoute,
      navigatorKey: navigatorKey,
      initialRoute: "/splash",
    );
  }
}
