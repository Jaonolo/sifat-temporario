import 'package:erp/models/contratos_extra_plataforma.dart';
import 'package:erp/pages/menu/botoes_class.dart';
import 'package:erp/templates/pagina_com_appbar/pagina_com_appbar_template.dart';
import 'package:erp/widgets/personalizados/popup_menu_personalizado_3.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/responsive.dart';
import 'analise_page_controller.dart';

class AnalisePage extends GetView<AnalisePageController> {
  @override
  Widget build(BuildContext context) {
    return PaginaComAppBar(
      botoesNavegacao: _botoesNavegacao,
      child: _bodyPagina(context),
    );
  }

  final List<ContratosExtraPlataforma> dadosContratos = List.filled(
    7,
    ContratosExtraPlataforma(
      aplicacao: 'oi',
      nome: 'oi',
      valor: 20,
      integradores: {
        'oi': true,
      },
    ),
  );

  Widget _gerarBotaoIntegradores(a) => Container(
        child: PopupMenuPersonalizado(
          child: Text('selecionar'),
          onChange: (a) {},
          items: List.filled(12, MenuEntries(onClick: () {}, text: 'oi'))
              .map<PopupMenuItem<Function>>(
                (MenuEntries e) => PopupMenuItem<Function>(
                    padding: EdgeInsets.all(0),
                    value: e.onClick,
                    child: Wrap(
                      children: [
                        Material(
                            child: Checkbox(
                                value: false, onChanged: (a) => e.onClick)),
                        Text(
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            e.text),
                      ],
                    )),
              )
              .toList(),
          color: Colors.white,
        ),
      );

  Widget _table(context) => Table(
        columnWidths: {
          0: FixedColumnWidth(206),
          1: FixedColumnWidth(
              MediaQuery.of(context).size.width <= 1020 ? 100 : 163),
          2: FlexColumnWidth(1),
          3: FixedColumnWidth(108),
          4: FixedColumnWidth(136),
          5: FixedColumnWidth(133),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              SizedBox.fromSize(
                size: Size.fromHeight(48),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Função/Aplicação'),
                ),
              ),
              SizedBox.fromSize(
                size: Size.fromHeight(48),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Nome'),
                ),
              ),
              SizedBox.fromSize(
                size: Size.fromHeight(48),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Detalhes'),
                ),
              ),
              SizedBox.fromSize(
                size: Size.fromHeight(48),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Valor'),
                ),
              ),
              SizedBox.fromSize(
                size: Size.fromHeight(48),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Integrador'),
                ),
              ),
              SizedBox.fromSize(
                size: Size.fromHeight(48),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Disponível'),
                ),
              ),
            ],
            decoration: BoxDecoration(
              color: Color.fromRGBO(209, 235, 250, 1),
              border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(191, 191, 191, 1),
                  width: 2,
                ),
              ),
            ),
          ),
          ...dadosContratos
              .asMap()
              .entries
              .map(
                (e) => _gerarLinhaTabela(
                  dados: e.value,
                  color: e.key % 2 == 0
                      ? Colors.white
                      : Color.fromRGBO(245, 251, 255, 1),
                ),
              )
              .toList(),
          TableRow(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(232, 245, 253, 1)),
              children: [
                Wrap(
                  children: [
                    Text('oiiii'),
                    Obx(
                      () => PopupMenuButton(
                        child: Text('${controller.value}'),
                        itemBuilder: (context) => List.generate(
                          controller.length,
                          (i) => PopupMenuItem(
                            value: i,
                            child: Text('$i'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                ...List.filled(5, SizedBox.shrink()),
              ])
        ],
      );

  TableRow _gerarLinhaTabela(
          {Color? color, required ContratosExtraPlataforma dados}) =>
      TableRow(
        children: [
          SizedBox.fromSize(
            size: Size.fromHeight(70),
            child: Text(dados.aplicacao),
          ),
          Text(dados.nome),
          Text(dados.detalhes),
          Text('R\$${dados.valor.toStringAsFixed(2).replaceFirst('.', ',')}'),
          _gerarBotaoIntegradores(dados.integradores),
          Checkbox(value: dados.disponivel, onChanged: (a) {}),
        ],
        decoration: BoxDecoration(color: color),
      );

  Widget _bodyPagina(context) => Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width <= 1020 ? 16 : 40,
              vertical: MediaQuery.of(context).size.width <= 1020 ? 12 : 0
              ,),
          child: Container(
            padding: EdgeInsets.all(
              MediaQuery.of(context).size.width <= 1020 ? 9 : 24,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              color: Colors.white,
            ),
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          MediaQuery.of(context).size.width <= 1020 ? 15 : 24),
                  child:
                      Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MediaQuery.of(context).size.width <= 510 ? Expanded(child: _addButton(context))
                            : _addButton(context),
                          SizedBox(height: 0, width: MediaQuery.of(context).size.width <= 510 ? 16 : 7),
                          MediaQuery.of(context).size.width <= 510 ? Expanded(child: _saveButton(context))
                            : _saveButton(context),
                          ],
                      ),
                ),
                _table(context)
                /*Responsive(
                    larguraMaximaMobile: 1020,
                    mobile: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _table(context),
                    ),
                    desktop: _table(context)),*/
              ],
            ),
          ),
        ),
      );

  Widget _saveButton (context) => GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: MediaQuery.of(context).size.width <= 510 ? EdgeInsets.symmetric(vertical: 8) : EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 18,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.green,
                              ),
                              child: Center(
                                  child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 8,
                                  children: [
                                    Icon(
                                      Icons.save_outlined,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    Text(
                                      'Salvar',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );

  Widget _addButton (context) => GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: MediaQuery.of(context).size.width <= 510 ? EdgeInsets.symmetric(vertical: 8) : EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 18,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Colors.blueAccent,
                                    width: 1,
                                  ),
                              ),
                              child: Center(
                                  child: Wrap(
                                  spacing: 8,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.blueAccent,
                                      size: 24,
                                    ),
                                    Text(
                                      'Adicionar',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blueAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );

  final List<Botoes> _botoesNavegacao = [
    Botoes(
      icon: FontAwesomeIcons.chartPie,
      text: 'Dashboard',
      items: [
        MenuEntries(onClick: () {}, text: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA')
      ],
    ),
    Botoes(
      icon: FontAwesomeIcons.boxesStacked,
      text: 'Produtos',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),
    Botoes(
      icon: FontAwesomeIcons.solidUser,
      text: 'Clientes',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),
    Botoes(
      icon: FontAwesomeIcons.moneyCheckDollar,
      text: 'Finanças',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),
    /*Botoes(
      icon: FontAwesomeIcons.solidFileLines,
      text: 'Fiscal',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),
    Botoes(
      icon: FontAwesomeIcons.magnifyingGlass,
      text: 'Consultas Rápidas',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),
    Botoes(
      icon: FontAwesomeIcons.clipboardList,
      text: 'Análise e relatórios',
      items: [MenuEntries(onClick: () {}, text: 'oi')],
    ),*/
  ];
}
