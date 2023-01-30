import 'package:erp/pages/pagamentos/pagamentos_relatorios_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../../widgets/droppersonalizado.dart';
import '../../widgets/responsive.dart';
import '../../widgets/utils/constantes.dart';

class PagamentosRelatorioPage extends GetView<PagamentosRelatoriosController> {
// class PagamentosRelatorioPage extends StatelessWidget {
  const PagamentosRelatorioPage({Key? key}) : super(key: key);

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
        desktop: ListView(padding: const EdgeInsets.all(16), children: [
          // Row(
          //   children: [
          //     Text(
          //       'Dados da Empresa',
          //       style: GoogleFonts.sourceSansPro(
          //         fontWeight: FontWeight.w500,
          //         fontSize: 15,
          //         letterSpacing: 0.25,
          //         color: Color(0xFF001D34),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //       child: Text(
          //         '>',
          //         style: GoogleFonts.comfortaa(
          //           fontWeight: FontWeight.w900,
          //           fontSize: 16,
          //           letterSpacing: -0.5,
          //           color: Color(0xFF001D34),
          //         ),
          //       ),
          //     ),
          //     Text(
          //       'Minha Empresa',
          //       style: GoogleFonts.sourceSansPro(
          //         fontWeight: FontWeight.w500,
          //         fontSize: 15,
          //         letterSpacing: 0.25,
          //         color: Color(0xFF171C22),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 64,),
          Row(
            children: [
              Text(
                'Filtros',
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                  letterSpacing: -0.5,
                  color: Color(0xFF171C22),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: TextFormField(
                    cursorColor: Color.fromRGBO(66, 71, 78, 1),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Color.fromRGBO(50, 50, 50, 1),
                        ),
                        onPressed: () {},
                      ),
                      hintText: '26/01/2023',
                      hintStyle: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: 0.4,
                        color: Color.fromRGBO(66, 71, 78, 1),
                      ),
                      labelText: 'Selecione um período (a partir de) *',
                      labelStyle: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        letterSpacing: 0.4,
                        color: Color.fromRGBO(66, 71, 78, 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(66, 71, 78, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: TextFormField(
                    cursorColor: Color.fromRGBO(66, 71, 78, 1),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Color.fromRGBO(50, 50, 50, 1),
                        ),
                        onPressed: () {},
                      ),
                      hintText: '26/01/2023',
                      hintStyle: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: 0.4,
                        color: Color.fromRGBO(66, 71, 78, 1),
                      ),
                      labelText: 'Selecione um período (até)',
                      labelStyle: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        letterSpacing: 0.4,
                        color: Color.fromRGBO(66, 71, 78, 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(66, 71, 78, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: TextFormField(
                    cursorColor: Color.fromRGBO(66, 71, 78, 1),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Color.fromRGBO(50, 50, 50, 1),
                        ),
                        onPressed: () {},
                      ),
                      hintText: '26/01/2023',
                      hintStyle: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: 0.4,
                        color: Color.fromRGBO(66, 71, 78, 1),
                      ),
                      labelText: 'Selecione um período (a partir de) *',
                      labelStyle: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        letterSpacing: 0.4,
                        color: Color.fromRGBO(66, 71, 78, 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(66, 71, 78, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: TextFormField(
                    cursorColor: Color.fromRGBO(66, 71, 78, 1),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Color.fromRGBO(50, 50, 50, 1),
                        ),
                        onPressed: () {},
                      ),
                      hintText: '26/01/2023',
                      hintStyle: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: 0.4,
                        color: Color.fromRGBO(66, 71, 78, 1),
                      ),
                      labelText: 'Selecione um período (a partir de) *',
                      labelStyle: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        letterSpacing: 0.4,
                        color: Color.fromRGBO(66, 71, 78, 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(66, 71, 78, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: TextFormField(
                    cursorColor: Color.fromRGBO(66, 71, 78, 1),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Color.fromRGBO(50, 50, 50, 1),
                        ),
                        onPressed: () {},
                      ),
                      hintText: '26/01/2023',
                      hintStyle: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: 0.4,
                        color: Color.fromRGBO(66, 71, 78, 1),
                      ),
                      labelText: 'Selecione um período (a partir de) *',
                      labelStyle: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        letterSpacing: 0.4,
                        color: Color.fromRGBO(66, 71, 78, 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(66, 71, 78, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(flex: 9, child: Container())

              // Expanded(child: Container()),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(child: Container()),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: Color.fromRGBO(186, 26, 26, 1),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Text(
                    'Limpar filtros',
                    style: GoogleFonts.sourceSansPro(
                      color: Color.fromRGBO(186, 26, 26, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 0.25,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.adicionar,
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Text(
                    'Pesquisar',
                    style: GoogleFonts.sourceSansPro(
                      color: AppTheme.corBranco,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 0.25,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 22,
          ),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.download,
                    color: AppTheme.adicionar,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: Color.fromRGBO(233, 241, 255, 1),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'NFS-e',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Inscrição Federal',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Integrador',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Empresa',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Data',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Descrição',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Valor',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.attach_file,
                      color: AppTheme.adicionar,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '465456465464',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'PRODATI',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Assai',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '10/08/2022 10:00',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Licença de uso Prata Mensal + 10 sessões',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'R\$ 50.00',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.attach_file,
                      color: AppTheme.adicionar,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '465456465464',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'PRODATI',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Assai',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '10/08/2022 10:00',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Licença de uso Prata Mensal + 10 sessões',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'R\$ 50.00',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.attach_file,
                      color: AppTheme.adicionar,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '465456465464',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'PRODATI',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Assai',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '10/08/2022 10:00',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Licença de uso Prata Mensal + 10 sessões',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'R\$ 50.00',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.attach_file,
                      color: AppTheme.adicionar,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '465456465464',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'PRODATI',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Assai',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '10/08/2022 10:00',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Licença de uso Prata Mensal + 10 sessões',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'R\$ 50.00',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.attach_file,
                      color: AppTheme.adicionar,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '465456465464',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'PRODATI',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Assai',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '10/08/2022 10:00',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Licença de uso Prata Mensal + 10 sessões',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'R\$ 50.00',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.15,
                      color: Color.fromRGBO(0, 51, 85, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
