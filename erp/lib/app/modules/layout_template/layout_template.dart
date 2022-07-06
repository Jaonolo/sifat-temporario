import 'package:flutter/material.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;

  const LayoutTemplate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }
}
