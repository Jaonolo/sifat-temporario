import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final larguraMaximaMobile;

  const Responsive({
    Key? key,
    int? this.larguraMaximaMobile = 650,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= larguraMaximaMobile) {
          return desktop;
        }
        else {
          return mobile;
        }
      },
    );
  }
}