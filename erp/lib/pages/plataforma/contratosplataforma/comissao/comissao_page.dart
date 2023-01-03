import 'package:auto_size_text/auto_size_text.dart';
import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../../widgets/responsive.dart';
import 'comissao_controller.dart';

class ComissaoPlataformaPage extends GetView<ComissaoPlataformaPageController> {
// class EditarContratoErpPage extends StatelessWidget {
  const ComissaoPlataformaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          // leading: null,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Text(
                'Comissão',
                style: GoogleFonts.comfortaa(
                  fontSize: 46,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(23, 28, 34, 1),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
          bottom: TabBar(
            labelColor: AppTheme.corBranco,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelColor: AppTheme.adicionar,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xFFFF5722),
              // bottom: BorderSide(color: Color.fromRGBO(176, 179, 251, 1), width: 5)
            ),
            tabs: [
              Tab(
                child: _size.width > 530
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Text(
                          'Contrato',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.comfortaa(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                        ),
                      )
                    : const Icon(Icons.fact_check_outlined),
              ),
              Tab(
                child: _size.width > 530
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Text(
                          'Contrato extra',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.comfortaa(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                        ),
                      )
                    : const Icon(Icons.fact_check_outlined),
              ),
              Tab(
                child: _size.width > 530
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Text(
                          'Contrato customizado',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.comfortaa(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                        ),
                      )
                    : const Icon(Icons.fact_check_outlined),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Responsive(
                  larguraMaximaMobile: 905,
                  desktop: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Planos',
                          style: GoogleFonts.comfortaa(
                            fontSize: 33,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 24),
                    Container(
                      child: ExpansionTile(
                        collapsedBackgroundColor:
                            Color.fromRGBO(233, 241, 255, 1),
                        title: Text(
                          'Ouro',
                          style: GoogleFonts.comfortaa(
                              fontSize: 33,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 29, 52, 1)),
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
                                              color:
                                                  Color.fromRGBO(13, 13, 13, 1),
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
                                              color:
                                                  Color.fromRGBO(13, 13, 13, 1),
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
                                              color:
                                                  Color.fromRGBO(13, 13, 13, 1),
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
                                              color:
                                                  Color.fromRGBO(0, 51, 85, 1),
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                              ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                              newValue
                                                                  .toString());
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                              ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                              newValue
                                                                  .toString());
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                              ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                              newValue
                                                                  .toString());
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
                                              color:
                                                  Color.fromRGBO(13, 13, 13, 1),
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
                                              color:
                                                  Color.fromRGBO(0, 51, 85, 1),
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                              ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                              newValue
                                                                  .toString());
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                              ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                              newValue
                                                                  .toString());
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                              ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                              newValue
                                                                  .toString());
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
                                              color:
                                                  Color.fromRGBO(13, 13, 13, 1),
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
                                              color:
                                                  Color.fromRGBO(0, 51, 85, 1),
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                              ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                              newValue
                                                                  .toString());
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                              ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                              newValue
                                                                  .toString());
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                              ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                              newValue
                                                                  .toString());
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
                                              color:
                                                  Color.fromRGBO(13, 13, 13, 1),
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
                                              color:
                                                  Color.fromRGBO(0, 51, 85, 1),
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                              ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                              newValue
                                                                  .toString());
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                              ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                              newValue
                                                                  .toString());
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                              ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                              newValue
                                                                  .toString());
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
                                  SizedBox(height: 24),


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
                        collapsedBackgroundColor:
                        Color.fromRGBO(233, 241, 255, 1),
                        title: Text(
                          'Prata',
                          style: GoogleFonts.comfortaa(
                              fontSize: 33,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 29, 52, 1)),
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
                                              color:
                                              Color.fromRGBO(13, 13, 13, 1),
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
                                              color:
                                              Color.fromRGBO(13, 13, 13, 1),
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
                                              color:
                                              Color.fromRGBO(13, 13, 13, 1),
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
                                              color:
                                              Color.fromRGBO(0, 51, 85, 1),
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
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue
                                                              .toString());
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
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue
                                                              .toString());
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
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue
                                                              .toString());
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
                                              color:
                                              Color.fromRGBO(13, 13, 13, 1),
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
                                              color:
                                              Color.fromRGBO(0, 51, 85, 1),
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue
                                                              .toString());
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue
                                                              .toString());
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue
                                                              .toString());
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
                                              color:
                                              Color.fromRGBO(13, 13, 13, 1),
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
                                              color:
                                              Color.fromRGBO(0, 51, 85, 1),
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue
                                                              .toString());
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue
                                                              .toString());
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue
                                                              .toString());
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
                                              color:
                                              Color.fromRGBO(13, 13, 13, 1),
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
                                              color:
                                              Color.fromRGBO(0, 51, 85, 1),
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue
                                                              .toString());
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue
                                                              .toString());
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
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                    onChanged: (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue
                                                              .toString());
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
                                  SizedBox(height: 24),


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
                        collapsedBackgroundColor:
                        Color.fromRGBO(233, 241, 255, 1),
                        title: Text(
                          'Bronze',
                          style: GoogleFonts.comfortaa(
                              fontSize: 33,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.w400,
                              color:
                              Color.fromRGBO(0, 29, 52, 1)),
                        ),
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24),
                            child: Card(
                              elevation: 0,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(24),
                                    color: Color.fromRGBO(
                                        233, 241, 255, 1),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Recorrência',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 23,
                                              letterSpacing: -0.5,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Valor',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 23,
                                              letterSpacing: -0.5,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            'Tipo de cobrança',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 23,
                                              letterSpacing: -0.5,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        24.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Mensal',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'R\$ 10,00',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  0,
                                                  51,
                                                  85,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Nao possui",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Nao possui",
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis,
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Percentual",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Percentual",
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis,
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Monetário",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Monetário",
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis,
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  Container(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        24.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Trimestral',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'R\$ 10,00',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  0,
                                                  51,
                                                  85,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Nao possui",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Nao possui",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Percentual",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Percentual",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Monetário",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Monetário",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  Container(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        24.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Semestral',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'R\$ 10,00',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  0,
                                                  51,
                                                  85,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Nao possui",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Nao possui",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Percentual",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Percentual",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Monetário",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Monetário",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  Container(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        24.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Anual',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'R\$ 10,00',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  0,
                                                  51,
                                                  85,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Nao possui",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Nao possui",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Percentual",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Percentual",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Monetário",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Monetário",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  Container(),
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
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      child: ExpansionTile(
                        collapsedBackgroundColor:
                        Color.fromRGBO(233, 241, 255, 1),
                        title: Text(
                          'Grátis',
                          style: GoogleFonts.comfortaa(
                              fontSize: 33,
                              letterSpacing: -0.5,
                              fontWeight: FontWeight.w400,
                              color:
                              Color.fromRGBO(0, 29, 52, 1)),
                        ),
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24),
                            child: Card(
                              elevation: 0,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(24),
                                    color: Color.fromRGBO(
                                        233, 241, 255, 1),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Recorrência',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 23,
                                              letterSpacing: -0.5,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Valor',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 23,
                                              letterSpacing: -0.5,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            'Tipo de cobrança',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 23,
                                              letterSpacing: -0.5,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        24.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Mensal',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'R\$ 10,00',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  0,
                                                  51,
                                                  85,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Nao possui",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Nao possui",
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis,
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Percentual",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Percentual",
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis,
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Monetário",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Monetário",
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis,
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  Container(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        24.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Trimestral',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'R\$ 10,00',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  0,
                                                  51,
                                                  85,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Nao possui",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Nao possui",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Percentual",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Percentual",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Monetário",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Monetário",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  Container(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        24.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Semestral',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'R\$ 10,00',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  0,
                                                  51,
                                                  85,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Nao possui",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Nao possui",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Percentual",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Percentual",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Monetário",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Monetário",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  Container(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        24.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Anual',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  13,
                                                  13,
                                                  13,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'R\$ 10,00',
                                            style: GoogleFonts
                                                .comfortaa(
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                              color:
                                              Color.fromRGBO(
                                                  0,
                                                  51,
                                                  85,
                                                  1),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Nao possui",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Nao possui",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Percentual",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Percentual",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  RadioListTile(
                                                    value:
                                                    "Valor Monetário",
                                                    groupValue: Get
                                                        .find<
                                                        ComissaoPlataformaPageController>()
                                                        .selectedValue,
                                                    title: Text(
                                                      "Valor Monetário",
                                                      style: GoogleFonts
                                                          .sourceSansPro(
                                                        fontSize:
                                                        15,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        letterSpacing:
                                                        0.25,
                                                      ),
                                                    ),
                                                    onChanged:
                                                        (newValue) {
                                                      Get.find<
                                                          ComissaoPlataformaPageController>()
                                                          .updateSelectedValue(
                                                          newValue.toString());
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                  Container(),
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
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                  ]
                  ),
                  mobile: Container(),
                ),
              ),
            ),
            Container(
              child: Padding(
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
                                'Contrato Extra',
                                style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 23,
                                  letterSpacing: -0.5,
                                  color:
                                  Color.fromRGBO(13, 13, 13, 1),
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
                                  color:
                                  Color.fromRGBO(13, 13, 13, 1),
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
                                'Aplicativo - AutoAtendimento (TOTEM)',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  letterSpacing: 0.15,
                                  color:
                                  Color.fromRGBO(13, 13, 13, 1),
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
                                  color:  Color.fromRGBO(0, 51, 85, 1),
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
                                          overflow:
                                          TextOverflow.ellipsis,
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                          overflow:
                                          TextOverflow.ellipsis,
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                          overflow:
                                          TextOverflow.ellipsis,
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                'Aplicativo - AUTOPESAGEM',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  letterSpacing: 0.15,
                                  color:
                                  Color.fromRGBO(13, 13, 13, 1),
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
                                  color:
                                  Color.fromRGBO(0, 51, 85, 1),
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
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                'Aplicativo - WAYWALLET',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  letterSpacing: 0.15,
                                  color:
                                  Color.fromRGBO(13, 13, 13, 1),
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
                                  color:
                                  Color.fromRGBO(0, 51, 85, 1),
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
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                'Arquivar XML Venda',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  letterSpacing: 0.15,
                                  color:
                                  Color.fromRGBO(13, 13, 13, 1),
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
                                  color:
                                  Color.fromRGBO(0, 51, 85, 1),
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
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                      SizedBox(height: 24),


                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
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
                                  color:
                                  Color.fromRGBO(13, 13, 13, 1),
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
                                  color:
                                  Color.fromRGBO(13, 13, 13, 1),
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
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  letterSpacing: 0.15,
                                  color:
                                  Color.fromRGBO(13, 13, 13, 1),
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
                                  color:  Color.fromRGBO(0, 51, 85, 1),
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
                                          overflow:
                                          TextOverflow.ellipsis,
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                          overflow:
                                          TextOverflow.ellipsis,
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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
                                          overflow:
                                          TextOverflow.ellipsis,
                                          style: GoogleFonts
                                              .sourceSansPro(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          Get.find<
                                              ComissaoPlataformaPageController>()
                                              .updateSelectedValue(
                                              newValue
                                                  .toString());
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

                      SizedBox(height: 24),


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
