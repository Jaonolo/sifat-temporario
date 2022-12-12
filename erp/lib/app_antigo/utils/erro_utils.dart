// import 'package:erp/app/extensions/stack_trace_extension.dart';
// import 'package:erp/app/services/navigation_service.dart';
// import 'package:erp/app/utils/snack_bar_utils.dart';
// import 'package:erp/locator.dart';
// import 'package:flutter/material.dart';
// import 'package:models/model/models.dart';
//
// class ErroUtils {
//   static Future catchError(error, StackTrace stackTrace) async {
//     print('----> $error');
//     stackTrace.printStackTrace();
//
//     String msg = "";
//     if (error is PwsException && error.pws.code != null)
//       msg = "${error.pws.message != null ? error.pws.message : ""}" +
//           "${error.pws.message != null && error.pws.message!.isNotEmpty && error.pws.description != null && error.pws.description!.isNotEmpty ? " - " : ""}"
//               "${error.pws.description != null ? error.pws.description : ""}";
//     else
//       msg = error.toString();
//
//     SnackBarUtils.exibir(msg);
//   }
// }
