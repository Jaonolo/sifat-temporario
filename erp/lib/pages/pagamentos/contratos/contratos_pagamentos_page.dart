import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_theme.dart';
import '../../../widgets/botao_padrao.dart';
import '../../../widgets/responsive.dart';
import 'contratos_pagamentos_page_controller.dart';

class ContratosPagamentosPage
    extends GetView<ContratosPagamentosPageController> {
// class ContratosIntegradorPage extends StatelessWidget {
  const ContratosPagamentosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//------------ VARIAVEIS------------
    Size _size = MediaQuery.of(context).size;
//------------ EstruturaPrincipal
    return Scaffold(
      body: Responsive(
        mobile: Container(
          height: 200,
          width: 200,
          color: Colors.amber,
        ),
        desktop: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Contratos',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w400,
                    fontSize: 46,
                  ),
                ),
                Expanded(child: Container()),
                _btnAdicionar(),
                const SizedBox(
                  width: 16,
                ),
                _btnDesativar(),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 36,
            ),
            Wrap(
                runAlignment: WrapAlignment.spaceBetween,
                clipBehavior: Clip.antiAlias,
                runSpacing: 16,
                spacing: 16,
                children: [
                  Container(
                    // height: 300,
                    // width: MediaQuery.of(context).size.width * 0.38,
                    width: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.zero,
                      color: Color(0xFFFFEDE8),
                      elevation: 1,
                      child: Container(
                        // width: Get.width / 2,
                        // height: Get.mediaQuery.size.height * 0.4,
                        height: 404,
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Safira',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(44, 49, 55, 1),
                                      )),
                                  Expanded(
                                    child: Container(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(children: [
                                Text(
                                  'Para ativar esse plano, primeiro você precisa\n'
                                  'cancelar seu plano atual',
                                  // softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mensal',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Trimestral',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Semestral',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Anual',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color: AppTheme.adicionar,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Detalhes do plano',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.adicionar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(22, 156, 52, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Comprar agora',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.buttomModalConfirmar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // height: 300,
                    // width: MediaQuery.of(context).size.width * 0.38,
                    width: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.zero,
                      color: Color(0xFFFFEDE8),
                      elevation: 1,
                      child: Container(
                        // width: Get.width / 2,
                        // height: Get.mediaQuery.size.height * 0.4,
                        height: 404,
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Safira',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(44, 49, 55, 1),
                                      )),
                                  Expanded(
                                    child: Container(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(children: [
                                Text(
                                  'Para ativar esse plano, primeiro você precisa\n'
                                  'cancelar seu plano atual',
                                  // softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mensal',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Trimestral',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Semestral',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Anual',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color: AppTheme.adicionar,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Detalhes do plano',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.adicionar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(22, 156, 52, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Comprar agora',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.buttomModalConfirmar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // height: 300,
                    // width: MediaQuery.of(context).size.width * 0.38,
                    width: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.zero,
                      color: Color(0xFFFFEDE8),
                      elevation: 1,
                      child: Container(
                        // width: Get.width / 2,
                        // height: Get.mediaQuery.size.height * 0.4,
                        height: 404,
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Safira',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(44, 49, 55, 1),
                                      )),
                                  Expanded(
                                    child: Container(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(children: [
                                Text(
                                  'Para ativar esse plano, primeiro você precisa\n'
                                  'cancelar seu plano atual',
                                  // softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mensal',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Trimestral',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Semestral',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Anual',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color: AppTheme.adicionar,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Detalhes do plano',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.adicionar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(22, 156, 52, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Comprar agora',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.buttomModalConfirmar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // height: 300,
                    // width: MediaQuery.of(context).size.width * 0.38,
                    width: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.zero,
                      color: Color(0xFFFFEDE8),
                      elevation: 1,
                      child: Container(
                        // width: Get.width / 2,
                        // height: Get.mediaQuery.size.height * 0.4,
                        height: 404,
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Safira',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(44, 49, 55, 1),
                                      )),
                                  Expanded(
                                    child: Container(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(children: [
                                Text(
                                  'Para ativar esse plano, primeiro você precisa\n'
                                  'cancelar seu plano atual',
                                  // softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mensal',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Trimestral',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Semestral',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Anual',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color: AppTheme.adicionar,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Detalhes do plano',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.adicionar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(22, 156, 52, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Comprar agora',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.buttomModalConfirmar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // height: 300,
                    // width: MediaQuery.of(context).size.width * 0.38,
                    width: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.zero,
                      color: Color(0xFFFFEDE8),
                      elevation: 1,
                      child: Container(
                        // width: Get.width / 2,
                        // height: Get.mediaQuery.size.height * 0.4,
                        height: 404,
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Safira',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(44, 49, 55, 1),
                                      )),
                                  Expanded(
                                    child: Container(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(children: [
                                Text(
                                  'Para ativar esse plano, primeiro você precisa\n'
                                  'cancelar seu plano atual',
                                  // softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mensal',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Trimestral',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Semestral',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Anual',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color: AppTheme.adicionar,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Detalhes do plano',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.adicionar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(22, 156, 52, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Comprar agora',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.buttomModalConfirmar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // height: 300,
                    // width: MediaQuery.of(context).size.width * 0.38,
                    width: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.zero,
                      color: Color(0xFFFFEDE8),
                      elevation: 1,
                      child: Container(
                        // width: Get.width / 2,
                        // height: Get.mediaQuery.size.height * 0.4,
                        height: 404,
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Safira',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(44, 49, 55, 1),
                                      )),
                                  Expanded(
                                    child: Container(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(children: [
                                Text(
                                  'Para ativar esse plano, primeiro você precisa\n'
                                  'cancelar seu plano atual',
                                  // softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mensal',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Trimestral',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Semestral',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Anual',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 20,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color: AppTheme.adicionar,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Detalhes do plano',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.adicionar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(22, 156, 52, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Comprar agora',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.buttomModalConfirmar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
            const SizedBox(
              height: 36,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'Contratos Customizados',
                textAlign: TextAlign.left,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w400,
                  fontSize: 46,
                ),
              ),
            ]),
            const SizedBox(
              height: 32,
            ),
            Wrap(
                runAlignment: WrapAlignment.spaceBetween,
                clipBehavior: Clip.antiAlias,
                runSpacing: 16,
                spacing: 16,
                children: [
                  Container(
                    // height: 300,
                    // width: MediaQuery.of(context).size.width * 0.38,
                    width: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.zero,
                      color: Color(0xFFFFEDE8),
                      elevation: 1,
                      child: Container(
                        // width: Get.width / 2,
                        // height: Get.mediaQuery.size.height * 0.4,
                        height: 254,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Safira',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                      )),
                                  Expanded(
                                    child: Container(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(children: [
                                Text(
                                  'Para ativar esse plano, primeiro você precisa\n'
                                  'cancelar seu plano atual',
                                  // softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mensal',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 19,
                                        letterSpacing: 0.5,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w900,
                                        color: Color.fromRGBO(22, 156, 52, 1),
                                        fontSize: 19,
                                        letterSpacing: 0.5,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(22, 156, 52, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Comprar agora',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.buttomModalConfirmar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Contrato Customizadado Ação
                  Container(
                    // height: 300,
                    // width: MediaQuery.of(context).size.width * 0.38,
                    width: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.zero,
                      color: Color.fromRGBO(222, 227, 235, 1),
                      elevation: 1,
                      child: Container(
                        // width: Get.width / 2,
                        // height: Get.mediaQuery.size.height * 0.4,
                        height: 254,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Prata',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(44, 49, 55, 1),
                                      )),
                                  Expanded(
                                    child: Container(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mensal',
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                        fontSize: 19,
                                        letterSpacing: 0.1,
                                      )),
                                  Expanded(child: Container()),
                                  Text('R\$ 50,00',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(66, 71, 78, 1),
                                        fontSize: 19,
                                        letterSpacing: 0.1,
                                      )),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(167, 171, 179, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        'Comprar agora',
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.buttomModalConfirmar,
                                          letterSpacing: 0.25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
            const SizedBox(
              height: 64,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _btnProrrogarContrato() {
  return BotaoPadrao(
    corIcone: AppTheme.adicionar,
    corTexto: Colors.white,
    texto: 'Adicionar',
    icone: Icons.add,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}

Widget _btnFinalizar() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF169C34),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
    ),
    onPressed: () {},
    child: Text(
      'Finalizar',
      softWrap: false,
      style: GoogleFonts.sourceSansPro(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}

Widget _btnAdicionar() {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppTheme.corBranco,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color.fromRGBO(255, 87, 34, 1)),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
    ),
    icon: Icon(
      Icons.add,
      color: Color.fromRGBO(255, 87, 34, 1),
      size: AppTheme.h4,
    ),
    onPressed: () {},
    label: Text(
      'Adicionar',
      softWrap: false,
      style: GoogleFonts.sourceSansPro(
        fontSize: AppTheme.h4,
        color: Color.fromRGBO(255, 87, 34, 1),
      ),
    ),
  );
}

Widget _btnDesativar() {
  return BotaoPadrao(
    corIcone: Color(0xFFBA1A1A),
    corTexto: Colors.white,
    texto: 'Desativar',
    icone: Icons.block,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}
