import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/pages/toque_comecar/toque_comecar_page.dart';
import 'app/rotas_pages/rotas_pages.dart';

void main() {
  return runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: ToqueComecarPage(),
    initialRoute: Routes.TOQUEPARACOMECAR,
    getPages: AppPages.routes,
  ));
}
