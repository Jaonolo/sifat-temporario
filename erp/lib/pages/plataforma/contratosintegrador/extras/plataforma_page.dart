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
                ],
              ),
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

  Widget _tabelaPlataforma() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(
          () => controller.carregando
              ? const IconeCarregando()
              : PaginatedDataTable(
                  rowsPerPage: controller.listaPlataformaContratoIntegradorExtra.length,
                  horizontalMargin: 0,
                  // DataTable(
                  source:
                  Tabela(
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
}

// TODO tabela getx pagina principal
class Tabela extends DataTableSource {
  PlataformaPageController controller;

  List<ItemConfiguracaoIntegradorWaychef> data;

  Tabela({required this.data, required this.controller});

  bool get isRowCountApproximate => false;

  int get rowCount => data.length;

  int get selectedRowCount => 0;

  DataRow getRow(int index) {
    print('pode commercializar abaixo');
    print(data[index].permiteComercializar!);
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
                controller
                    .mapDetalhes[data[index].itemConfiguracaoWaychefDTO.id!]!
                    .itemConfiguracaoWaychefDTO
                    .nome = text;
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
              controller
                  .mapDetalhes[data[index].itemConfiguracaoWaychefDTO.id!]!
                  .detalhes = text;
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
                controller
                    .mapDetalhes[data[index].itemConfiguracaoWaychefDTO.id!]!
                    .valor = double.tryParse(valor);
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
              borderRadius: BorderRadius.circular(6,
              ),
            ),
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: data[index].permiteComercializar,
            onChanged: ((bool? value) {
                controller.alternaBoxEmpresateste(index, value!);
                data[index].permiteComercializar = value;
            }),
            // onChanged: ((value) {
            //   print('BoloTERCA');
            //   controller.alterarBoxEmpresateste(index, value!);
            //   data[index].permiteComercializar = value;
            // }),
          ),
        ),
      ),
    ]);
  }

  // cor do botão checkbox
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
