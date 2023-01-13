import 'package:auto_size_text/auto_size_text.dart';
import 'package:erp/pages/pagamentos/pagamentos_page_controller.dart';
import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/botao_padrao.dart';
import '../../../../widgets/botao_proximo.dart';
import '../../../../widgets/card_preco.dart';
import '../../../../widgets/expanded_lista.dart';
import '../../../../widgets/responsive.dart';
import '../../../../widgets/texto_plataforma_extras.dart';
import 'componentes/cartao.dart';


class PagamentosPage
    extends GetView<PagamentosPageController> {
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
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    'Assinaturas',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w400,
                      fontSize: 46,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 36,
            ),
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
                                  SizedBox(height: 8,),
                                  Text(
                                    'Vencimento: 01/01/0001',
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 19,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                    ),
                                    ),
                                  SizedBox(height: 8,),
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
                                backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    side: BorderSide(width: 3, color: AppTheme.adicionar)),
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
                          spacing: 32,
                          children: [
                            Container(
                              // height: 300,
                              width: MediaQuery.of(context).size.width * 0.48,
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
                                                  color: Color.fromRGBO(13, 13, 13, 1),
                                                  letterSpacing: -0.5,
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              flex:4,
                                              child: Icon(Icons.check,
                                                color: Color.fromRGBO(22, 156, 52, 1),
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
                              width: MediaQuery.of(context).size.width * 0.48,
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
                                                  color: Color.fromRGBO(13, 13, 13, 1),
                                                  letterSpacing: -0.5,
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              flex:4,
                                              child: Icon(Icons.check,
                                                color: Color.fromRGBO(22, 156, 52, 1),
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
                              width: MediaQuery.of(context).size.width * 0.48,
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
                                                  color: Color.fromRGBO(13, 13, 13, 1),
                                                  letterSpacing: -0.5,
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              flex:4,
                                              child: Icon(Icons.check,
                                                color: Color.fromRGBO(22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              flex:4,
                                              child: Icon(Icons.check,
                                                color: Color.fromRGBO(22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              flex:4,
                                              child: Icon(Icons.check,
                                                color: Color.fromRGBO(22, 156, 52, 1),
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
                              width: MediaQuery.of(context).size.width * 0.48,
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
                                                  color: Color.fromRGBO(13, 13, 13, 1),
                                                  letterSpacing: -0.5,
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              flex:4,
                                              child: Icon(Icons.check,
                                                color: Color.fromRGBO(22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              flex:4,
                                              child: Icon(Icons.check,
                                                color: Color.fromRGBO(22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              flex:4,
                                              child: Icon(Icons.check,
                                                color: Color.fromRGBO(22, 156, 52, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              flex:4,
                                              child: Icon(Icons.check,
                                                color: Color.fromRGBO(22, 156, 52, 1),
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
                              width: MediaQuery.of(context).size.width * 0.48,
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
                                                  color: Color.fromRGBO(13, 13, 13, 1),
                                                  letterSpacing: -0.5,
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 24),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              flex:4,
                                              child: Icon(Icons.check,
                                                color: Color.fromRGBO(22, 156, 52, 1),
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
                                    )
                                ),
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
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          flex:3,
                                          child: Text('R\$ 30,00',
                                          style : GoogleFonts.comfortaa(
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(13, 13, 13, 1),
                                            fontSize: 19,
                                            letterSpacing: 0.15,
                                          )
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: Text('Adicionar',
                                            textAlign: TextAlign.right,
                                              style : GoogleFonts.comfortaa(
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          flex:3,
                                          child: Text('R\$ 30,00',
                                              style : GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style : GoogleFonts.comfortaa(
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          flex:3,
                                          child: Text('R\$ 30,00',
                                              style : GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style : GoogleFonts.comfortaa(
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          flex:3,
                                          child: Text('R\$ 30,00',
                                              style : GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style : GoogleFonts.comfortaa(
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          flex:3,
                                          child: Text('R\$ 30,00',
                                              style : GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style : GoogleFonts.comfortaa(
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          flex:3,
                                          child: Text('R\$ 30,00',
                                              style : GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style : GoogleFonts.comfortaa(
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          flex:3,
                                          child: Text('R\$ 30,00',
                                              style : GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style : GoogleFonts.comfortaa(
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          flex:3,
                                          child: Text('R\$ 30,00',
                                              style : GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style : GoogleFonts.comfortaa(
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          flex:3,
                                          child: Text('R\$ 30,00',
                                              style : GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style : GoogleFonts.comfortaa(
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          flex:3,
                                          child: Text('R\$ 30,00',
                                              style : GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          flex:3,
                                          child: Text('Adicionar',
                                              textAlign: TextAlign.right,
                                              style : GoogleFonts.comfortaa(
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFFF5722),
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              )

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
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                            color: Color.fromRGBO(13, 13, 13, 1),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8,),
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
                                      SizedBox(height: 32,),

                                    ],
                                  ),
                                ),
                                /*3*/
                                _btnFazerPagamento(),
                                // ElevatedButton(
                                //   style: ElevatedButton.styleFrom(
                                //     backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.circular(100.0),
                                //         side: BorderSide(width: 3, color: AppTheme.adicionar)),
                                //     //splashColor: DefaultTheme.accentColor, Desativado pelo uso do ElevatedButton
                                //   ),
                                //   onPressed: () {},
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(16.0),
                                //     child: Text(
                                //       'Alterar plano',
                                //       style: GoogleFonts.sourceSansPro(
                                //         fontWeight: FontWeight.w600,
                                //         fontSize: 20,
                                //         letterSpacing: 0.25,
                                //         color: AppTheme.adicionar,
                                //       ),
                                //     ),
                                //   ),
                                // ),
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

                        Row(

                          children: [
                            Expanded(

                                child: Cartao()
                            ),

                            Expanded(
                                child: Container(

                                ),
                            ),


                          ],
                        ),

                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          child: Row(children: [
                            Expanded(child: Container()),
                            _btnProximo(),
                          ]),
                        ),
                      ],
                    ),
                  ),

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
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Safira',
                                style: GoogleFonts.comfortaa(
                                  fontSize: 33,
                                  letterSpacing: -0.5,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(13, 13, 13, 1),
                                ),
                              ),
                            ),
                            SizedBox(height: 16,),
                          ],
                        ),
                        const SizedBox(
                          height: 52,
                        ),
                        // collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
                        // collapsedBackgroundColor: Color(0xFFE9F1FF),
                        // title:
                        Container(
                          color: Color(0xFFE9F1FF),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Valores',
                                style: GoogleFonts.comfortaa(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(0, 29, 52, 1),
                                  letterSpacing: -0.5,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              'Valor mensal',
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              'R\$ 45,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                                decoration:
                                                TextDecoration.underline,
                                                decorationThickness: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              'Valor trimestral',
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              'R\$ 45,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                                decoration:
                                                TextDecoration.underline,
                                                decorationThickness: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              'Valor semestral',
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              'R\$ 45,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                                decoration:
                                                TextDecoration.underline,
                                                decorationThickness: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: EdgeInsets.all(14.0),
                                            child: Text(
                                              'Valor anual',
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              'R\$ 45,00',
                                              style: GoogleFonts.comfortaa(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19,
                                                letterSpacing: 0.15,
                                                decoration:
                                                TextDecoration.underline,
                                                decorationThickness: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                ),
                              ]),
                        ),

                        const SizedBox(
                          height: 36,
                        ),
                        Container(
                          child: Row(
                              children: [
                                Expanded(child: Container()),
                                _btnSalvar(),
                              ]
                          ),
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
  return BotaoPadrao(
    corIcone: AppTheme.salvar,
    corTexto: Colors.white,
    texto: 'Finalizar',
    icone: Icons.save,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}

