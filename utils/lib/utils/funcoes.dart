import 'dart:io';

import 'package:flutter/material.dart';
import 'package:utils/widgets/simple_custom_dialog.dart';

import 'device_information.dart';

class Funcoes {
  static bool senhaCalculada(String senha) {
    DateTime dateTime = DateTime.now();
    int result = dateTime.year - dateTime.month - dateTime.day - dateTime.hour;
    return senha == result.toString();
  }

  static Future<String?> getDeviceIdentification() async {
    Map<String, dynamic>? info = await DeviceInformation.getInfo();

    if (Platform.isIOS)
      return info!['name'];
    else if (Platform.isAndroid)
      return info!['androidId'];
    else
      return Platform.localHostname;
  }

  static Future showError(BuildContext context, String error) async {
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
