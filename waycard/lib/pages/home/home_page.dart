import 'package:flutter/material.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/pages/home/home_page_component.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageComponent {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    AppConfig.globalKey = key;
    initialize(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) =>
          Scaffold(
            key: key,
            appBar: appBar(),
            body: body(),
            drawer: drawer(),
          ),
    );
  }
}
