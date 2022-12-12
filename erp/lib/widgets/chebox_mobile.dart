import 'package:flutter/material.dart';

class CheckBoxMobile extends StatefulWidget {
  const CheckBoxMobile({super.key});

  @override
  State<CheckBoxMobile> createState() => _CheckBoxMobileState();
}

class _CheckBoxMobileState extends State<CheckBoxMobile> {
  bool isChecked = false;

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
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(6,),

        ),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }





}
