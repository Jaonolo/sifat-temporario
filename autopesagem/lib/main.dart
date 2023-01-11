import 'dart:io';

import 'package:autopesagem/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  processRun();
  runApp(MaterialApp(
    home: SplashPage(),
    debugShowCheckedModeBanner: false,
  ));
  doWhenWindowReady(() {
    appWindow.size = Size(1360, 768);

    appWindow.title = "AutoPesagem";
  });
}

Future <void> processRun() async {
  var result = Process.run(
      'C:\\waychef\\utilitario.bat', [],
      runInShell: true);

  result.then((value) {
    print(value.exitCode);
  });
}
