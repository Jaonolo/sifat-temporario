// import 'package:flutter/material.dart';
//
// import '../theme/app_theme.dart';
//
// class RadioButtonPadrao extends StatelessWidget {
//   // final String nome;
//   String selectedValue ;
//   final bool status;
//   final Function alteraStatus;
//
//   RadioButtonPadrao(
//       {required this.status, required this.alteraStatus, this.selectedValue = "Nao possui" });
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     Color getColor(Set<MaterialState> states) {
//       const Set<MaterialState> interactiveStates = <MaterialState>{
//         MaterialState.pressed,
//         MaterialState.hovered,
//         MaterialState.focused,
//       };
//       if (states.any(interactiveStates.contains)) {
//         return Color.fromRGBO(90, 95, 102, 1);
//       }
//       return Color.fromRGBO(90, 95, 102, 1);
//     }
//
//     return Transform.scale(
//       scale: 1,
//       child: RadioListTile(
//           onChanged: (bool? v) {
//             alteraStatus();
//           },
//         groupValue: selectedValue,
//         value: ,
//       ),
//
//
//       // Checkbox(
//       //   shape: RoundedRectangleBorder(
//       //     side: BorderSide(
//       //       width: 1,
//       //       style: BorderStyle.solid,
//       //     ),
//       //     borderRadius: BorderRadius.circular(6,),
//       //   ),
//       //   fillColor: MaterialStateProperty.resolveWith(getColor),
//       //   value: status,
//       //   onChanged: (bool? v) {
//       //     alteraStatus();
//       //   },
//       // ),
//     );
//   }
// }
