import 'package:autopesagem/config/app_config.dart';
import 'package:autopesagem/pages/splash/splash_page_component.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SplashPage extends StatefulWidget {

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashPageComponent{
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    AppConfig.globalKey = key;
    initialize(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: body(),
    );
  }
}
