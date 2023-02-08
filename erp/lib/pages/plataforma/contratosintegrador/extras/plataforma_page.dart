import 'dart:js';

import 'package:erp/pages/plataforma/contratosintegrador/extras/plataforma_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:models/model/models.dart';

// import 'package:models/model/models.dart';
import '../../../../app_antigo/config/application.dart';
import '../../../../theme/app_theme.dart';
import '../../../../widgets/botao_padrao.dart';
import '../../../../widgets/carregamento/icone_carregando.dart';
import '../../../../widgets/responsive.dart';

class PlataformaPage extends GetView<PlataformaPageController> {
  String? token;

  PlataformaPage(this.token) {
    print(this.token);
    Application.tokenUsuario = token!;
  }

  @override
  Widget build(BuildContext context) {
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
                _btnSalvar(),
              ],
            ),

            Column(
              // padding:
              // const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(child: _tabelaPlataformaVersaoList()),
                Container(child: _tabelaPlataformaVersaoListFilhos()),
                // Card(
                //   elevation: 0,
                //   child:
                // ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 64,
            ),
          ],
        ),


      ),
    );
  }

//----------- WIDGETS
  Widget _btnSalvar() {
    return BotaoPadrao(
        corIcone: AppTheme.salvar,
        corTexto: Colors.white,
        texto: 'Salvar',
        icone: Icons.save,
        acao: () {
          controller.atualizarItemConfiguracaoIntegrador();
        });
  }

  Widget _tabelaPlataformaVersaoList() {
    return Card(
      margin: EdgeInsets.zero,
      color: Color.fromRGBO(233, 241, 255, 1),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Função / aplicação',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.comfortaa(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 51, 85, 1),
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Nome',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.comfortaa(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 51, 85, 1),
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Detalhes',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.comfortaa(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 51, 85, 1),
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Valor',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.comfortaa(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 51, 85, 1),
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Disponível',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.comfortaa(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 51, 85, 1),
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabelaPlataformaVersaoListFilhos() {
    return Obx(
      () => controller.carregando
          ? const IconeCarregando()
          : Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: controller.listaPlataformaContratoIntegradorExtra.length,
              itemBuilder: (context, index) {
                ItemConfiguracaoIntegradorWaychef itemConfiguracaoIntegradorWaychef = controller.listaPlataformaContratoIntegradorExtra[index];
                return
                  Card(
                    margin: EdgeInsets.zero,
                    // color: Color.fromRGBO(233, 241, 255, 1),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  // controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.tipoItemContratoWaychef!,
                                  itemConfiguracaoIntegradorWaychef.itemConfiguracaoWaychefDTO.tipoItemContratoWaychef!,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 51, 85, 1),
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child:
                            Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(49)
                                    ],
                                    initialValue: itemConfiguracaoIntegradorWaychef.itemConfiguracaoWaychefDTO
                                                .nome != null
                                        ? itemConfiguracaoIntegradorWaychef.itemConfiguracaoWaychefDTO.nome
                                        : " ",
                                    onChanged: (text) {
                                      controller
                                          .mapDetalhes[itemConfiguracaoIntegradorWaychef.itemConfiguracaoWaychefDTO
                                              .id!]!.itemConfiguracaoWaychefDTO.nome = text;
                                    },
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      // labelText: controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.detalhes!,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black87),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black87),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    ),
                                    style: GoogleFonts.sourceSansPro(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF171C22),
                                    ),
                                  ),
                                ),
                              ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Detalhes',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 51, 85, 1),
                                    letterSpacing: 0.15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Valor',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 51, 85, 1),
                                    letterSpacing: 0.15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Disponível',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 51, 85, 1),
                                    letterSpacing: 0.15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
              }


            ),
          ),
    );
  }

  Widget _mensagemErro() {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        'Nenhuma resultado encontrado!',
        style: TextStyle(
          color: AppTheme.cancel,
          fontSize: AppTheme.h3,
        ),
      ),
    );
  }

