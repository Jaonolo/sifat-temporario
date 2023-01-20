// ignore_for_file: unnecessary_new

import 'package:autoatendimento/app/modules/home/pages/pedido_viagem/pedido_viagem_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app_controller.dart';

class PedidoViagemComponent {
  final PedidoViagemController controller = PedidoViagemController();
  late BuildContext context;
  late Orientation orientation;

  initialize(BuildContext context) {
    this.context = context;
    orientation = MediaQuery
        .of(context)
        .orientation;
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
                        width: 368,
                        height: 369,
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
                          onPressed: () =>
                              controller.selecionaOpcao('Levar para a viagem'),
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
                        width: 368,
                        height: 369,
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
                          onPressed: () =>
                              controller.selecionaOpcao("Comer no restaurante"),
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