// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// class ConfirmationDialog extends StatelessWidget {
//   final String title;
//   final String message;
//   final Function onConfirm;
//   final Function? onCancel;
//   final bool showCancelButton;
//   final bool autoCloseable;
//   final String txtConfirmar;
//   final String txtCancelar;
//
//   ConfirmationDialog(
//       {required this.title,
//       required this.message,
//       required this.onConfirm,
//       this.onCancel,
//       this.showCancelButton = true,
//       this.autoCloseable = true,
//       this.txtConfirmar = "Sim",
//       this.txtCancelar = "Não"});
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         side: BorderSide(),
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//       ),
//       title: Text(title),
//       content: SingleChildScrollView(
//         child: Column(
//           children: [
//             Text(message),
//           ],
//         ),
//       ),
//       actions: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (showCancelButton) ...[
//               _btnCancel(context),
//               SizedBox(width: 5,)
//             ],
//             _btnconfirmation(context),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _btnCancel(BuildContext context) {
//     return ElevatedButton(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(Colors.white),
//       ),
//       onPressed: () {
//         if (autoCloseable) close(context);
//         if (onCancel != null) onCancel!.call();
//       },
//       child: Container(
//         height: 30,
//         child: Center(
//           child: Text(
//             txtCancelar,
//             style: TextStyle(fontSize: 20, color: Colors.black),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _btnconfirmation(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         if (autoCloseable) close(context);
//         onConfirm.call();
//       },
//       child: Container(
//         height: 30,
//         child: Center(
//           child: Text(
//             txtConfirmar,
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void close(BuildContext context) => Navigator.pop(context);
// }