// Widget _tabelaPlataforma() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.stretch,
//     children: [
//       Obx(
//             () =>
//         controller.carregando
//             ? const IconeCarregando()
//             :
//         PaginatedDataTable(
//           rowsPerPage: controller.listaPlataformaContratoIntegradorExtra
//               .length,
//           horizontalMargin: 0,
//           // DataTable(
//           source:
//
//           Tabela(
//               // data: controller.listaPlataformaContratoIntegradorExtra,
//               controller: controller),
//           columns: [
//             DataColumn(
//
//               label: Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Text(
//                     'Função / Aplicação',
//                     textAlign: TextAlign.start,
//                     style: GoogleFonts.sourceSansPro(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w600,
//                       color: Color.fromRGBO(0, 51, 85, 1),
//                       letterSpacing: 0.5,
//                     ),
//                   ),
//                 ),
//               ),
//               onSort: controller.onSort,
//               // onSort: controller.onSort,
//             ),
//             DataColumn(
//               label: Expanded(
//                 child: Text(
//                   'Nome',
//                   textAlign: TextAlign.start,
//                   style: GoogleFonts.sourceSansPro(
//                     fontSize: 17,
//                     fontWeight: FontWeight.w600,
//                     color: Color.fromRGBO(0, 51, 85, 1),
//                     letterSpacing: 0.5,
//                   ),
//                 ),
//               ),
//               onSort: controller.onSort,
//               // onSort: controller.onSort,
//             ),
//             DataColumn(
//               label: Expanded(
//                 child: Text(
//                   'Detalhes',
//                   textAlign: TextAlign.start,
//                   style: GoogleFonts.sourceSansPro(
//                     fontSize: 17,
//                     fontWeight: FontWeight.w600,
//                     color: Color.fromRGBO(0, 51, 85, 1),
//                     letterSpacing: 0.5,
//                   ),
//                 ),
//               ),
//               // onSort: controller.onSort,
//             ),
//             DataColumn(
//               label: Expanded(
//                 child: Text(
//                   'Valor',
//                   textAlign: TextAlign.start,
//                   style: GoogleFonts.sourceSansPro(
//                     fontSize: 17,
//                     fontWeight: FontWeight.w600,
//                     color: Color.fromRGBO(0, 51, 85, 1),
//                     letterSpacing: 0.5,
//                   ),
//                 ),
//               ),
//               // onSort: controller.onSort,
//             ),
//             DataColumn(
//                 label: Expanded(
//                   child: Text(
//                     'Disponível',
//                     textAlign: TextAlign.start,
//                     style: GoogleFonts.sourceSansPro(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w600,
//                       color: Color.fromRGBO(0, 51, 85, 1),
//                       letterSpacing: 0.5,
//                     ),
//                   ),
//                 )),
//           ],
//         ),
//       ),
//       // ),
//     ],
//   );
// }
}

