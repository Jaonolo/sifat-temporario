import 'package:erp/pages/plataforma/contratosintegrador/extras/plataforma_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:models/model/models.dart';

// import 'package:erp/pages/organizar/plataforma_page_controller.dart';
import '../../../../app_antigo/config/application.dart';
import '../../../../config/application.dart';
import '../../../../models/item_configurcao_waychef.dart';
import '../../../../theme/app_theme.dart';
import '../../../../widgets/botao_padrao.dart';
import '../../../../widgets/carregamento/icone_carregando.dart';
import '../../../../widgets/chebox_mobile.dart';
import '../../../../widgets/check_box_padrao.dart';
import '../../../../widgets/drop_down_button_padrao.dart';
import '../../../../widgets/responsive.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../../widgets/texto_aba_modal.dart';

class PlataformaPage extends GetView<PlataformaPageController> {
  String? token;

  PlataformaPage(this.token) {
    print(this.token);
    Application.tokenUsuario = token!;
  }

//
// class PlataformaPage extends StatelessWidget {
//   const PlataformaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: Container(
          height: 200,
          width: 200,
          color: Colors.amber,
        ),
        desktop: Column(
          children: [
            Expanded(
              flex: 10,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Expanded(child: Container()),
                    _btnSalvar(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 90,
              child: ListView(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Card(
                    child: _tabelaPlataforma(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Get.snackbar('Sucesso', 'Bandeira adicionada',
  // backgroundColor: AppTheme.confirm,
  // colorText: Colors.white,
  // snackPosition: SnackPosition.BOTTOM,
  // icon: const Icon(Icons.check, color: Colors.white),
  // maxWidth: 300);

//----------- WIDGETS
  Widget _btnSalvar() {
    return BotaoPadrao(
        corIcone: AppTheme.salvar,
        corTexto: Colors.white,
        texto: 'Salvar',
        icone: Icons.save,
        acao: () {
          controller.atualizarItemConfiguracaoIntegrador();

          // onPressed: ()=> _atualizarItemConfiguracaoIntegrador(PlataformaIntegradorPageController.),
          // _atualizarItemConfiguracaoIntegrador();
        });
  }

  Widget _tabelaPlataforma() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(
              () =>
          controller.carregando
              ? const IconeCarregando()
              : PaginatedDataTable(
            rowsPerPage: controller.listaPlataformaContratoIntegradorExtra
                .length,
            horizontalMargin: 0,
            // DataTable(
            source: Tabela(
                data: controller.listaPlataformaContratoIntegradorExtra,
                controller: controller),
            columns: [
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Função / Aplicação',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 51, 85, 1),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                onSort: controller.onSort,
                // onSort: controller.onSort,
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Nome',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 51, 85, 1),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                onSort: controller.onSort,
                // onSort: controller.onSort,
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Detalhes',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 51, 85, 1),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                // onSort: controller.onSort,
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Valor',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 51, 85, 1),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                // onSort: controller.onSort,
              ),
              // DataColumn(
              //     label: Expanded(
              //   child: Text(
              //     'Tipo',
              //     textAlign: TextAlign.start,
              //     style: GoogleFonts.sourceSansPro(
              //       fontSize: 17,
              //       fontWeight: FontWeight.w600,
              //       color: Color.fromRGBO(0, 51, 85, 1),
              //       letterSpacing: 0.5,
              //     ),
              //   ),
              // )),
              DataColumn(
                  label: Expanded(
                    child: Text(
                      'Disponível',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(0, 51, 85, 1),
                        letterSpacing: 0.5,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        // ),
      ],
    );
  }

  AppBar _negocioAppBar(Size size) {
    List<Tab> tabsLista = [];
    controller.mapContratoIndicador.forEach((key, value) {
      tabsLista.add(
        Tab(
          child: size.width > 530
              ? Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              key.descricao,
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
      );
    });
    print('Estou montando _negocioAppBar de adicional extra');
    return AppBar(
      // mainAxisSize: MainAxisSize.min,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      toolbarHeight: 0,
      // toolbarTextStyle: ,
      elevation: 0,
      backgroundColor: AppTheme.corDeFundoAbaModal,
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
        tabs: tabsLista,
      ),
    );
  }


  Widget _modalPlataforma(BuildContext context) {
    Size _size = MediaQuery
        .of(context)
        .size;

    //lista tabBar- appBar
    List<Tab> tabsLista = [];
    controller.mapContratoIndicador.forEach((key, value) {
      tabsLista.add(
        Tab(
          child: _size.width > 530
              ? Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              key.descricao,
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
      );
    });

    List<SingleChildScrollView> tabbarviewLista = [];
    controller.mapContratoIndicador.forEach((key, value) {
      List<Widget> listaNova = [];
      value.forEach((element) {
        print(element);
        listaNova.add(
          Row(
            children: [
              // TablePlataforma(),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: TextoAbaModal(
                      texto: element.nome!,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Obx(
                          () =>
                          CheckBoxPadrao(
                            status: controller.boxEmpresateste,
                            alteraStatus: () {
                              // controller.alternaBoxEmpresateste();
                            },
                          ),
                    ),

                    // CheckBoxMobile(),
                  ),
                ),
              ),
            ],
          ),
        );
      });
      tabbarviewLista.add(
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Responsive(
              larguraMaximaMobile: 905,
              desktop: Padding(
                // padding: const EdgeInsets.all(16.0),
                padding:
                const EdgeInsets.symmetric(vertical: 48, horizontal: 181),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: listaNova,
                ),
              ),
              mobile: Container(),
            ),
          ),
        ),
      );
    });
    print('Estou montando _modalPlataforma de adicional extra');
    return DefaultTabController(
      length: controller.mapContratoIndicador.length,
      child: Scaffold(
        // backgroundColor: AppTheme.background,
        appBar: _negocioAppBar(_size),
        body: TabBarView(
          children: tabbarviewLista,
        ),
        // ],),
      ),
    );
  }

}

// TODOWenderson tabela getx pagina principal
class Tabela extends DataTableSource {
  PlataformaPageController controller;

  List<ItemConfiguracaoIntegradorWaychef> data;

  Tabela({required this.data, required this.controller});

  bool get isRowCountApproximate => false;

  int get rowCount => data.length;

  int get selectedRowCount => 0;

  DataRow getRow(int index) {
    print('pode commercializar abaixo');
    print(data[index].podeComercializar!);
    print('nome abaixo');
    print(
      data[index].itemConfiguracaoWaychefDTO.nome!,
    );
    print('detalhes abaixo');
    print(
      data[index].detalhes!,
    );
    print('fim da consulta');
    return DataRow(cells: [
      DataCell(
        Container(
          child: Text(
            data[index].itemConfiguracaoWaychefDTO.tipoItemContratoWaychef!,
            textAlign: TextAlign.start,
            style: GoogleFonts.sourceSansPro(
              fontStyle: FontStyle.normal,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF171C22),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(49)],
              initialValue: data[index].itemConfiguracaoWaychefDTO.nome != null
                  ? data[index].itemConfiguracaoWaychefDTO.nome
                  : " ",
              onChanged: (text) {
                controller.mapDetalhes[
                data[index].itemConfiguracaoWaychefDTO.id!]!
                    .itemConfiguracaoWaychefDTO.nome = text;
              },
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                // labelText: data[index].itemConfiguracaoWaychefDTO.detalhes!,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black87),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black87),
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
      DataCell(
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: TextFormField(
            initialValue:
            data[index].detalhes != null ? data[index].detalhes : " ",
            maxLines: 5,
            inputFormatters: [LengthLimitingTextInputFormatter(250)],
            onChanged: (text) {
              controller.mapDetalhes[data[index].itemConfiguracaoWaychefDTO
                  .id!]!.detalhes = text;
            },
            cursorColor: Colors.black87,
            decoration: InputDecoration(
              // labelText: data[index].itemConfiguracaoWaychefDTO.detalhes!,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black87),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black87),
              ),
              labelStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
            style: GoogleFonts.sourceSansPro(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: TextFormField(
              initialValue: data[index].valor!.toStringAsFixed(2),
              onChanged: (valor) {
                controller.mapDetalhes[data[index].itemConfiguracaoWaychefDTO
                    .id!]!.valor = double.tryParse(valor);
              },
              cursorColor: Colors.black87,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),

                // labelText: data[index].itemConfiguracaoWaychefDTO.detalhes!,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black87),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black87),
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
      DataCell(

       Transform.scale(
            scale: 1,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(6,),
              ),
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value:  data[index].podeComercializar,
              onChanged:((value) {
                  controller.alternaBoxEmpresateste(data[index].itemConfiguracaoWaychefDTO.id!, value!);
                  data[index].podeComercializar = value;
              }),


            ),
          ),

      ),

    ]);
  }


  ////////////////////////////////// BOTÃO///////////////////////

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color.fromRGBO(90, 95, 102, 1);
    }
    return Color.fromRGBO(90, 95, 102, 1);
  }
}


//   @override
//   Widget build(BuildContext context) {
// //------------ VARIAVEIS------------
//     Size _size = MediaQuery.of(context).size;
// //------------ EstruturaPrincipal
//     return Scaffold(
//       body: Responsive(
//         mobile: Container(
//           height: 200,
//           width: 200,
//           color: Colors.amber,
//         ),
//         desktop: ListView(
//           padding: const EdgeInsets.all(16),
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 _btnAdicionar(context),
//                 Expanded(child: Container()),
//                 _btnSalvar(),
//               ],
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             const Divider(
//               thickness: 2,
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Card(
//               child: _tabelaPlataforma(),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             //todo modal abaixo está pronto novo contrato
//             const SizedBox(
//               height: 16,
//             ),
//             //todo modal abaixo tem que fazer
//             //
//           ],
//         ),
//       ),
//     );
//   }
//
// //----------- WIDGETS
//   Widget _btnSalvar() {
//     return BotaoPadrao(
//       corIcone: AppTheme.salvar,
//       corTexto: Colors.white,
//       texto: 'Salvar',
//       icone: Icons.save,
//       acao: () {
//         //TODO: AÇÃO SALVAR
//       },
//     );
//   }
//
//   Widget _btnAdicionar(context) {
//     return BotaoPadrao(
//       corIcone: AppTheme.adicionar,
//       corTexto: Colors.white,
//       texto: 'Adicionar',
//       icone: Icons.add_circle,
//       acao: () {
//         showModalBottomSheet(
//           isScrollControlled: true,
//           context: context,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(
//                 top: Radius.circular(20),
//               )),
//           builder: (context) => Container(
//             // padding: EdgeInsets.all(16),
//             child: Column(mainAxisSize: MainAxisSize.min, children: [
//               Container(
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 34, top: 28),
//                       child: Text(
//
//                         'Adicione Extras',
//                         style: GoogleFonts.comfortaa(
//                           fontSize: 23,
//                           fontWeight: FontWeight.w500,
//                           color: AppTheme.modaltitulo,
//                           letterSpacing: -0.5,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 8, left: 34, bottom: 8),
//                       child: Text(
//                           'Selecione as funcionalidades que deseja inserir como extra no contrato',
//                           style: GoogleFonts.sourceSansPro(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400,
//                             color: AppTheme.blackSubtitulo,
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 500,
//                 child: _modalPlataforma(context),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
//                 child: Row(
//                   // runSpacing: 16,
//                   // alignment: WrapAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           side: BorderSide(
//                             color: Color.fromRGBO(186, 26, 26, 1),
//                           ),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 4),
//                         child: Text(
//                           textAlign: TextAlign.end,
//                           'Cancelar',
//                           style: GoogleFonts.sourceSansPro(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Color.fromRGBO(186, 26, 26, 1),
//                             letterSpacing: 0.25,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color.fromRGBO(22, 156, 52, 1),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 4),
//                         child: Text(
//                           textAlign: TextAlign.end,
//                           'Confirmar',
//                           style: GoogleFonts.sourceSansPro(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: AppTheme.buttomModalConfirmar,
//                             letterSpacing: 0.25,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ]),
//           ),
//         );
//
//
//
//       },
//     );
//   }
//
//   Widget _tabelaPlataforma() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Obx(
//               () => controller.carregando
//               ? const IconeCarregando()
//               :  PaginatedDataTable(
//             // DataTable(
//             source: Tabela(data: controller.listaPlataformaContratoExtra),
//             columns: [
//               DataColumn(
//                 label: Expanded(
//                   child: Text(
//                     'Função / aplicação',
//                     textAlign: TextAlign.start,
//                     style: GoogleFonts.sourceSansPro(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w600,
//                       color: Color.fromRGBO(0, 51, 85, 1),
//                       letterSpacing: 0.5,
//                     ),
//                   ),
//                 ),
//                 // onSort: controller.onSort,
//               ),
//               // DataColumn(
//               //   label: Expanded(
//               //     child: Text(
//               //       'Nome',
//               //       textAlign: TextAlign.start,
//               //       style: GoogleFonts.sourceSansPro(
//               //         fontSize: 17,
//               //         fontWeight: FontWeight.w600,
//               //         color: Color.fromRGBO(0, 51, 85, 1),
//               //         letterSpacing: 0.5,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               // DataColumn(
//               //   label: Expanded(
//               //     child: Text(
//               //       'Detalhes',
//               //       textAlign: TextAlign.start,
//               //       style: GoogleFonts.sourceSansPro(
//               //         fontSize: 17,
//               //         fontWeight: FontWeight.w600,
//               //         color: Color.fromRGBO(0, 51, 85, 1),
//               //         letterSpacing: 0.5,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               // DataColumn(
//               //   label: Expanded(
//               //     child: Text(
//               //       'Valor',
//               //       textAlign: TextAlign.start,
//               //       style: GoogleFonts.sourceSansPro(
//               //         fontSize: 17,
//               //         fontWeight: FontWeight.w600,
//               //         color: Color.fromRGBO(0, 51, 85, 1),
//               //         letterSpacing: 0.5,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               DataColumn(
//                   label: Expanded(
//                     child: Text(
//                       'Tipo',
//                       textAlign: TextAlign.start,
//                       style: GoogleFonts.sourceSansPro(
//                         fontSize: 17,
//                         fontWeight: FontWeight.w600,
//                         color: Color.fromRGBO(0, 51, 85, 1),
//                         letterSpacing: 0.5,
//                       ),
//                     ),
//                   )),
//               // DataColumn(
//               //     label: Expanded(
//               //   child: Text(
//               //     'Disponível',
//               //     textAlign: TextAlign.start,
//               //     style: GoogleFonts.sourceSansPro(
//               //       fontSize: 17,
//               //       fontWeight: FontWeight.w600,
//               //       color: Color.fromRGBO(0, 51, 85, 1),
//               //       letterSpacing: 0.5,
//               //     ),
//               //   ),
//               // )),
//             ],
//             // rows: [
//             //   DataRow(cells: [
//             //     DataCell(
//             //       Container(
//             //         child: Text(
//             //           "Aplicativo - AUTOATENDIMENTO (TOTEM)",
//             //           textAlign: TextAlign.start,
//             //           style: GoogleFonts.sourceSansPro(
//             //             fontStyle: FontStyle.normal,
//             //             fontSize: 16,
//             //             fontWeight: FontWeight.w400,
//             //             color: Color(0xFF171C22),
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //     DataCell(
//             //       Container(
//             //         child: Text(
//             //           "AUTOATENDIMENTO",
//             //           textAlign: TextAlign.start,
//             //           style: GoogleFonts.sourceSansPro(
//             //             fontStyle: FontStyle.normal,
//             //             fontSize: 16,
//             //             fontWeight: FontWeight.w400,
//             //             color: Color(0xFF171C22),
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //     DataCell(
//             //       Padding(
//             //         // padding: const EdgeInsets.all(8.0),
//             //         padding: const EdgeInsets.only(bottom: 5),
//             //         child: TextFormField(
//             //           cursorColor: Colors.black87,
//             //           decoration: const InputDecoration(
//             //             enabledBorder: UnderlineInputBorder(
//             //               borderSide: BorderSide(width: 1, color: Colors.black87),
//             //             ),
//             //             focusedBorder: UnderlineInputBorder(
//             //               borderSide: BorderSide(width: 1, color: Colors.black87),
//             //             ),
//             //             labelStyle: TextStyle(
//             //               color: Colors.black87,
//             //             ),
//             //           ),
//             //           style: GoogleFonts.sourceSansPro(
//             //             fontSize: 16,
//             //             fontWeight: FontWeight.w400,
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //     DataCell(
//             //       Padding(
//             //         // padding: const EdgeInsets.all(8.0),
//             //         padding: const EdgeInsets.only(bottom: 5),
//             //         child: SizedBox(
//             //           width: 70,
//             //           child: TextFormField(
//             //             textAlign: TextAlign.start,
//             //             cursorColor: Colors.black87,
//             //             decoration: const InputDecoration(
//             //               hintText: 'R\$ 0.00',
//             //               enabledBorder: UnderlineInputBorder(
//             //                 borderSide:
//             //                     BorderSide(width: 1, color: Colors.black87),
//             //               ),
//             //               focusedBorder: UnderlineInputBorder(
//             //                 borderSide:
//             //                     BorderSide(width: 1, color: Colors.black87),
//             //               ),
//             //               labelStyle: TextStyle(
//             //                 color: Colors.black87,
//             //               ),
//             //             ),
//             //             style: GoogleFonts.sourceSansPro(
//             //               fontSize: 16,
//             //               fontWeight: FontWeight.w400,
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //     DataCell(
//             //       Container(
//             //         child: ElevatedButton(
//             //           onPressed: () {},
//             //           style: ElevatedButton.styleFrom(
//             //               backgroundColor: const Color(0xFFE5FFE5),
//             //               minimumSize: Size.zero, // Set this
//             //               padding: EdgeInsets.zero,
//             //               shape: RoundedRectangleBorder(
//             //                   borderRadius: BorderRadius.circular(16)) // and this
//             //               ),
//             //           child: Padding(
//             //             padding: const EdgeInsets.all(8.0),
//             //             child: Text(
//             //               'Normal',
//             //               textAlign: TextAlign.start,
//             //               style: GoogleFonts.sourceSansPro(
//             //                 fontSize: 12,
//             //                 color: Color(0xFF169C34),
//             //                 fontWeight: FontWeight.w400,
//             //                 fontStyle: FontStyle.normal,
//             //               ),
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//
//             //   ]),
//             // ],
//           ),
//         ),
//         // ),
//       ],
//     );
//   }
//
//   //Todo modal integradores desktop pronto
//   Widget _modalIntegradores() {
//     return AlertDialog(
//       shape: const RoundedRectangleBorder(
//         side: BorderSide(),
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//       ),
//       title: Container(
//         margin: EdgeInsets.zero,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Integrador',
//                 textAlign: TextAlign.start,
//                 style: GoogleFonts.comfortaa(
//                   fontSize: 23,
//                   fontWeight: FontWeight.w500,
//                   color: AppTheme.modaltitulo,
//                   letterSpacing: -0.5,
//                 ),
//               ),
//             ),
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 8, bottom: 0),
//                 child: Text(
//                     'Selecione os integradores que poderão ser liberados para comercializar',
//                     textAlign: TextAlign.start,
//                     style: GoogleFonts.sourceSansPro(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w400,
//                       color: AppTheme.blackSubtitulo,
//                       letterSpacing: 0.5,
//                     )),
//               ),
//             ),
//           ],
//         ),
//       ),
//       content: ConstrainedBox(
//         constraints:
//         BoxConstraints(maxWidth: Get.width / 2, maxHeight: Get.height / 2),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Divider(indent: 1, height: 2),
//             const SizedBox(
//               height: 8,
//             ),
//             Container(
//               child: Column(
//                 // alignment: WrapAlignment.start,
//                 // runSpacing: 16,
//                 // spacing: 42,
//                 children: [
//                   Container(
//                     width: Get.width / 3,
//                     height: Get.height / 4,
//
//                     // color: Colors.red,
//                     child: GridView.count(
//                       // padding: EdgeInsets.all(60),
//                       primary: false,
//                       // padding: const EdgeInsets.all(20),
//                       crossAxisSpacing: 2,
//                       mainAxisSpacing: 2,
//                       crossAxisCount: 4,
//                       children: <Widget>[
//                         Container(
//                           height: 80,
//                           // color: Colors.red,
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               CheckBoxMobile(),
//                               AutoSizeText(
//                                 'Selecionar',
//                                 minFontSize: 12,
//                                 style: GoogleFonts.sourceSansPro(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppTheme.modaltextocheckbox,
//                                   letterSpacing: 0.25,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               CheckBoxMobile(),
//                               AutoSizeText(
//                                 'Integrador',
//                                 style: GoogleFonts.sourceSansPro(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppTheme.modaltextocheckbox,
//                                   letterSpacing: 0.25,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               CheckBoxMobile(),
//                               AutoSizeText(
//                                 'Integrador',
//                                 style: GoogleFonts.sourceSansPro(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppTheme.modaltextocheckbox,
//                                   letterSpacing: 0.25,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               CheckBoxMobile(),
//                               AutoSizeText(
//                                 'Integrador',
//                                 style: GoogleFonts.sourceSansPro(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppTheme.modaltextocheckbox,
//                                   letterSpacing: 0.25,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               CheckBoxMobile(),
//                               AutoSizeText(
//                                 'Integrador',
//                                 style: GoogleFonts.sourceSansPro(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppTheme.modaltextocheckbox,
//                                   letterSpacing: 0.25,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               CheckBoxMobile(),
//                               AutoSizeText(
//                                 'Integrador',
//                                 style: GoogleFonts.sourceSansPro(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppTheme.modaltextocheckbox,
//                                   letterSpacing: 0.25,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               CheckBoxMobile(),
//                               AutoSizeText(
//                                 'Integrador',
//                                 style: GoogleFonts.sourceSansPro(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppTheme.modaltextocheckbox,
//                                   letterSpacing: 0.25,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               CheckBoxMobile(),
//                               AutoSizeText(
//                                 'Integrador',
//                                 style: GoogleFonts.sourceSansPro(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppTheme.modaltextocheckbox,
//                                   letterSpacing: 0.25,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // CustomScrollView(
//                   //   slivers: [
//                   //     SliverGrid(
//                   //         delegate: SliverChildBuilderDelegate (
//                   //           childCount: 10,
//                   //             (context, index) {
//                   //             return Text('GRID');
//                   //             }
//                   //         ),
//                   //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   //             crossAxisCount: 4,
//                   //           childAspectRatio: 1.1,
//                   //         ),
//                   //     ),
//                   //   ],
//                   // ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Row(
//               // runSpacing: 16,
//               // alignment: WrapAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       side: BorderSide(
//                         color: Color.fromRGBO(186, 26, 26, 1),
//                       ),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//                     child: Text(
//                       textAlign: TextAlign.end,
//                       'Cancelar',
//                       style: GoogleFonts.sourceSansPro(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Color.fromRGBO(186, 26, 26, 1),
//                         letterSpacing: 0.25,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 4,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromRGBO(22, 156, 52, 1),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//                     child: Text(
//                       textAlign: TextAlign.end,
//                       'Confirmar',
//                       style: GoogleFonts.sourceSansPro(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: AppTheme.buttomModalConfirmar,
//                         letterSpacing: 0.25,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // const SizedBox(
//             //   height: 15,
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // TODOWenderson tabela getx pagina principal
// class Tabela extends DataTableSource {
//   List<ItemConfiguracaoWaychef> data;
//
//   Tabela({required this.data});
//
//   bool get isRowCountApproximate => false;
//
//   int get rowCount => data.length;
//
//   int get selectedRowCount => 0;
//
//   DataRow getRow(int index) {
//     return DataRow(cells: [
//       DataCell(
//         Container(
//           child: Text(
//             data[index].id!,
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
//       // DataCell(
//       //   SizedBox(
//       //     // width: 500,
//       //     child: Text(
//       //       data[index].nomeFantasia!,
//       //       overflow: TextOverflow.clip,
//       //     ),
//       //   ),
//       // ),
//       DataCell(
//         Container(
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFFE5FFE5),
//                 minimumSize: Size.zero, // Set this
//                 padding: EdgeInsets.zero,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16)) // and this
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 data[index].tipoItem!,
//                 textAlign: TextAlign.start,
//                 style: GoogleFonts.sourceSansPro(
//                   fontSize: 12,
//                   color: Color(0xFF169C34),
//                   fontWeight: FontWeight.w400,
//                   fontStyle: FontStyle.normal,
//                 ),
//               ),
//
//             ),
//           ),
//         ),
//       ),
//       DataCell(
//         Container(
//           child: TextButton(
//             onPressed: () {
//               //todoWenderson analisar como chamar o modal
//               // Get.dialog(_modalIntegradores());
//             },
//             child: Text(
//               'Integrador',
//               textAlign: TextAlign.center,
//               style: GoogleFonts.sourceCodePro(
//                 color: Color(0xFFFF5722),
//                 fontSize: 14,
//                 fontStyle: FontStyle.normal,
//                 fontWeight: FontWeight.w500,
//                 decoration: TextDecoration.underline,
//                 decorationStyle: TextDecorationStyle.solid,
//                 letterSpacing: 0.5,
//               ),
//             ),
//           ),
//         ),
//       ),
//       // DataCell(Text(
//       //   data[index].cnpj,
//       //   overflow: TextOverflow.clip,
//       // )),
//       // DataCell(Text(
//       //   data[index].validadeAcordo!.toString(),
//       //   overflow: TextOverflow.clip,
//       // )),
//       // DataCell(
//       //   IconButton(
//       //     tooltip: "Editar",
//       //     icon: Icon(
//       //       FontAwesomeIcons.solidEdit,
//       //       color: AppTheme.primary,
//       //       size: 16,
//       //     ),
//       //     onPressed: () {
//       //       Get.toNamed(Routes.ADM_EDITAR_EMPRESA, arguments: index);
//       //     },
//       //   ),
//       // ),
//     ]);
//   }
//
//   Widget _icone(bool status) {
//     return Icon(
//       status ? Icons.check : Icons.close,
//       color: status ? AppTheme.confirm : AppTheme.cancel,
//     );
//   }
// }
//
// //TODO SEPARAR O MODAL ABAIXO DEPOIS
//
// Widget _modalPlataforma(BuildContext context) {
//   Size _size = MediaQuery.of(context).size;
//   return DefaultTabController(
//     length: 6,
//     child: Scaffold(
//       // backgroundColor: AppTheme.background,
//       appBar: _negocioAppBar(_size),
//       body: TabBarView(
//         children: [
//           _abaFinanceiro(),
//           _abaFiscal(),
//           _abaEstoque(),
//           _abaProduto(),
//           _abaModulosDeVenda(),
//           _abaServicosAplicacoes(),
//           // _dadosPrincipais(context),
//           // _horarioDeFuncionamento(context, _size),
//
//           // SingleChildScrollView(child: _qrCodeIntegracao()),
//         ],
//       ),
//       // ],),
//     ),
//   );
// }
//
// AppBar _negocioAppBar(Size size) {
//   return AppBar(
//     // mainAxisSize: MainAxisSize.min,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(16),
//     ),
//     toolbarHeight: 0,
//     // toolbarTextStyle: ,
//     elevation: 0,
//     backgroundColor: AppTheme.corDeFundoAbaModal,
//     bottom: TabBar(
//         labelColor: AppTheme.corBranco,
//         labelStyle: const TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//         unselectedLabelColor: AppTheme.adicionar,
//         indicatorSize: TabBarIndicatorSize.label,
//         indicator: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: Color(0xFFFF5722),
//           // bottom: BorderSide(color: Color.fromRGBO(176, 179, 251, 1), width: 5)
//         ),
//         // borderRadius: const BorderRadius.only(),
//         //   //     topLeft: Radius.circular(10),
//         //   //     topRight: Radius.circular(10),
//         //   ),
//         //   color: AppTheme.modaltitulo,
//         tabs: [
//           Tab(
//             child: size.width > 530
//                 ? Padding(
//               padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
//               child: Text(
//                 "Financeiro",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.comfortaa(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 0.15,
//                 ),
//               ),
//             )
//                 : const Icon(Icons.fact_check_outlined),
//           ),
//           Tab(
//             child: size.width > 530
//                 ? Padding(
//               padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
//               child: Text(
//                 "Fiscal",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.comfortaa(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 0.15,
//                 ),
//               ),
//             )
//                 : const Icon(Icons.more_time),
//           ),
//           Tab(
//             child: size.width > 530
//                 ? Padding(
//               padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
//               child: Text(
//                 "Estoque",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.comfortaa(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 0.15,
//                 ),
//               ),
//             )
//                 : const Icon(Icons.attach_money),
//           ),
//           Tab(
//             child: size.width > 530
//                 ? Padding(
//               padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
//               child: Text(
//                 "Produto",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.comfortaa(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 0.15,
//                 ),
//               ),
//             )
//                 : const Icon(Icons.attach_money),
//           ),
//           Tab(
//             child: size.width > 530
//                 ? Padding(
//               padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
//               child: AutoSizeText(
//                 "Módulo de Vendas",
//                 minFontSize: 18,
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.comfortaa(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 0.15,
//                 ),
//               ),
//             )
//                 : const Icon(Icons.attach_money),
//           ),
//           Tab(
//             child: size.width > 530
//                 ? Padding(
//               padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
//               child: AutoSizeText(
//                 "Serviços/Aplicações",
//                 minFontSize: 18,
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.comfortaa(
//                   fontSize: 26,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 0.15,
//                 ),
//               ),
//             )
//                 : const Icon(Icons.attach_money),
//           ),
//         ]),
//   );
// }
//
// Widget _abaFinanceiro() {
//   return SingleChildScrollView(
//     child: Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Responsive(
//         larguraMaximaMobile: 905,
//         desktop: _abaFinanceiroDesk(),
//         mobile: Container(),
//       ),
//     ),
//   );
// }
//
// Widget _abaFiscal() {
//   return SingleChildScrollView(
//     child: Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Responsive(
//         larguraMaximaMobile: 905,
//         desktop: _abaFiscalDesk(),
//         mobile: Container(),
//       ),
//     ),
//   );
// }
//
// Widget _abaEstoque() {
//   return SingleChildScrollView(
//     child: Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Responsive(
//         larguraMaximaMobile: 905,
//         desktop: _abaEstoqueDesk(),
//         mobile: Container(),
//       ),
//     ),
//   );
// }
//
// Widget _abaProduto() {
//   return SingleChildScrollView(
//     child: Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Responsive(
//         larguraMaximaMobile: 905,
//         desktop: _abaProdutoDesk(),
//         mobile: Container(),
//       ),
//     ),
//   );
// }
//
// Widget _abaModulosDeVenda() {
//   return SingleChildScrollView(
//     child: Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Responsive(
//         larguraMaximaMobile: 905,
//         desktop: _abaModulosDeVendaDesk(),
//         mobile: Container(),
//       ),
//     ),
//   );
// }
//
// Widget _abaServicosAplicacoes() {
//   return SingleChildScrollView(
//     child: Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Responsive(
//         larguraMaximaMobile: 905,
//         desktop: _abaServicosAplicacoesDesk(),
//         mobile: Container(),
//       ),
//     ),
//   );
// }
//
// Widget _abaFinanceiroDesk() {
//   return Padding(
//     // padding: const EdgeInsets.all(16.0),
//     padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 181),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: const Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Módulo Financeiro',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(
//
//                   ),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Controle de boleto bancário',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: const Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Controle de cartões',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Controle de DRE/DFC',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Controle de vendas a prazo',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _abaFiscalDesk() {
//   return Padding(
//     // padding: const EdgeInsets.all(16.0),
//     padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 181),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: TextoAbaModal(
//                   texto: 'Emissão de NF-e (saída)',
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Container(
//           color: Color(0xFFFCFCFF),
//           padding: EdgeInsets.only(top: 30, bottom: 30),
//           child: Row(
//             children: [
//               // TablePlataforma(),
//               Expanded(
//                 child: Container(
//                   child: TextoAbaModal(
//                     texto: 'Emissão de NFS-e (serviço)',
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: CheckBoxMobile(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: TextoAbaModal(
//                   texto: 'Lançamento NF-e (entrada)',
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _abaEstoqueDesk() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 181),
//     // padding: const EdgeInsets.all(16.0),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(texto: 'Módulo Estoque'),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(texto: 'Controle multiplos locais'),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _abaProdutoDesk() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 181),
//     // padding: const EdgeInsets.all(16.0),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Controle de observações',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Controle de gerador de etiqueta',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Controle de promoção',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Controle de pacotes',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Controle de tabela de preços',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Controle de variações',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _abaModulosDeVendaDesk() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 181),
//     // padding: const EdgeInsets.all(16.0),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Autoatendimento',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Balcão',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(texto: 'Mesa'),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Ficha',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Delivery',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Drive Thru',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'PUB',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _abaServicosAplicacoesDesk() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 181),
//     // padding: const EdgeInsets.all(16.0),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Serviço Impressão',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Waychef Desktop',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//         Row(
//           children: [
//             // TablePlataforma(),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: TextoAbaModal(
//                     texto: 'Waychef Mobile',
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CheckBoxMobile(),
//                 ),
//               ),
//             ),
//
//             const SizedBox(width: 12),
//           ],
//         ),
//       ],
//     ),
//   );
// }
