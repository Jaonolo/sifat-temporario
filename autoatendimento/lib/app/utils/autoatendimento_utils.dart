import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/funcoes.dart';
import 'package:utils/widgets/center_progress_indicator.dart';

class AutoatendimentoUtils {
  static showProgress({required BuildContext context}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CenterProgressIndicator());
  }

  static closeProgress({required BuildContext context}) {
    Navigator.pop(context);
  }

  static Future catchError(error, stackTrace, BuildContext context) async {
    print('----> $error');

    if (error is PwsException) {
      return await Funcoes.showError(context, error.toString());
    }

    return await Funcoes.showError(context, error.toString());
  }
}
