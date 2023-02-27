import 'package:auto_size_text/auto_size_text.dart';
import 'package:erp/widgets/utils/botoes/btn_cancelar.dart';
import 'package:erp/widgets/utils/botoes/btn_confirmar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:models/model/models.dart';
import '../../../../app_antigo/config/application.dart';
import '../../../../theme/app_theme.dart';
import '../../../../widgets/utils/botoes/botao_padrao.dart';
import '../../../../widgets/carregamento/icone_carregando.dart';
import '../../../../widgets/chebox_mobile.dart';
import '../../../../widgets/check_box_padrao.dart';
import '../../../../widgets/personalizados/texto_extras_filtro.dart';
import '../../../../widgets/responsive.dart';
import '../../../../widgets/texto_aba_modal.dart';
import '../../../../widgets/utils/icons_erp/icons_erpersonalizados.dart';
import 'extra_integrador_controller.dart';

class ExtraIntegradorPage extends GetView<ExtraIntegradorPageController> {
  String? token;
  ExtraIntegradorPage(this.token) {
    Application.tokenUsuario = token!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 255, 1),
      body: Responsive(
        mobile: Container(
          child: ListView(
            children: [
              // _tabelaPlataformaVersaoListMobile(context),
            ],
          ),
        ),
        desktop: ListView(
          padding: const EdgeInsets.all(4),
          children: [
            //TODO opcao cancelar e confirmar
            _rowAdicionarSalvar(context),
            Column(
              children: [
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  child: _tabelaPlataformaVersaoList(context),
                ),
                Container(
                  child: _tabelaPlataformaVersaoListFilhos(),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  //Desktop
  _espacoExpandedContainer() {
    return Expanded(
      child: Container(),
    );
  }

  _rowAdicionarSalvar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _btnAdicionar(context),
        _espacoExpandedContainer(),
        _btnSalvar(),
      ],
    );
  }

  //Desktop e Mobile
  _btnSalvar() {
    return BtnPadrao(
      corIcone: AppTheme.sucesso,
      corTexto: Color.fromRGBO(255, 255, 255, 1),
      texto: 'Salvar',
      icone: Icons.save,
      acao: () {
        controller.atualizarItemConfiguracaoIntegrador();
      },
    );
  }

// //----------- WIDGETS MOBILE
//   Widget _tabelaPlataformaVersaoListMobile(context) {
//     return Card(
//       margin: EdgeInsets.zero,
//       color: Color.fromRGBO(233, 241, 255, 1),
//       child: Container(
//         // width: MediaQuery.of(context).size.width * 1,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               flex: 3,
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(12.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           'Função / aplicação',
//                           textAlign: TextAlign.start,
//                           style: GoogleFonts.comfortaa(
//                             fontSize: 19,
//                             fontWeight: FontWeight.w500,
//                             color: Color.fromRGBO(0, 51, 85, 1),
//                             letterSpacing: 0.15,
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           IconsErpersonalizados.arrow_up_arrow_down,
//                           size: 16,
//                           color: Color.fromRGBO(0, 51, 85, 1),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//----------- WIDGETS DESKTOP
  Widget _tabelaPlataformaVersaoList(context) {
    return Card(
      // margin: EdgeInsets.zero,
      color: Color.fromRGBO(233, 241, 255, 1),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: TextoExtrasFiltro(
                    texto: 'Função / aplicação',
                    naoQuebraTexto: true,
                    inteiroExpanded: 3,
                    icone: controller.sortIndex.value == 0
                        ? controller.ascending.value
                            ? Icons.arrow_downward
                            : Icons.arrow_upward
                        : IconsErpersonalizados.arrow_up_arrow_down,
                    onPressed: () {
                      controller.onSort(0);
                    }),
              ),
              Expanded(
                flex: 2,
                child: TextoExtrasFiltro(
                    texto: 'Nome',
                    inteiroExpanded: 1,
                    icone: controller.sortIndex.value == 1
                        ? controller.ascending.value
                            ? Icons.arrow_downward
                            : Icons.arrow_upward
                        : IconsErpersonalizados.arrow_up_arrow_down,
                    onPressed: () {
                      controller.onSort(1);
                    }),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(right: 40.0),
                  child: TextoExtrasFiltro(
                      texto: 'Detalhes',
                      inteiroExpanded: 1,
                      icone: controller.sortIndex.value == 2
                          ? controller.ascending.value
                              ? Icons.arrow_downward
                              : Icons.arrow_upward
                          : IconsErpersonalizados.arrow_up_arrow_down,
                      onPressed: () {
                        controller.onSort(2);
                      }),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextoExtrasFiltro(
                    inteiroExpanded: 1,
                    texto: 'Valor',
                    icone: controller.sortIndex.value == 3
                        ? controller.ascending.value
                            ? Icons.arrow_downward
                            : Icons.arrow_upward
                        : IconsErpersonalizados.arrow_up_arrow_down,
                    onPressed: () {
                      controller.onSort(3);
                    }),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextoExtrasFiltro(
                      inteiroExpanded: 2,
                      texto: 'Disponível',
                      icone: controller.sortIndex.value == 4
                          ? controller.ascending.value
                              ? Icons.arrow_downward
                              : Icons.arrow_upward
                          : IconsErpersonalizados.arrow_up_arrow_down,
                      onPressed: () {
                        controller.onSort(4);
                      }),
                ),
              ),
            ],
          ),
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
                  itemCount:
                      controller.listaPlataformaContratoIntegradorExtra.length,
                  itemBuilder: (context, index) {
                    ItemConfiguracaoIntegradorWaychef
                        itemConfiguracaoIntegradorWaychef = controller
                            .listaPlataformaContratoIntegradorExtra[index];
                    return Card(
                      // color: index%2 == 0? Colors.transparent : Colors.black.withOpacity(0.02),
                      color: index % 2 == 0
                          ? Color.fromRGBO(248, 248, 255, 1)
                          : Colors.white,
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      // color: Color.fromRGBO(233, 241, 255, 1),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            expandedFuncaoAplicacao(
                              context,
                              index,
                              itemConfiguracaoIntegradorWaychef,
                            ),
                            expandedNome(
                              context,
                              index,
                              itemConfiguracaoIntegradorWaychef,
                            ),
                            expandedDetalhes(
                              context,
                              index,
                              itemConfiguracaoIntegradorWaychef,
                            ),
                            expandedValor(
                              context,
                              index,
                              itemConfiguracaoIntegradorWaychef,
                            ),
                            expandedDisponivel(context, index,
                                itemConfiguracaoIntegradorWaychef),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    );
  }

