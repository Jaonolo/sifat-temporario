import 'package:auto_size_text/auto_size_text.dart';
import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../theme/app_theme.dart';
import '../../../../../widgets/botao_padrao.dart';
import '../../../../../widgets/botao_proximo.dart';
import '../../../../../widgets/responsive.dart';
import 'comissao_controller.dart';

class ComissaoPlataformaPage extends GetView<ComissaoPlataformaPageController> {
// class EditarContratoErpPage extends StatelessWidget {
  const ComissaoPlataformaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedValue = "Nao possui";
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
        desktop: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Container(
                child: Text('Comissão',
                    style: GoogleFonts.comfortaa(
                      fontSize: 46,
                      fontWeight: FontWeight.w400,

                    ),
                    ),
              ),
              Container(
                child: Row(
                  children: [
                    Text('Contrato'),
                    Text('Contrato extra'),
                    Text('Contrato customizado'),
                  ],
                ),
              ),
              Container(
                child: Text('Planos',
                    style: GoogleFonts.comfortaa(
                      fontSize: 33,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w400,
                  ),
                  ),
              ),
              SizedBox(height: 24),
              Container(
                child: ExpansionTile(
                  collapsedBackgroundColor: Color.fromRGBO(233, 241, 255, 1),
                  title: Text(
                    'Ouro',
                    style: GoogleFonts.comfortaa(
                      fontSize: 33,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 29, 52, 1)
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(24),
                              color: Color.fromRGBO(233, 241, 255, 1),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Recorrência',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Valor',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      'Tipo de cobrança',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Mensal',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                      ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                        ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                        newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                      ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                        ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                        newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                      ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                        ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                        newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Trimestral',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                      ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                        ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                        newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                      ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                        ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                        newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                      ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                        ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                        newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Semestral',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                      ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                        ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                        newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                      ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                        ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                        newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                      ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                        ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                        newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Anual',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                      ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                        ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                        newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                      ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                        ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                        newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                      ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                        ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                        newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          // RadioListTile(
                                          //   value: "Valor Percentual",
                                          //   groupValue: Get.find<ComissaoPlataformaPageController>().selectedValue,
                                          //   title: Text("Valor Percentual"),
                                          //   onChanged: (newValue) {
                                          //     Get.find<ComissaoPlataformaPageController>().updateSelectedValue(newValue.toString());
                                          //   },
                                          // ),
                                          // RadioListTile(
                                          //   value: "Valor Monetario",
                                          //   groupValue: Get.find<ComissaoPlataformaPageController>().selectedValue,
                                          //   title: Text("Valor Monetario"),
                                          //   onChanged: (newValue) {
                                          //     Get.find<ComissaoPlataformaPageController>().updateSelectedValue(newValue.toString());
                                          //   },
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                child: ExpansionTile(
                  collapsedBackgroundColor: Color.fromRGBO(233, 241, 255, 1),
                  title: Text(
                    'Prata',
                    style: GoogleFonts.comfortaa(
                        fontSize: 33,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 29, 52, 1)
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(24),
                              color: Color.fromRGBO(233, 241, 255, 1),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Recorrência',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Valor',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      'Tipo de cobrança',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Mensal',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Trimestral',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Semestral',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Anual',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          // RadioListTile(
                                          //   value: "Valor Percentual",
                                          //   groupValue: Get.find<ComissaoPlataformaPageController>().selectedValue,
                                          //   title: Text("Valor Percentual"),
                                          //   onChanged: (newValue) {
                                          //     Get.find<ComissaoPlataformaPageController>().updateSelectedValue(newValue.toString());
                                          //   },
                                          // ),
                                          // RadioListTile(
                                          //   value: "Valor Monetario",
                                          //   groupValue: Get.find<ComissaoPlataformaPageController>().selectedValue,
                                          //   title: Text("Valor Monetario"),
                                          //   onChanged: (newValue) {
                                          //     Get.find<ComissaoPlataformaPageController>().updateSelectedValue(newValue.toString());
                                          //   },
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                child: ExpansionTile(
                  collapsedBackgroundColor: Color.fromRGBO(233, 241, 255, 1),
                  title: Text(
                    'Bronze',
                    style: GoogleFonts.comfortaa(
                        fontSize: 33,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 29, 52, 1)
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(24),
                              color: Color.fromRGBO(233, 241, 255, 1),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Recorrência',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Valor',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      'Tipo de cobrança',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Mensal',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Trimestral',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Semestral',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Anual',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          // RadioListTile(
                                          //   value: "Valor Percentual",
                                          //   groupValue: Get.find<ComissaoPlataformaPageController>().selectedValue,
                                          //   title: Text("Valor Percentual"),
                                          //   onChanged: (newValue) {
                                          //     Get.find<ComissaoPlataformaPageController>().updateSelectedValue(newValue.toString());
                                          //   },
                                          // ),
                                          // RadioListTile(
                                          //   value: "Valor Monetario",
                                          //   groupValue: Get.find<ComissaoPlataformaPageController>().selectedValue,
                                          //   title: Text("Valor Monetario"),
                                          //   onChanged: (newValue) {
                                          //     Get.find<ComissaoPlataformaPageController>().updateSelectedValue(newValue.toString());
                                          //   },
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                child: ExpansionTile(
                  collapsedBackgroundColor: Color.fromRGBO(233, 241, 255, 1),
                  title: Text(
                    'Grátis',
                    style: GoogleFonts.comfortaa(
                        fontSize: 33,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 29, 52, 1)
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(24),
                              color: Color.fromRGBO(233, 241, 255, 1),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Recorrência',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Valor',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      'Tipo de cobrança',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Mensal',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Trimestral',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Semestral',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Anual',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'R\$ 10,00',
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        letterSpacing: 0.15,
                                        color: Color.fromRGBO(0, 51, 85, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Nao possui",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Nao possui",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Percentual",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Percentual",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile(
                                              value: "Valor Monetário",
                                              groupValue: Get.find<
                                                  ComissaoPlataformaPageController>()
                                                  .selectedValue,
                                              title: Text(
                                                "Valor Monetário",
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.25,
                                                ),
                                              ),
                                              onChanged: (newValue) {
                                                Get.find<
                                                    ComissaoPlataformaPageController>()
                                                    .updateSelectedValue(
                                                    newValue.toString());
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          // RadioListTile(
                                          //   value: "Valor Percentual",
                                          //   groupValue: Get.find<ComissaoPlataformaPageController>().selectedValue,
                                          //   title: Text("Valor Percentual"),
                                          //   onChanged: (newValue) {
                                          //     Get.find<ComissaoPlataformaPageController>().updateSelectedValue(newValue.toString());
                                          //   },
                                          // ),
                                          // RadioListTile(
                                          //   value: "Valor Monetario",
                                          //   groupValue: Get.find<ComissaoPlataformaPageController>().selectedValue,
                                          //   title: Text("Valor Monetario"),
                                          //   onChanged: (newValue) {
                                          //     Get.find<ComissaoPlataformaPageController>().updateSelectedValue(newValue.toString());
                                          //   },
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget expandedListaLimites() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Limites',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )),
    children: [
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Faturamento/mês',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Cadastro de Produtos',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Contas a receber',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Contas a pagar',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Usuários e conexões simultâneas',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    ],
  );
}

Widget expandedListaFinanceiro() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Financeiro',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )),
    children: [
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Módulo Financeiro',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Controle de boleto bancário',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Controle de cartões',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Controle de DRE/DFC',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Controle de vendas a prazo',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    ],
  );
}

Widget expandedListaFiscal() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Fiscal',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )),
    children: [
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Emissão de NF-e (saída)',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Emissão de NFS-e (serviço)',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Lançamento NF-e (entrada)',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    ],
  );
}

Widget expandedListaEstoque() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Estoque',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )),
    children: [
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Módulo Estoque',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Controle de multiplos locais',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    ],
  );
}

Widget expandedListaProduto() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Produto',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )),
    children: [
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Controle de observações',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Controle de gerador de etiqueta',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Controle de pacotes',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Controle de promoção',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Controle de tabela de preços',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Controle de variações',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    ],
  );
}

Widget expandedListaValores() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Valores',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )),
    children: [
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Valor mensal',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Valor trimestral',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Valor semestral',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Valor anual',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    ],
  );
}

Widget _btnProximo() {
  return BotaoPadraoProximo(
    corTexto: Colors.white,
    texto: 'Próximo',
    // icone: Icons.calendar_today_outlined,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}

Widget _btnAdicionar() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Color(0xFFFF5722),
        ),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        textAlign: TextAlign.end,
        'Adicionar',
        style: GoogleFonts.sourceSansPro(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFF5722),
          letterSpacing: 0.25,
        ),
      ),
    ),
  );
}

Widget _btnSalvar() {
  return BotaoPadrao(
    corIcone: AppTheme.salvar,
    corTexto: Colors.white,
    texto: 'Salvar',
    icone: Icons.save,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}

//TODO SEPARAR O MODAL ABAIXO DEPOIS
