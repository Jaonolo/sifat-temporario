import 'package:autoatendimento/app/theme/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waychef AutoAtendimento',
      theme: DefaultTheme.get(),
    ).modular(); //added by extension
  }
}
