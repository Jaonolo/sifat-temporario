import 'package:flutter/material.dart';

class CenterProgressIndicator extends StatelessWidget {
  final progressColor;

  const CenterProgressIndicator({this.progressColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: CircularProgressIndicator(
            valueColor: progressColor != null
                ? AlwaysStoppedAnimation<Color?>(progressColor)
                : null,
          )),
    );
  }
}
