// ignore_for_file: unnecessary_new
import 'package:autoatendimento/app/pages/pedido_viagem/pedido_viagem_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../rotas_pages/rotas_pages.dart';

class PedidoViagemComponent {
  final PedidoViagemController controller = PedidoViagemController();
  late BuildContext context;
  late Orientation orientation;
  late double _height;
  late double _width;

  initialize(BuildContext context) {
    this.context = context;

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    orientation = MediaQuery.of(context).orientation;
  }

  body() {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Escolha uma opção',
                      style: GoogleFonts.righteous(
                        fontSize: 60,
                        color: Color.fromRGBO(215, 81, 0, 1),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 76),
                      child: Container(
                        width: _width / 3.3,
                        height: _height / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 4,
                            color: Color.fromRGBO(249, 77, 24, 1),
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                          onPressed: () {Get.toNamed(Routes.MENU);},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/tabler_paper-bag.png'),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 2, left: 60, right: 50),
                                child: Text(
                                  'Levar para a viagem',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 40,
                                    color: Color.fromRGBO(249, 77, 24, 1),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 48,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 76),
                      child: Container(
                        width: _width / 3.3,
                        height: _height / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 4,
                            color: Color.fromRGBO(249, 77, 24, 1),
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                          onPressed: () {Get.toNamed(Routes.MENU);},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/restaurante.png'),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 2, left: 60, right: 50),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 2, left: 60, right: 50),
                                child: Text(
                                  'Comer no restaurante',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 40,
                                    color: Color.fromRGBO(249, 77, 24, 1),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