// TODO tabela getx pagina principal
// class Tabela extends DataTableSource {
//   PlataformaPageController controller;
//
//   // List<ItemConfiguracaoIntegradorWaychef> data;
//
//   // Tabela({required this.data, required this.controller});
//   Tabela({required this.controller});
//
//   bool get isRowCountApproximate => false;
//
//   int get rowCount => controller.listaPlataformaContratoIntegradorExtra.length;
//
//   int get selectedRowCount => 0;
//
//   DataRow getRow(int index) {
//     print('pode commercializar abaixo');
//     print(controller.listaPlataformaContratoIntegradorExtra[index].permiteComercializar!);
//     print('nome abaixo');
//     print(
//       controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.nome!,
//     );
//     print('detalhes abaixo');
//     print(
//       controller.listaPlataformaContratoIntegradorExtra[index].detalhes!,
//     );
//     print('fim da consulta');
//     return DataRow(cells: [
//       DataCell(
//         Container(
//           padding: EdgeInsets.only(left: 8),
//           child: Text(
//             controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.tipoItemContratoWaychef!,
//             textAlign: TextAlign.start,
//             style: GoogleFonts.sourceSansPro(
//               fontStyle: FontStyle.normal,
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF171C22),
//             ),
//           ),
//         ),
//       ),
//       DataCell(
//         Container(
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 5),
//             child: TextFormField(
//               keyboardType: TextInputType.multiline,
//               inputFormatters: [LengthLimitingTextInputFormatter(49)],
//               initialValue: controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.nome != null
//                   ? controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.nome
//                   : " ",
//               onChanged: (text) {
//                 controller
//                     .mapDetalhes[controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.id!]!
//                     .itemConfiguracaoWaychefDTO
//                     .nome = text;
//               },
//               textAlign: TextAlign.start,
//               decoration: InputDecoration(
//                 // labelText: controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.detalhes!,
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.black87),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.black87),
//                 ),
//                 labelStyle: TextStyle(
//                   color: Colors.black87,
//                 ),
//               ),
//               style: GoogleFonts.sourceSansPro(
//                 fontStyle: FontStyle.normal,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFF171C22),
//               ),
//             ),
//           ),
//         ),
//       ),
//       DataCell(
//         Padding(
//           padding: const EdgeInsets.only(bottom: 5),
//           child: SizedBox(
//             width: 350,
//             child: TextFormField(
//               initialValue:
//               controller.listaPlataformaContratoIntegradorExtra[index].detalhes != null ? controller.listaPlataformaContratoIntegradorExtra[index].detalhes : " ",
//               maxLines: 5,
//               inputFormatters: [LengthLimitingTextInputFormatter(250)],
//               onChanged: (text) {
//                 controller
//                     .mapDetalhes[controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.id!]!
//                     .detalhes = text;
//               },
//               cursorColor: Colors.black87,
//               decoration: InputDecoration(
//                 // labelText: controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.detalhes!,
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.black87),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.black87),
//                 ),
//                 labelStyle: TextStyle(
//                   color: Colors.black87,
//                 ),
//               ),
//               style: GoogleFonts.sourceSansPro(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ),
//       ),
//       DataCell(
//         Container(
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 5),
//             child: TextFormField(
//               initialValue: controller.listaPlataformaContratoIntegradorExtra[index].valor!.toStringAsFixed(2),
//               onChanged: (valor) {
//                 controller
//                     .mapDetalhes[controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.id!]!
//                     .valor = double.tryParse(valor);
//               },
//               cursorColor: Colors.black87,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                 // labelText: controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.detalhes!,
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.black87),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(width: 1, color: Colors.black87),
//                 ),
//                 labelStyle: TextStyle(
//                   color: Colors.black87,
//                 ),
//               ),
//               style: GoogleFonts.sourceSansPro(
//                 fontStyle: FontStyle.normal,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFF171C22),
//               ),
//             ),
//           ),
//         ),
//       ),
//       DataCell(
//         Transform.scale(
//           scale: 1,
//           child: Obx(() {
//             return Checkbox(
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(
//                   width: 1,
//                   style: BorderStyle.solid,
//                 ),
//                 borderRadius: BorderRadius.circular(6,
//                 ),
//               ),
//               fillColor: MaterialStateProperty.resolveWith(getColor),
//               value: controller.listaPlataformaContratoIntegradorExtra[index].permiteComercializar,
//               onChanged: ((bool? value) {
//                 controller.alternaBoxEmpresateste(index, value!);
//                 controller.listaPlataformaContratoIntegradorExtra[index]
//                     .permiteComercializar = value;
//                 controller.listaPlataformaContratoIntegradorExtra[index].permiteComercializar = value;
//                 // controller.listaPlataformaContratoIntegradorExtra[index].permiteComercializar = value;
//               }),
//               // onChanged: ((value) {
//               //   print('BoloTERCA');
//               //   controller.alterarBoxEmpresateste(index, value!);
//               //   controller.listaPlataformaContratoIntegradorExtra[index].permiteComercializar = value;
//               // }),
//             );
//           }),
//         ),
//       ),
//
//     ]);
//   }
//
//   // cor do botão checkbox
//   Color getColor(Set<MaterialState> states) {
//     const Set<MaterialState> interactiveStates = <MaterialState>{
//       MaterialState.pressed,
//       MaterialState.hovered,
//       MaterialState.focused,
//     };
//     if (states.any(interactiveStates.contains)) {
//       return Color.fromRGBO(90, 95, 102, 1);
//     }
//     return Color.fromRGBO(90, 95, 102, 1);
//   }
// }
