import 'package:flutter/material.dart';

class CheckBoxMobile extends StatefulWidget {
  bool? isChecked = false;
   CheckBoxMobile(
      {super.key, this.isChecked = false   }
      );

  @override
  State<CheckBoxMobile> createState() => _CheckBoxMobileState();
}

class _CheckBoxMobileState extends State<CheckBoxMobile> {


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
        value: widget.isChecked,
        onChanged: (bool? value) {
          setState(() {
            widget.isChecked = value!;
          });
        },
      ),
    );
  }





}
