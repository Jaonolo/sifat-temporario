import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CheckBoxPadrao extends StatelessWidget {
  // final String nome;
  final bool status;
  final Function alteraStatus;

  const CheckBoxPadrao(
      {required this.status, required this.alteraStatus});

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color.fromRGBO(90, 95, 102, 1);
      }
      return Color.fromRGBO(90, 95, 102, 1);
    }

    return Transform.scale(
      scale: 1,
      child: Checkbox(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(6,),
        ),
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: status,
        onChanged: (bool? v) {
          alteraStatus();
        },
      ),
    );
  }
}
