import 'package:autopesagem/pages/splash/splash_page_component.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget with SplashPageComponent {

  @override
  Widget build(BuildContext context) {
    initialize(context: context);
    return Scaffold(
      body: body(),
    );
  }
}
