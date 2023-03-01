import 'package:auto_size_text/auto_size_text.dart';
import 'package:erp/pages/pagamentos/pagamentos_page_controller.dart';
import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../theme/app_theme.dart';
import '../../widgets/utils/botoes/botao_padrao.dart';
import '../../../../widgets/botao_proximo.dart';
import '../../../../widgets/card_preco.dart';
import '../../../../widgets/expanded_lista.dart';
import '../../../../widgets/responsive.dart';
import '../../../../widgets/texto_plataforma_extras.dart';
import 'componentes/cartao.dart';
import 'componentes/cartao_vazio.dart';
import 'componentes/texto_customizado.dart';

class PagamentosPage extends GetView<PagamentosPageController> {
// class EditarContratoErpPage extends StatelessWidget {
  const PagamentosPage({Key? key}) : super(key: key);

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
            Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              color: AppTheme.corDeFundoAbaModal,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: controller.indexController.value == 0
                              ? AppTheme.adicionar
                              : AppTheme.corDeFundoAbaModal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        ),
                        onPressed: () => controller.updateIndex(0),
                        // mudaindex(0);

                        child: Text(
                          'Plano',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: controller.indexController.value == 0
                                ? AppTheme.corBranco
                                : AppTheme.adicionar,
                            letterSpacing: 0.5,
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      width: 16,
                    ),
                    Obx(() {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: controller.indexController.value == 1
                              ? AppTheme.adicionar
                              : AppTheme.corDeFundoAbaModal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        ),
                        onPressed: () => controller.updateIndex(1),
                        child: Text(
                          'Forma de Pagamento',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            // (corTexto != null) ? corTexto : Colors.white,
                            color: controller.indexController.value == 1
                                ? AppTheme.corBranco
                                : AppTheme.adicionar,
                            letterSpacing: 0.5,
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      width: 16,
                    ),
                    Obx(() {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: controller.indexController.value == 2
                              ? AppTheme.adicionar
                              : AppTheme.corDeFundoAbaModal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        ),
                        onPressed: () => controller.updateIndex(2),
                        child: Text(
                          'Fatura',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            // (corTexto != null) ? corTexto : Colors.white,
                            color: controller.indexController.value == 2
                                ? AppTheme.corBranco
                                : AppTheme.adicionar,
                            letterSpacing: 0.5,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Obx(() {
              return IndexedStack(
                index: controller.indexController.value,
                children: [
                  // Tela aba plano
                  Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 52,
                        ),
                        Row(
                          children: [
                            Expanded(
                              /*1*/
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /*2*/
                                  Container(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      'Prata Mensal',
                                      style: GoogleFonts.comfortaa(
                                        fontSize: 26,
                                        letterSpacing: 0.15,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Vencimento: 01/01/0001',
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 19,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Valor Total: R\$ 0,00',
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 19,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /*3*/
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(250, 250, 250, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    side: BorderSide(
                                        width: 3, color: AppTheme.adicionar)),
                                //splashColor: DefaultTheme.accentColor, Desativado pelo uso do ElevatedButton
                              ),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Alterar plano',
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    letterSpacing: 0.25,
                                    color: AppTheme.adicionar,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 52,
                        ),

                        Wrap(
                          runAlignment: WrapAlignment.spaceBetween,
                          clipBehavior: Clip.antiAlias,
                          runSpacing: 16,
                          spacing: 28,
                          children: [
                            Container(
                              // height: 300,
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: Card(
                                color: Color.fromRGBO(250, 250, 250, 1),
                                elevation: 0,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      color: Color(0xFFE9F1FF),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text('Produto',
                                                style: GoogleFonts.comfortaa(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(
                                                      13, 13, 13, 1),
                                                  letterSpacing: -0.5,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                'Controle de tabela de preços',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.comfortaa(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19,
                                                  letterSpacing: 0.15,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Icon(
                                                Icons.check,
                                                color: Color.fromRGBO(
                                                    22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // height: 300,
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: Card(
                                color: Color.fromRGBO(250, 250, 250, 1),
                                elevation: 0,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      color: Color(0xFFE9F1FF),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text('Limites',
                                                style: GoogleFonts.comfortaa(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(
                                                      13, 13, 13, 1),
                                                  letterSpacing: -0.5,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                'Controle de tabela de preços',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.comfortaa(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19,
                                                  letterSpacing: 0.15,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Icon(
                                                Icons.check,
                                                color: Color.fromRGBO(
                                                    22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // height: 300,
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: Card(
                                color: Color.fromRGBO(250, 250, 250, 1),
                                elevation: 0,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      color: Color(0xFFE9F1FF),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text('Estoque',
                                                style: GoogleFonts.comfortaa(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(
                                                      13, 13, 13, 1),
                                                  letterSpacing: -0.5,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                'Controle de tabela de preços',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.comfortaa(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19,
                                                  letterSpacing: 0.15,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Icon(
                                                Icons.check,
                                                color: Color.fromRGBO(
                                                    22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                'Controle de tabela de preços',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.comfortaa(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19,
                                                  letterSpacing: 0.15,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Icon(
                                                Icons.check,
                                                color: Color.fromRGBO(
                                                    22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                'Controle de tabela de preços',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.comfortaa(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19,
                                                  letterSpacing: 0.15,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Icon(
                                                Icons.check,
                                                color: Color.fromRGBO(
                                                    22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // height: 300,
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: Card(
                                color: Color.fromRGBO(250, 250, 250, 1),
                                elevation: 0,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      color: Color(0xFFE9F1FF),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text('Financeiro',
                                                style: GoogleFonts.comfortaa(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(
                                                      13, 13, 13, 1),
                                                  letterSpacing: -0.5,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                'Controle de tabela de preços',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.comfortaa(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19,
                                                  letterSpacing: 0.15,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Icon(
                                                Icons.check,
                                                color: Color.fromRGBO(
                                                    22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                'Controle de tabela de preços',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.comfortaa(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19,
                                                  letterSpacing: 0.15,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Icon(
                                                Icons.check,
                                                color: Color.fromRGBO(
                                                    22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                'Controle de tabela de preços',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.comfortaa(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19,
                                                  letterSpacing: 0.15,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Icon(
                                                Icons.check,
                                                color: Color.fromRGBO(
                                                    22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                'Controle de tabela de preços',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.comfortaa(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19,
                                                  letterSpacing: 0.15,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Icon(
                                                Icons.check,
                                                color: Color.fromRGBO(
                                                    22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // height: 300,
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: Card(
                                color: Color.fromRGBO(250, 250, 250, 1),
                                elevation: 0,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      color: Color(0xFFE9F1FF),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text('Fiscal',
                                                style: GoogleFonts.comfortaa(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(
                                                      13, 13, 13, 1),
                                                  letterSpacing: -0.5,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Text(
                                                'Controle de tabela de preços',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.comfortaa(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19,
                                                  letterSpacing: 0.15,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Icon(
                                                Icons.check,
                                                color: Color.fromRGBO(
                                                    22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),

                        Container(
                          padding: EdgeInsets.all(16),
                          color: Color(0xFFE9F1FF),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text('Extras',
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(13, 13, 13, 1),
                                      letterSpacing: -0.5,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Card(
                            color: Color.fromRGBO(250, 250, 250, 1),
                            elevation: 0,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            'Aplicativo - WayWallert',
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.comfortaa(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('R\$ 30,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.comfortaa(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            'Aplicativo - WayWallert',
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.comfortaa(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('R\$ 30,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.comfortaa(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            'Aplicativo - WayWallert',
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.comfortaa(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('R\$ 30,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.comfortaa(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            'Aplicativo - WayWallert',
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.comfortaa(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('R\$ 30,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.comfortaa(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            'Aplicativo - WayWallert',
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.comfortaa(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('R\$ 30,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.comfortaa(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            'Aplicativo - WayWallert',
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.comfortaa(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('R\$ 30,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.comfortaa(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            'Aplicativo - WayWallert',
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.comfortaa(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('R\$ 30,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.comfortaa(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            'Aplicativo - WayWallert',
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.comfortaa(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('R\$ 30,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.comfortaa(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            'Aplicativo - WayWallert',
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.comfortaa(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('R\$ 30,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.comfortaa(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            'Aplicativo - WayWallert',
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.comfortaa(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                              letterSpacing: 0.15,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('R\$ 30,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.comfortaa(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFAED),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(
                              children: [
                                Expanded(
                                  /*1*/
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /*2*/
                                      Container(
                                        padding: EdgeInsets.only(bottom: 8),
                                        child: Text(
                                          'Valor total do plano R\$100,00',
                                          style: GoogleFonts.comfortaa(
                                            fontSize: 26,
                                            letterSpacing: 0.15,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromRGBO(13, 13, 13, 1),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Você adicionou pacotes extras ao seu plano, será cobrado o valor de R\$ 3.288,72\n'
                                        'referente aos dias restantes de contrato',
                                        softWrap: true,
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 15,
                                          letterSpacing: 0.25,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF0D0D0D),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                    ],
                                  ),
                                ),
                                /*3*/
                                _btnFazerPagamento(),
                              ],
                            ),
                          ),
                        ),
                        // Container(
                        //   child: Row(children: [
                        //     Expanded(child: Container()),
                        //     _btnFazerPagamento(),
                        //   ]),
                        // ),
                      ],
                    ),
                  ),
                  
                  // Tela aba forma de pagamento
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          height: 52,
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'Meus cartões',
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 23,
                                    letterSpacing: -0.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(13, 13, 13, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 52,
                        ),
                        Wrap(
                          alignment: WrapAlignment.start,
                          clipBehavior: Clip.antiAlias,
                          runSpacing: 8,
                          spacing: 8,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.48,
                              child: Cartao(),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.48,
                              child: CartaoVazio(
                                  // onPressed: () { Get.dialog(_modalCadastroCartao()); }
                                  onPressed: () {
                                Get.dialog(_modalNovoContratoCartao(context));
                              }),
                            ),
                            // Expanded(child: Container()),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),

                      ],
                    ),
                  ),


                  // Tela aba fatura
                  Container(
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,
                      // padding: const EdgeInsets.all(16),
                      children: [
                        const SizedBox(
                          height: 52,
                        ),
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
                        const SizedBox(
                          height: 16,
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
                              child: Container(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),

                        // Row(
                        //   children: [
                        //     Expanded(child: Container()),
                        //     ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: Colors.white,
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(8),
                        //           side: BorderSide(
                        //             color: Color.fromRGBO(186, 26, 26, 1),
                        //           ),
                        //         ),
                        //       ),
                        //       onPressed: () {},
                        //       child: Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //           horizontal: 8,
                        //           vertical: 16,
                        //         ),
                        //         child: Text(
                        //           'Limpar filtros',
                        //           style: GoogleFonts.sourceSansPro(
                        //             color: Color.fromRGBO(186, 26, 26, 1),
                        //             fontWeight: FontWeight.w600,
                        //             fontSize: 16,
                        //             letterSpacing: 0.25,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 16,
                        //     ),
                        //     ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: AppTheme.adicionar,
                        //       ),
                        //       onPressed: () {},
                        //       child: Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //           horizontal: 8,
                        //           vertical: 16,
                        //         ),
                        //         child: Text(
                        //           'Pesquisar',
                        //           style: GoogleFonts.sourceSansPro(
                        //             color: AppTheme.corBranco,
                        //             fontWeight: FontWeight.w600,
                        //             fontSize: 16,
                        //             letterSpacing: 0.25,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),

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
                        Column(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // coluna fatura primeira
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(233, 241, 255, 1),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Text(
                                                    'Faturas',
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 23,
                                                      letterSpacing: -0.5,
                                                      color: Color(0xFF171C22),
                                                    ),
                                                  ),
                                                )),
                                            Container(
                                              height: 400,
                                              child: SingleChildScrollView(
                                                child: Column(children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Atrasado',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Atrasado',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Atrasado',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Atrasado',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Atrasado',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Atrasado',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Atrasado',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Atrasado',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Alterar cartão',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Atrasado',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Atrasado',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Atrasado',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(14.0),
                                                    child: Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          252, 252, 255, 1),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(24.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Licença de uso Prata Mensal + 10 sessões',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .visibility,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                Text(
                                                                  '10/09/2011',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        17,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Text(
                                                                  'Valor: R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            94,
                                                                            94,
                                                                            94,
                                                                            1),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding: EdgeInsets.only(
                                                                        left: 0,
                                                                        top: 8,
                                                                        right:
                                                                            0,
                                                                        bottom:
                                                                            8),
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      side:
                                                                          BorderSide(
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            237,
                                                                            232,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            8),
                                                                    child: Text(
                                                                      'Atrasado',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color.fromRGBO(
                                                                            95,
                                                                            21,
                                                                            0,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // coluna fatura segunda
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 48,
                                            ),
                                            Container(
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    16.0),
                                                        child: Column(
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                'Número',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .comfortaa(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 24,
                                                                  letterSpacing:
                                                                      0.15,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          85,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                '16518432354224',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .sourceSansPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 17,
                                                                  letterSpacing:
                                                                      0.5,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          94,
                                                                          94,
                                                                          94,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 9,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            255, 248, 214, 1),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(24),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Icon(
                                                                    Icons
                                                                        .warning_amber,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            156,
                                                                            143,
                                                                            22,
                                                                            1),
                                                                  ),
                                                                ),
                                                                // SizedBox(
                                                                //   width: 16,
                                                                // ),
                                                                Expanded(
                                                                  flex: 8,
                                                                  child: Text(
                                                                    'Não autorizado, cartão de crédito inexistente',
                                                                    style: GoogleFonts
                                                                        .sourceSansPro(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          19,
                                                                      letterSpacing:
                                                                          0.5,
                                                                      color: Color.fromRGBO(
                                                                          156,
                                                                          143,
                                                                          22,
                                                                          1),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 3,
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed:
                                                                        () {},
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      elevation:
                                                                          0,
                                                                      backgroundColor: Color.fromRGBO(
                                                                          255,
                                                                          248,
                                                                          214,
                                                                          1),
                                                                    ),
                                                                    child: Text(
                                                                      'Alterar Cartão',
                                                                      style: GoogleFonts
                                                                          .sourceSansPro(
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: Color.fromRGBO(
                                                                            44,
                                                                            49,
                                                                            55,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            Container(
                                              height: 400,
                                              child: Column(children: [
                                                // aqui
                                                Card(
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  color: Color.fromRGBO(
                                                      252, 252, 255, 1),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                'NFSE',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .comfortaa(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0.15,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          85,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                'Cód. Autorização',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .comfortaa(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0.15,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          85,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                'NSU',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .comfortaa(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0.15,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          85,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                'TID',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .comfortaa(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0.15,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          85,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                'Data',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .comfortaa(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0.15,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          85,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Icon(
                                                                  Icons
                                                                      .download,
                                                                  color: AppTheme
                                                                      .adicionar,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                '4545454545',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .sourceSansPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0.15,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          85,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                '16518432354224',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .sourceSansPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0.15,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          85,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                '16511545',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .sourceSansPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0.15,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          85,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                '10/08/2022',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .sourceSansPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0.15,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          85,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 64,
                                                        ),
                                                        Row(
                                                          // mainAxisAlignment:
                                                          //     MainAxisAlignment
                                                          //         .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 10,
                                                              child: Text(
                                                                'Descrição',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .sourceSansPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0.15,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          85,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  'Valor',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .comfortaa(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        16,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            0,
                                                                            51,
                                                                            85,
                                                                            1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 16),
                                                        Row(
                                                          // mainAxisAlignment:
                                                          //     MainAxisAlignment
                                                          //         .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              flex: 10,
                                                              child: Text(
                                                                'Licença de uso Prata Mensal + 10 sessões',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: GoogleFonts
                                                                    .sourceSansPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 17,
                                                                  letterSpacing:
                                                                      0.5,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          51,
                                                                          85,
                                                                          1),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  'R\$ 0,00',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: GoogleFonts
                                                                      .sourceSansPro(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        20,
                                                                    letterSpacing:
                                                                        0.5,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            0,
                                                                            51,
                                                                            85,
                                                                            1),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                //aqqui2
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Expanded(
                                    //   flex: 6,
                                    //   child: Container(
                                    //     child: Column(
                                    //         children: [
                                    //           Container(
                                    //               alignment: Alignment.centerLeft,
                                    //               child: Padding(
                                    //                 padding: const EdgeInsets.all(
                                    //                     16.0),
                                    //                 child: Text(
                                    //                   'Faturas',
                                    //                   style: GoogleFonts
                                    //                       .sourceSansPro(
                                    //                     fontWeight:
                                    //                     FontWeight.w500,
                                    //                     fontSize: 23,
                                    //                     letterSpacing: -0.5,
                                    //                     color: Color(0xFF171C22),
                                    //                   ),
                                    //                 ),
                                    //               )),
                                    //       Row(children: [
                                    //         Text('Numero \n 16518432354224'),
                                    //         Text('Não autorizado, cartão de \n crédito inexistente'),
                                    //         Text('Alterar cartão'),
                                    //
                                    //       ]),
                                    //       Row(
                                    //           children: [
                                    //         Text('NFSE'),
                                    //         Text('Cód. Autorização'),
                                    //         Text('NSU'),
                                    //         Text('TID'),
                                    //         Text('Data'),
                                    //
                                    //
                                    //       ]),
                                    //       Row(
                                    //           children: [
                                    //         Text('NFSE'),
                                    //         Text('Cód. Autorização'),
                                    //         Text('NSU'),
                                    //         Text('TID'),
                                    //         Text('Data'),
                                    //
                                    //
                                    //       ]),
                                    //       Row(
                                    //         children: [
                                    //           Text('Descrição'),
                                    //           Text('Valor'),
                                    //         ]
                                    //       ),
                                    //       Row(
                                    //         children: [
                                    //           Text('Licença de uso Prata Mensal + 10 sessões'),
                                    //           Text('R\$ 50,00'),
                                    //         ]
                                    //       ),
                                    //     ]),
                                    //   ),
                                    // ),
                                    const SizedBox(width: 12),
                                  ],
                                ),
                              ),

                            ]),
                        const SizedBox(
                          height: 36,
                        ),


                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _modalCadastroCartao() {
    final numeroCartaoFormatter = MaskTextInputFormatter(
      mask: '####-####-####-####',
      filter: {'#': RegExp(r'[0-9]')},
    );
    final celularFormatter = MaskTextInputFormatter(
      mask: '## # ####-####',
      filter: {'#': RegExp(r'[0-9]')},
    );
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: Text(
        'Novo cartão',
        style: GoogleFonts.comfortaa(
          fontWeight: FontWeight.w400,
          letterSpacing: -0.5,
          fontSize: 33,
        ),
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextoCustomizadoFormField(
                        label: 'Número do cartão',
                        inputFormatters: [numeroCartaoFormatter],
                      ),
                      TextoCustomizadoFormField(
                        label: 'Nome do cartão',
                        inputFormatters: [numeroCartaoFormatter],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 6,
                            child: TextoCustomizadoFormField(
                              label: 'Vencimento',
                              inputFormatters: [numeroCartaoFormatter],
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: TextoCustomizadoFormField(
                              label: 'CVV',
                              inputFormatters: [numeroCartaoFormatter],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Cartao(),
                      ],
                    ))
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
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
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(22, 156, 52, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Text(
                          textAlign: TextAlign.end,
                          'Cadastrar cartão',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.buttomModalConfirmar,
                            letterSpacing: 0.25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _modalCancelar() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.circular(16),
      ),
      title: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Cancelamento',
              style: GoogleFonts.comfortaa(
                fontSize: 33,
                letterSpacing: -0.5,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(13, 13, 13, 1),
              ),
            ),
          ),
          const Divider(thickness: 2,),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Para cancelar esse contrato é necessário \n'
                    'descrever o motivo do cancelamento',
                  style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    letterSpacing: 0.5,
                  ),),
              ),
            ],
          ),
          SizedBox(height: 40,),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(80)],
              cursorColor: Color.fromRGBO(66, 71, 78, 1),
              decoration: InputDecoration(
                labelText: 'Motivo Do Cancelamento',
                labelStyle: GoogleFonts.sourceSansPro(
                  fontSize: 15,
                  letterSpacing: 0.25,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(66, 71, 78, 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(66, 71, 78, 1),),
                ),
                isDense: true,
              ),

            ),
          ),
          SizedBox(height: 40,),
          Row(
            children: [
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
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
                    EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(
                      textAlign: TextAlign.end,
                      'Desistir',
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(186, 26, 26, 1),
                        letterSpacing: 0.25,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(22, 156, 52, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(
                      textAlign: TextAlign.end,
                      'Cancelar assinatura',
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.buttomModalConfirmar,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _modalCancelarRecorrencia() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.circular(16),
      ),
      title: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Cancelar Recorrência',
            style: GoogleFonts.comfortaa(
              fontSize: 33,
              letterSpacing: -0.5,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(13, 13, 13, 1),
            ),
            ),
          ),
          const Divider(thickness: 2,),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Selecione a quantidade de sessões extras que \n'
                    'deseja cancelar, no momento você possui',
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  letterSpacing: 0.5,
                ),),
              ),
            ],
          ),
          SizedBox(height: 40,),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(194, 199, 207, 1),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Sessões Extras Atuais',
                        style: GoogleFonts.roboto(
                          color: Color.fromRGBO(66, 71, 78, 1),
                          fontSize: 12,
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w400,
                        ),),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('10',
                        style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          letterSpacing: 0.25,
                          color: Color.fromRGBO(66, 71, 78, 1),
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('-'),
                         Text('1'),
                         Text('+'),
                       ],
                     ),
                    ],
                  ),
                ),
              ),
            ],
          ),




          SizedBox(height: 40,),
          Row(
            children: [
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: AppTheme.adicionar,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(
                      textAlign: TextAlign.end,
                      'Desistir',
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.adicionar,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(186, 26, 26, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(
                      textAlign: TextAlign.end,
                      'Cancelar recorrência',
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.buttomModalConfirmar,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _modalNovoContratoCartao(context) {
    final numeroCartaoFormatter = MaskTextInputFormatter(
      mask: '####-####-####-####',
      filter: {'#': RegExp(r'[0-9]')},
    );
    final celularFormatter = MaskTextInputFormatter(
      mask: '## # ####-####',
      filter: {'#': RegExp(r'[0-9]')},
    );
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      title: Row(children: [
        Text(
          'Finalizar compra',
          style: GoogleFonts.comfortaa(
            fontWeight: FontWeight.w400,
            letterSpacing: -0.5,
            fontSize: 33,
            decorationThickness: 2,
          ),
        ),
        Divider(
          thickness: 2,
        ),
      ]),
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Color.fromRGBO(255, 237, 231, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Alteração do novo plano',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w500,
                          fontSize: 23,
                          letterSpacing: -0.5,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Valor debitado do plano: R\$ 58,00',
                        style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          letterSpacing: 0.5,
                          color: Color.fromRGBO(13, 13, 13, 1),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Dias acrescentados ao vencimento: 8 dias',
                        style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          letterSpacing: 0.5,
                          color: Color.fromRGBO(13, 13, 13, 1),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Valor do novo contrato: R\$ 58,00',
                        style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          letterSpacing: 0.5,
                          color: Color.fromRGBO(13, 13, 13, 1),
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Cartão Cadastrado',
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  letterSpacing: 0.15,
                  color: Color.fromRGBO(13, 13, 13, 1),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  // width: MediaQuery.of(context).size.width * 0.48,
                  child: Cartao(),
                ),
                Expanded(
                  // width: MediaQuery.of(context).size.width * 0.48,
                  child: CartaoVazio(
                      // onPressed: () { Get.dialog(_modalCadastroCartao()); }
                      onPressed: () {}),
                ),
                // Expanded(child: Container()),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
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
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(22, 156, 52, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Text(
                          textAlign: TextAlign.end,
                          'Finalizar compra',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.buttomModalConfirmar,
                            letterSpacing: 0.25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _btnFazerPagamento() {
  return BotaoPadraoProximo(
    corTexto: Colors.white,
    texto: 'Fazer pagamento',
    // icone: Icons.calendar_today_outlined,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}

Widget _btnProximo() {
  return BotaoPadraoProximo(
    corTexto: Colors.white,
    texto: 'Próximo',
    // icone: Icons.calendar_today_outlined,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}

Widget _btnSalvar() {
  return BtnPadrao(
    corIcone: AppTheme.sucesso,
    corTexto: Colors.white,
    texto: 'Finalizar',
    icone: Icons.save,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}