  expandedFuncaoAplicacao(context, index, itemConfiguracaoIntegradorWaychef) {
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 2,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            itemConfiguracaoIntegradorWaychef
                .itemConfiguracaoWaychefDTO.tipoItemContratoWaychef,
            textAlign: TextAlign.start,
            style: GoogleFonts.sourceSansPro(
              fontSize: width / 90,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0, 51, 85, 1),
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  expandedNome(context, index, itemConfiguracaoIntegradorWaychef) {
    var width = MediaQuery.of(context).size.width;
    var textController = TextEditingController(
        text: itemConfiguracaoIntegradorWaychef
                    .itemConfiguracaoWaychefDTO.nome !=
                null
            ? itemConfiguracaoIntegradorWaychef.itemConfiguracaoWaychefDTO.nome
            : " ");
    return Expanded(
      flex: 2,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            inputFormatters: [LengthLimitingTextInputFormatter(49)],
            controller: textController,
            // initialValue: itemConfiguracaoIntegradorWaychef
            //             .itemConfiguracaoWaychefDTO.nome !=
            //         null
            //     ? itemConfiguracaoIntegradorWaychef
            //         .itemConfiguracaoWaychefDTO.nome
            //     : " ",
            onChanged: (text) {
              controller
                  .mapDetalhes[itemConfiguracaoIntegradorWaychef
                      .itemConfiguracaoWaychefDTO.id!]!
                  .itemConfiguracaoWaychefDTO
                  .nome = text;
            },
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              // labelText: controller.listaPlataformaContratoIntegradorExtra[index].itemConfiguracaoWaychefDTO.detalhes!,
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
              fontSize: width / 95,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0, 51, 85, 1),
              // color: Color(0xFF171C22),
            ),
          ),
        ),
      ),
    );
  }

  expandedDetalhes(context, index, itemConfiguracaoIntegradorWaychef) {
    var width = MediaQuery.of(context).size.width;
    var textController = TextEditingController(
        text: controller
                    .listaPlataformaContratoIntegradorExtra[index].detalhes !=
                null
            ? controller.listaPlataformaContratoIntegradorExtra[index].detalhes
            : " ");
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 0.0, bottom: 8.0),
        child: TextFormField(
          controller: textController,
          maxLines: 2,
          // maxLines: null,
          inputFormatters: [LengthLimitingTextInputFormatter(250)],
          onChanged: (text) {
            controller
                .mapDetalhes[controller
                    .listaPlataformaContratoIntegradorExtra[index]
                    .itemConfiguracaoWaychefDTO
                    .id!]!
                .detalhes = text;
          },
          cursorColor: Colors.black87,
          decoration: InputDecoration(
            isDense: true,
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
            fontSize: width / 95,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 51, 85, 1),
          ),
        ),
      ),
    );
  }

  expandedValor(context, index, itemConfiguracaoIntegradorWaychef) {
    var textController = TextEditingController(
        text: controller.listaPlataformaContratoIntegradorExtra[index].valor!
            .toStringAsFixed(2));
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 2,
      child: Container(
        child: Padding(
          padding:
              EdgeInsets.only(left: 8.0, top: 8.0, right: 0.0, bottom: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  controller: textController,
                  // initialValue: controller.listaPlataformaContratoIntegradorExtra[index].valor!.toStringAsFixed(2),
                  onChanged: (valor) {
                    controller
                        .mapDetalhes[controller
                            .listaPlataformaContratoIntegradorExtra[index]
                            .itemConfiguracaoWaychefDTO
                            .id!]!
                        .valor = double.tryParse(valor);
                  },
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 8.0, bottom: 8.0, right: 8.0),
                      child: Text(
                        'R\$',
                        style: GoogleFonts.sourceSansPro(
                          fontStyle: FontStyle.normal,
                          fontSize: width / 90,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 51, 85, 1),
                        ),
                      ),
                    ),
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
                    fontSize: width / 90,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 51, 85, 1),
                    // color: Color(0xFF171C22),
                  ),
                ),
              ),
              Container(
                width: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  expandedDisponivel(context, index, itemConfiguracaoIntegradorWaychef) {
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(
                    left: 0.0, top: 8.0, right: 8.0, bottom: 8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: AppTheme.adicionar),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Get.dialog(_modalIntegradores(context));
                  },
                  child: Text(
                    'Integradores',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.sourceSansPro(
                      fontStyle: FontStyle.normal,
                      fontSize: width / 90,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.adicionar,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Container(
          //   padding: EdgeInsets.all(16),
          //   child: Transform.scale(
          //     scale: width / 1327,
          //     child: Checkbox(
          //       shape: RoundedRectangleBorder(
          //         side: BorderSide(
          //           width: 1,
          //           style: BorderStyle.solid,
          //         ),
          //         borderRadius: BorderRadius.circular(6),
          //       ),
          //       fillColor: MaterialStateProperty.resolveWith(getColor),
          //       value: itemConfiguracaoIntegradorWaychef.permiteComercializar,
          //       onChanged: ((bool? value) {
          //         controller.alternaBoxEmpresateste(index, value!);
          //         controller.carregando = true;
          //         controller.listaPlataformaContratoIntegradorExtra
          //             .forEach((element) {
          //           if (element.idItemConfiguracaoWaychef ==
          //               itemConfiguracaoIntegradorWaychef
          //                   .idItemConfiguracaoWaychef) {
          //             element.permiteComercializar = value;
          //           }
          //           controller.carregando = false;
          //         });
          //       }),
          //     ),
          //   ),
          // ),
        ],
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

//  cor do botão checkbox
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

  _modalIntegradores(context) {
    showDialog(
        context: context,
        barrierDismissible: false, // impede o fechamento ao clicar fora do alert
        builder: (BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: Container(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Integrador',
                textAlign: TextAlign.start,
                style: GoogleFonts.comfortaa(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.modaltitulo,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 0),
                child: Text(
                    'Selecione os integradores que poderão ser liberados para comercializar',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.blackSubtitulo,
                      letterSpacing: 0.5,
                    )),
              ),
            ),
          ],
        ),
      ),
      content: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: Get.width / 2, maxHeight: Get.height / 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(indent: 1, height: 2),
            const SizedBox(
              height: 8,
            ),
            Container(
              child: Column(
                // alignment: WrapAlignment.start,
                // runSpacing: 16,
                // spacing: 42,
                children: [
                  Container(
                    width: Get.width / 3,
                    height: Get.height / 4,
                    // color: Colors.red,
                    child: GridView.count(
                      childAspectRatio: 2.0,
                      // padding: EdgeInsets.all(60),
                      primary: false,
                      // padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      crossAxisCount: 4,
                      children: <Widget>[
                        Container(
                          height: 80,
                          // color: Colors.red,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Container(
                              //   padding: EdgeInsets.all(16),
                              //   child: Transform.scale(
                              //     scale: 1,
                              //     child: Checkbox(
                              //       shape: RoundedRectangleBorder(
                              //         side: BorderSide(
                              //           width: 1,
                              //           style: BorderStyle.solid,
                              //         ),
                              //         borderRadius: BorderRadius.circular(6),
                              //       ),
                              //       fillColor: MaterialStateProperty.resolveWith(getColor),
                              //       value: itemConfiguracaoIntegradorWaychef.permiteComercializar,
                              //       onChanged: ((bool? value) {
                              //         controller.alternaBoxEmpresateste(index, value!);
                              //         controller.carregando = true;
                              //         controller.listaPlataformaContratoIntegradorExtra
                              //             .forEach((element) {
                              //           if (element.idItemConfiguracaoWaychef ==
                              //               itemConfiguracaoIntegradorWaychef
                              //                   .idItemConfiguracaoWaychef) {
                              //             element.permiteComercializar = value;
                              //           }
                              //           controller.carregando = false;
                              //         });
                              //       }),
                              //     ),
                              //   ),
                              // ),
                              Text(
                                'Selecionar',
                                // minFontSize: 12,
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.modaltextocheckbox,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CheckBoxMobile(),
                              AutoSizeText(
                                'Integrador',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.modaltextocheckbox,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CheckBoxMobile(),
                              AutoSizeText(
                                'Integrador',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.modaltextocheckbox,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CheckBoxMobile(

                              ),
                              AutoSizeText(
                                'Integrador',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.modaltextocheckbox,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CheckBoxMobile(),
                              AutoSizeText(
                                'Integrador',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.modaltextocheckbox,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CheckBoxMobile(),
                              AutoSizeText(
                                'Integrador',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.modaltextocheckbox,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CheckBoxMobile(),
                              AutoSizeText(
                                'Integrador',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.modaltextocheckbox,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CheckBoxMobile(),
                              AutoSizeText(
                                'Integrador',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.modaltextocheckbox,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // CustomScrollView(
                  //   slivers: [
                  //     SliverGrid(
                  //         delegate: SliverChildBuilderDelegate (
                  //           childCount: 10,
                  //             (context, index) {
                  //             return Text('GRID');
                  //             }
                  //         ),
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //             crossAxisCount: 4,
                  //           childAspectRatio: 1.1,
                  //         ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BtnCancelar(
                  onPressed: () {
                    Get.back();
                  },
                ),
                const SizedBox(width: 4),
                BtnConfirmar(
                  onPressed: () {},
                ),
              ],
            ),
            // const SizedBox(
            //   height: 15,
            // ),
          ],
        ),
      ),
    );
  }
    );
  }

  Widget _btnAdicionar(context) {
    return BtnPadrao(
      corIcone: AppTheme.adicionar,
      corTexto: Colors.white,
      texto: 'Adicionar',
      icone: Icons.add_circle,
      acao: () {
        showModalBottomSheet(
          isDismissible: false,
          // enableDrag: false,
          isScrollControlled: true,
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          )),
          builder: (context) => Container(
            // padding: EdgeInsets.all(16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 34, top: 28),
                      child: Text(
                        'Adicione Extras',
                        style: GoogleFonts.comfortaa(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.modaltitulo,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 34, bottom: 8),
                      child: Text(
                          'Selecione as funcionalidades que deseja inserir como extra no contrato',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.blackSubtitulo,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: _modalPlataforma(context),
              ),
              //BOTOES DO MODAL
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: Row(
                  // runSpacing: 16,
                  // alignment: WrapAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BtnCancelar(
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(width: 4),
                    BtnConfirmar(
                      onPressed: () {
                        //TODO btnconfirmar
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  Widget _modalPlataforma(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    List<Tab> listaComCadaItemDoEnum = [];
    controller.mapContratoIndicador.forEach((key, value) {
      listaComCadaItemDoEnum.add(
        Tab(
          child: _size.width > 530
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    'enum aquiaaaaaaaaaaaaaaa',
                    // key.descricao,
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

    List<SingleChildScrollView> listaDeItensExtrasFilhosdoEnum = [];
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
                      () => CheckBoxPadrao(
                        status: controller.boxEmpresateste,
                          //TODO CHECKBOX
                        alteraStatus: () {},
                          // alteraStatus: ((bool? value) {
                          //   controller.boxEmpresateste(value);
                          //   // controller.alternaBoxEmpresaStr
                          //   // ing(index, value!);
                          //   // controller.carregando = true;
                          //   controller.listaPlataformaContratoAdicionais.forEach((element) {
                          //     if (element.id == controller.listaPlataformaContratoAdicionais[index].tipoItem ) {
                          //       // element.tipoItem = value;
                          //     }
                          //     // controller.carregando = false;
                          //   });
                          // }
                          // ),
                        // },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
      listaDeItensExtrasFilhosdoEnum.add(
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Responsive(
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

    return DefaultTabController(
      length: controller.mapContratoIndicador.length,
      child: Scaffold(
        appBar: _showModalBottomAppBar(_size),
        body: TabBarView(
          children: listaDeItensExtrasFilhosdoEnum,
        ),
        // ],),
      ),
    );
  }

  AppBar _showModalBottomAppBar(Size size) {
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
}
