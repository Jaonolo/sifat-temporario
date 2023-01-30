import 'package:auto_size_text/auto_size_text.dart';
import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_change/status_change.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../app_antigo/rotas/router.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../../widgets/botao_padrao.dart';
import '../../../../../widgets/responsive.dart';
import 'contratos_integrador_controller.dart';



class ContratosIntegradorPage extends GetView<ContratosIntegradorController> {
// class ContratosIntegradorPage extends StatelessWidget {
  const ContratosIntegradorPage({Key? key}) : super(key: key);

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



            const SizedBox(
              height: 36,
            ),


            Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              spacing: 25,
              runSpacing: 25,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.zero,
                  color: Color(0xFFFFEDE8),
                  elevation: 1,
                  child: Container(
                    width: Get.width / 4,
                    // height: Get.mediaQuery.size.height * 0.4,
                    height: 340,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 8,),

                          SizedBox(height: 22,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Safira',
                                  style: GoogleFonts.comfortaa(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 33,
                                    letterSpacing: -0.5,
                                  )
                              ),
                              Expanded(child: Container(),),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Mensal',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Trimestral',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Semestral',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Anual',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  color: Color(0xFFFFEDE8),
                  elevation: 1,
                  child: Container(
                    width: Get.width / 4,
                    // height: Get.mediaQuery.size.height * 0.4,
                    height: 340,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 8,),

                          SizedBox(height: 22,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Diamante',
                                  style: GoogleFonts.comfortaa(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 33,
                                    letterSpacing: -0.5,
                                  )
                              ),
                              Expanded(child: Container(),),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Mensal',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Trimestral',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Semestral',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Anual',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  color: Color(0xFFFFEDE8),
                  elevation: 1,
                  child: Container(
                    width: Get.width / 4,
                    // height: Get.mediaQuery.size.height * 0.4,
                    height: 340,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 8,),

                          SizedBox(height: 22,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Esmeralda',
                                  style: GoogleFonts.comfortaa(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 33,
                                    letterSpacing: -0.5,
                                  )
                              ),
                              Expanded(child: Container(),),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Mensal',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Trimestral',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Semestral',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Anual',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  color: Color(0xFFFFEDE8),
                  elevation: 1,
                  child: Container(
                    width: Get.width / 4,
                    // height: Get.mediaQuery.size.height * 0.4,
                    height: 340,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 8,),

                          SizedBox(height: 22,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Rubi',
                                  style: GoogleFonts.comfortaa(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 33,
                                    letterSpacing: -0.5,
                                  )
                              ),
                              Expanded(child: Container(),),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Mensal',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Trimestral',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Semestral',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Anual',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  color: Color(0xFFFFEDE8),
                  elevation: 1,
                  child: Container(
                    width: Get.width / 4,
                    // height: Get.mediaQuery.size.height * 0.4,
                    height: 340,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 8,),

                          SizedBox(height: 22,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Ametista',
                                  style: GoogleFonts.comfortaa(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 33,
                                    letterSpacing: -0.5,
                                  )
                              ),
                              Expanded(child: Container(),),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Mensal',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Trimestral',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Semestral',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Anual',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  color: Color(0xFFFFEDE8),
                  elevation: 1,
                  child: Container(
                    width: Get.width / 4,
                    // height: Get.mediaQuery.size.height * 0.4,
                    height: 340,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 8,),

                          SizedBox(height: 22,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Turmalina',
                                  style: GoogleFonts.comfortaa(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 33,
                                    letterSpacing: -0.5,
                                  )
                              ),
                              Expanded(child: Container(),),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Mensal',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Trimestral',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Semestral',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),
                          const Divider(thickness: 2,),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Anual',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(23, 28, 34, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                              Expanded(child: Container()),
                              Text('R\$ 50,00',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(22, 156, 52, 1),
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                  )
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),


            const SizedBox(
              height: 72,
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


Widget _btnAdicionar()  {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppTheme.corBranco,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color.fromRGBO(255, 87, 34, 1)),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
    ),
    icon: Icon(Icons.add,
      color: Color.fromRGBO(255, 87, 34, 1),
      size: AppTheme.h4,
    ),
    onPressed: (){
    },
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