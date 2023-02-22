import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:models/model/models.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/utils/botoes/botao_padrao.dart';
import '../../../../widgets/carregamento/icone_carregando.dart';
import '../../../../widgets/personalizados/texto_extras_filtro.dart';
import '../../../../widgets/responsive.dart';
import '../../../../widgets/utils/icons_erp/icons_erpersonalizados.dart';
import 'extra_integrador_controller.dart';

class ExtraIntegradorPageComponent {
  final ExtraIntegradorPageController controller = Get.find();
  late BuildContext context;
  late double _height;
  late double _width;
  late var _orientation;

  initialize(BuildContext context) {
    this.context = context;

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _orientation = MediaQuery.of(context).orientation;
  }

  body() {
    print("Recosntuiu CORPO");
    return Responsive(
        mobile: Container(
          height: 200,
          width: 200,
          color: Colors.amber,
        ),
        desktop: coluna());
  }

  coluna() {
    return ListView(
      padding: const EdgeInsets.all(4),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _espacoExpandedContainer(),
            _btnSalvar(),
          ],
        ),
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
    );
    //   Column(
    //   children: [
    //     Expanded(
    //       flex: 10,
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           children: [
    //             _btnAdicionar(context),
    //             Expanded(child: Container()),
    //             _btnSalvar(),
    //           ],
    //         ),
    //       ),
    //     ),
    //     Expanded(
    //       flex: 90,
    //       child: ListView(
    //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //         children: [
    //           const Divider(
    //             thickness: 2,
    //           ),
    //           const SizedBox(
    //             height: 8,
    //           ),
    //           //todo _tabelaplataforma estava aqui
    //           Card(
    //             child: Expanded(child: Container(height: 100, width: 100, color: Colors.green,),),
    //           ),
    //           const SizedBox(
    //             height: 16,
    //           ),
    //
    //           //
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }


  _btnAdicionar(context) {
    return BtnPadrao(
      corIcone: AppTheme.adicionar,
      corTexto: Colors.white,
      texto: 'Adicionar',
      icone: Icons.add_circle,
      acao: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              )),
          builder: (context) => Container(
            // padding: EdgeInsets.all(16),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                height: 500,
                // child: _modalPlataforma(context),
                child: Container(height: 50, width: 50, color: Colors.amber,),
              ),
              //BOTOES DO MODAL
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: Row(
                  // runSpacing: 16,
                  // alignment: WrapAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                        print('clicou em sair');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: Color.fromRGBO(186, 26, 26, 1),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Text(
                          textAlign: TextAlign.end,
                          'Cancelar',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(186, 26, 26, 1),
                            letterSpacing: 0.25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(22, 156, 52, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Text(
                          textAlign: TextAlign.end,
                          'Confirmar',
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
              ),
            ]),
          ),
        );
      },
    );
  }


  Widget _btnSalvar() {
    return BtnPadrao(
        corIcone: AppTheme.sucesso,
        corTexto: Colors.white,
        texto: 'Salvar',
        icone: Icons.save,
        acao: () {
          // controller.atualizarItemConfiguracaoIntegrador();

          // onPressed: ()=> _atualizarItemConfiguracaoIntegrador(PlataformaIntegradorPageController.),
          // _atualizarItemConfiguracaoIntegrador();
        });
  }

  // Widget _modalPlataforma(BuildContext context) {
  //   Size _size = MediaQuery.of(context).size;
  //
  //   //lista tabBar- appBar
  //   List<Tab> tabsLista = [];
  //   controller.mapContratoIndicador.forEach((key, value) {
  //     tabsLista.add(
  //       Tab(
  //         child: _size.width > 530
  //             ? Padding(
  //           padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
  //           child: Text(
  //             key.descricao,
  //             textAlign: TextAlign.center,
  //             style: GoogleFonts.comfortaa(
  //               fontSize: 22,
  //               fontWeight: FontWeight.w500,
  //               letterSpacing: 0.15,
  //             ),
  //           ),
  //         )
  //             : const Icon(Icons.fact_check_outlined),
  //       ),
  //     );
  //   });
  //
  //   List<SingleChildScrollView> tabbarviewLista = [];
  //   controller.mapContratoIndicador.forEach((key, value) {
  //     List<Widget> listaNova = [];
  //     value.forEach((element) {
  //       print(element);
  //       listaNova.add(
  //         Row(
  //           children: [
  //             // TablePlataforma(),
  //             Expanded(
  //               child: Container(
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(14.0),
  //                   child: TextoAbaModal(
  //                     texto: element.nome!,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: Container(
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(16.0),
  //                   child: Obx(
  //                         () => CheckBoxPadrao(
  //                       status:  controller.boxEmpresateste,
  //                       alteraStatus: () {
  //                         controller.alternaBoxEmpresateste();
  //                       },
  //                     ),
  //                   ),
  //
  //                   // CheckBoxMobile(),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     });
  //     tabbarviewLista.add(
  //       SingleChildScrollView(
  //         child: Padding(
  //           padding: const EdgeInsets.all(18.0),
  //           child: Responsive(
  //             larguraMaximaMobile: 905,
  //             desktop: Padding(
  //               // padding: const EdgeInsets.all(16.0),
  //               padding:
  //               const EdgeInsets.symmetric(vertical: 48, horizontal: 181),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: listaNova,
  //               ),
  //             ),
  //             mobile: Container(),
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  //   print('Estou montando _modalPlataforma de adicional extra');
  //   return DefaultTabController(
  //     length: controller.mapContratoIndicador.length,
  //     child: Scaffold(
  //       // backgroundColor: AppTheme.background,
  //       appBar: _negocioAppBar(_size),
  //       body: TabBarView(
  //         children: tabbarviewLista,
  //       ),
  //       // ],),
  //     ),
  //   );
  // }

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
            ? itemConfiguracaoIntegradorWaychef
            .itemConfiguracaoWaychefDTO.nome
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
        text: controller.listaPlataformaContratoIntegradorExtra[index].detalhes !=  null
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
        text: controller.listaPlataformaContratoIntegradorExtra[index].valor!.toStringAsFixed(2));
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
              Expanded(
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }

  expandedDisponivel(context, index, itemConfiguracaoIntegradorWaychef) {
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 1,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Transform.scale(
              scale: width / 1327,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: itemConfiguracaoIntegradorWaychef.permiteComercializar,
                onChanged: ((bool? value) {
                  controller.alternaBoxEmpresateste(index, value!);
                  controller.carregando = true;
                  controller.listaPlataformaContratoIntegradorExtra
                      .forEach((element) {
                    if (element.idItemConfiguracaoWaychef ==
                        itemConfiguracaoIntegradorWaychef
                            .idItemConfiguracaoWaychef) {
                      element.permiteComercializar = value;
                    }
                    controller.carregando = false;
                  });
                }),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  _espacoExpandedContainer() {
    return Expanded(child: Container());
  }
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
