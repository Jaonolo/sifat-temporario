import 'package:erp/pages/plataforma/contratosintegrador/extras/plataforma_integrador_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../models/plataformaintegrador/item_configuracao_integrador_waychef.dart';
import '../../../../theme/app_theme.dart';
import '../../../../widgets/botao_padrao.dart';
import '../../../../widgets/carregamento/icone_carregando.dart';
import '../../../../widgets/chebox_mobile.dart';
import '../../../../widgets/responsive.dart';

import 'package:auto_size_text/auto_size_text.dart';


class PlataformaIntegradorPage extends GetView<PlataformaIntegradorPageController> {
  // PlataformaPage({Key? key}) : super(key: key);

// {
//
// class PlataformaPage extends StatelessWidget {
//   const PlataformaPage({Key? key}) : super(key: key);

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
                _btnSalvar(

                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
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
        // onPressed: ()=> _atualizarItemConfiguracaoIntegrador(PlataformaIntegradorPageController.),
        // _atualizarItemConfiguracaoIntegrador();
      }

    );
  }

  Widget _btnAdicionar() {
    return BotaoPadrao(
      corIcone: AppTheme.adicionar,
      corTexto: Colors.white,
      texto: 'Adicionar',
      icone: Icons.add_circle,
      acao: () {
        //TODO: AÇÃO SALVAR
      },
    );
  }

  Widget _tabelaPlataforma() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(
          () => controller.carregando
              ? const IconeCarregando()
              : PaginatedDataTable(
                  // DataTable(
                  source: Tabela(
                      data: controller.listaPlataformaContratoIntegradorExtra),
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
                        'Tipo',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 51, 85, 1),
                          letterSpacing: 0.5,
                        ),
                      ),
                    )),
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

// TODOWenderson tabela getx pagina principal
class Tabela extends DataTableSource {
  List<ItemConfiguracaoIntegradorWaychef> data;

  Tabela({required this.data});

  bool get isRowCountApproximate => false;

  int get rowCount => data.length;

  int get selectedRowCount => 0;

  DataRow getRow(int index) {
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
          child: Text(
            data[index].itemConfiguracaoWaychefDTO.nome!,
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
        Padding(
          // padding: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.only(bottom: 5),
          child: TextFormField(
            cursorColor: Colors.black87,
            decoration: InputDecoration(
              labelText: data[index].itemConfiguracaoWaychefDTO.detalhes!,
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
          child: Text(
            data[index].valor!.toString(),
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
            child: data[index].itemConfiguracaoWaychefDTO.tipoItem! == 'NORMAL'
                ? ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE5FFE5),
                        minimumSize: Size.zero, // Set this
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)) // and this
                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                              data[index].itemConfiguracaoWaychefDTO.tipoItem!,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 12,
                                color: Color(0xFF169C34),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD6EBFF),
                        minimumSize: Size.zero, // Set this
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)) // and this
                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                              data[index].itemConfiguracaoWaychefDTO.tipoItem!,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 12,
                                color: Color(0xFF16649C),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            )
                    ),
                  )),
      ),
      DataCell(
        Container(child: CheckBoxMobile()),
      ),
    ]);
  }
}
