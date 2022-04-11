import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/funcoes.dart';
import 'package:utils/widgets/center_progress_indicator.dart';
import 'package:waycard/config/app_config.dart';

class WayCardUtils {
  static showProgress({BuildContext? context}) {
    showDialog(
        context: context != null ? context : AppConfig.globalKey
            .currentContext!,
        barrierDismissible: false,
        builder: (context) => CenterProgressIndicator());
  }

  static closeProgress({BuildContext? context}) {
    Navigator.pop(
        context != null ? context : AppConfig.globalKey.currentContext!);
  }

  static Future catchError(error, stackTrace,
      {bool closeable = false, BuildContext? context}) async {
    print('----> $error'
        '\n $stackTrace');
    if (closeable) Navigator.of(
        context != null ? context : AppConfig.globalKey.currentContext!).pop();
    if (error is PwsException) {
      return await Funcoes.showError(
          context != null ? context : AppConfig.globalKey.currentContext!,
          "${error.pws!.message != null ? error.pws!.message : ""}" +
              "${error.pws!.message != null && error.pws!.message!.isNotEmpty &&
                  error.pws!.description != null &&
                  error.pws!.description!.isNotEmpty ? " - " : ""}"
                  "${error.pws!.description != null
                  ? error.pws!.description
                  : ""}");
    } else {
      return await Funcoes.showError(
          context != null ? context : AppConfig.globalKey.currentContext!,
          error.toString());
    }
  }
}
