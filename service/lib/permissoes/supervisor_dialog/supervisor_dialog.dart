import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/usuario_requester.dart';
import 'package:requester/response/response_pws.dart';
import 'package:utils/utils/string_utils.dart';
import 'package:utils/widgets/custom_input_dialog.dart';
import 'package:utils/widgets/simple_custom_dialog.dart';

class SupervisorDialog {
  static Future<ResponsePws> _validarSupervisor(PWSConfig pwsConfig,
      String token, PrivilegioCodigo privilegioCodigo, String pin) {
    return UsuarioRequester.validarSupervisor(
        pwsConfig, token, privilegioCodigo, NivelPrivilegio.CONSULTAR_PERMITIR,
        pin);
  }

  static Future dialogSupervisor(BuildContext context, PWSConfig pwsConfig,
      String token,
      PrivilegioCodigo privilegioCodigo,
      Function onSucess,
      String menssage) async {
    await showDialog(
        context: context,
        builder: (context) =>
            CustomInputDialog(
              obscure: true,
              closeable: false,
              title: "Supervisor",
              keyboardType: TextInputType.number,
              message: menssage,
              onConfirm: (value) {
                _showProgress(context);
                _validarSupervisor(
                    pwsConfig, token, privilegioCodigo,
                    StringUtils.stringToMd5(value))
                    .then((response) {
                  if (response.isSuccess && response.status == 200) {
                    _closeProgress(context);
                    Navigator.pop(context);
                    onSucess.call();
                  } else {
                    throw PwsException(response.content);
                  }
                }).catchError((error, stackTrace) {
                  _catchError(error, stackTrace, context);
                });
              },
            ));
  }

  static _showProgress(BuildContext context) =>
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              Center(
                child: CircularProgressIndicator(),
              ));

  static _closeProgress(BuildContext context) => Navigator.pop(context);

  static Future _catchError(error, stackTrace, BuildContext context) async {
    print('----> $error \n $stackTrace');
    Navigator.of(context).pop();
    if (error is PwsException) {
      return await _showError(
          context,
          "${error.pws!.message != null ? error.pws!.message : ""}" +
              "${error.pws!.message != null && error.pws!.message!.isNotEmpty &&
                  error.pws!.description != null &&
                  error.pws!.description!.isNotEmpty ? " - " : ""}"
                  "${error.pws!.description != null
                  ? error.pws!.description
                  : ""}");
    } else {
      return await _showError(context, error.toString());
    }
  }

  static Future _showError(BuildContext context, String error) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return SimpleCustomDialog(
            title: "Erro",
            message: error,
          );
        });
  }
}
