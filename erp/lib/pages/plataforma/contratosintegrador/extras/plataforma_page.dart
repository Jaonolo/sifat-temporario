import 'package:erp/widgets/personalizados/texto_extras_filtro.dart';
import 'package:erp/widgets/utils/icons_erp/icons_erpersonalizados.dart';
import 'package:erp/pages/plataforma/contratosintegrador/extras/plataforma_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:models/model/models.dart';
import '../../../../app_antigo/config/application.dart';
import '../../../../theme/app_theme.dart';
import '../../../../widgets/botao_padrao.dart';
import '../../../../widgets/carregamento/icone_carregando.dart';
import '../../../../widgets/responsive.dart';

class PlataformaPage extends GetView<PlataformaPageController> {
  String? token;
  PlataformaPage(this.token) {
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
              _tabelaPlataformaVersaoListMobile(context),
            ],
          ),
        ),
        desktop: ListView(
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
        ),
      ),
    );
  }

  //Desktop
  _espacoExpandedContainer() {
    return Expanded(child: Container());
  }

  //Mobile

  //Desktop e Mobile
  _btnSalvar() {
    return BotaoPadrao(
        corIcone: AppTheme.salvar,
        corTexto: Color.fromRGBO(255, 255, 255, 1),
        texto: 'Salvar',
        icone: Icons.save,
        acao: () {
          controller.atualizarItemConfiguracaoIntegrador();
        });
  }

//----------- WIDGETS MOBILE
  Widget _tabelaPlataformaVersaoListMobile(context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Color.fromRGBO(233, 241, 255, 1),
      child: Container(
        // width: MediaQuery.of(context).size.width * 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
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
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconsErpersonalizados.arrow_up_arrow_down,
                          size: 16,
                          color: Color.fromRGBO(0, 51, 85, 1),
                        ),
                      ),
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
}
