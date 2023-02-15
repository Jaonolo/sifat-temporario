import 'package:autoatendimento/novo_auto_atendimento/pages/toque_comecar/toque_comecar_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'rotas_pages/rotas_pages.dart';

void main() {
  return runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: ToqueComecarPage(),
    initialRoute: Routes.TOQUEPARACOMECAR,
    getPages: AppPages.routes,
  ));
}
