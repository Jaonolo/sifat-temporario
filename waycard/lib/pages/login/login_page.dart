import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/pages/login/login_page_component.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageComponent {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    AppConfig.globalKey = key;
    initialize(context: context);
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    setSize(size);

    return Builder(builder: (context) {
      return Scaffold(
        key: key,
        body: body(),
      );
    });
  }
}
