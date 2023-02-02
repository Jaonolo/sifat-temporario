import 'package:erp/config/application.dart';
import 'package:erp/pages/plataforma/empresas/plataforma_empresa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:erp/pages/plataforma/plataforma_page_controller.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/botao_padrao.dart';
import '../../../widgets/card_preco.dart';
import '../../../widgets/card_preco_button.dart';
import '../../../widgets/chebox_mobile.dart';
import '../../../widgets/drop_down_button_padrao.dart';
import '../../../widgets/responsive.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../widgets/selecao_de_imagem.dart';
import '../../../widgets/texto_plataforma_extras.dart';
import '../../routes/app_pages.dart';
import 'componentes/textFormFieldPorcValor.dart';
// import '../../widgets/selecao_de_imagem.dart';
// import '../../organizar/routes/app_pages.dart';

class PlataformaEmpresaPage extends GetView<PlataformaEmpresaController> {
//   PlataformaPage({Key? key}) : super(key: key);
// String token;
// {
//
// class PlataformaEmpresaPage extends StatelessWidget {
  PlataformaEmpresaPage({Key? key}) : super(key: key);

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
            const SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              color: AppTheme.corDeFundoAbaModal,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          style: GoogleFonts.comfortaa(
                            fontSize: 33,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            color: controller.indexController.value == 0
                                ? AppTheme.corBranco
                                : AppTheme.corMenuNavegacao,

                          ),
                        ),
                      );
                    }),

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
                          'Extras',
                          style: GoogleFonts.comfortaa(
                            fontSize: 33,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            // (corTexto != null) ? corTexto : Colors.white,
                            color: controller.indexController.value == 1
                                ? AppTheme.corBranco
                                : AppTheme.corMenuNavegacao,

                          ),
                        ),
                      );
                    }),
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
                          'Valores',
                          style: GoogleFonts.comfortaa(
                            fontSize: 33,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            // (corTexto != null) ? corTexto : Colors.white,
                            color: controller.indexController.value == 2
                                ? AppTheme.corBranco
                                : AppTheme.corMenuNavegacao,

                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Obx(() {
              //TODO PRINCIPAL INDICES
              return IndexedStack(
                index: controller.indexController.value,
                children: [
                  // TODO PRIMEIRO
                  Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 52,
                        ),
                        Row(
                          children: [
                            Text(
                              'Tipo de faturamento',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.comfortaa(
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                letterSpacing: 0.15,
                              ),
                            ),
                            Expanded(child: Container()),
                            _btnProrrogarContrato(context),
                            const SizedBox(
                              width: 8,
                            ),
                            _btnNovoContrato(context),
                            const SizedBox(width: 8,),



                          ],
                        ),

                        const SizedBox(
                          height: 32,
                        ),
                        expandedInformacoesDoPlano(),
                        SizedBox(
                          height: 8,
                        ),
                        expandedInformacoesDePagamento(),
                        SizedBox(
                          height: 8,
                        ),
                        expandedPeriodoDeTestes(),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 237, 232, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                            child: Row(
                              //Todo to aqui sessoes
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    child: Text('Sessões',
                                      style: GoogleFonts.poppins(
                                        fontSize: 24,
                                        letterSpacing: 0.1,
                                        color: Color.fromRGBO(13, 13, 13, 1),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CardPrecoButton(
                                        onPressed: (){},
                                        label: '-',
                                        fontSize: 26,
                                        ),
                                        Text('1',
                                          style: GoogleFonts.poppins(
                                          fontSize: 24,
                                          color: Color.fromRGBO(13, 13, 13, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        ),
                                        CardPrecoButton(
                                          onPressed: (){},
                                          label: '-',
                                          fontSize: 26,
                                        ),
                                      ],

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        expandedListaLimites(),
                        SizedBox(
                          height: 8,
                        ),
                        expandedListaFinanceiro(),
                        SizedBox(
                          height: 8,
                        ),
                        expandedListaFiscal(),
                        SizedBox(
                          height: 8,
                        ),
                        expandedListaEstoque(),
                        SizedBox(
                          height: 8,
                        ),
                        expandedListaProduto(),
                        // expandedListaValores(),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                  // TODO SEGUNDO
                  Container(
                    child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(233, 241, 255, 1),

                                  ),
                                  child: Row(
                                    children: [
                                      // TablePlataforma(),
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: TextoPlataformaExtras(texto: 'Nome',),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: TextoPlataformaExtras(texto: 'Desconto',),
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Center(child: TextoPlataformaExtras(texto: 'Status',)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    // TablePlataforma(),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Text('Aplicativo - AUTOATENDIMENTO(TOTEM)',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 19,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextFormFieldPorcValor()),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: (){},
                                              child: Text('Cancelar recorência',
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(186, 26, 26, 1),
                                                  decoration: TextDecoration.underline,
                                                  letterSpacing: 0.25,




                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    // TablePlataforma(),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Text('Aplicativo - AUTOATENDIMENTO(TOTEM)',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 19,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextFormFieldPorcValor()),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: (){},
                                              child: Text('Cancelar recorência',
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(186, 26, 26, 1),
                                                  decoration: TextDecoration.underline,
                                                  letterSpacing: 0.25,




                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    // TablePlataforma(),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Text('Aplicativo - AUTOATENDIMENTO(TOTEM)',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 19,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextFormFieldPorcValor()),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: (){},
                                              child: Text('Cancelar recorência',
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(186, 26, 26, 1),
                                                  decoration: TextDecoration.underline,
                                                  letterSpacing: 0.25,




                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    // TablePlataforma(),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Text('Aplicativo - AUTOATENDIMENTO(TOTEM)',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 19,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextFormFieldPorcValor()),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: (){},
                                              child: Text('Cancelar recorência',
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(186, 26, 26, 1),
                                                  decoration: TextDecoration.underline,
                                                  letterSpacing: 0.25,




                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    // TablePlataforma(),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Text('Aplicativo - AUTOATENDIMENTO(TOTEM)',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 19,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextFormFieldPorcValor()),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: (){},
                                              child: Text('Cancelar recorência',
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(186, 26, 26, 1),
                                                  decoration: TextDecoration.underline,
                                                  letterSpacing: 0.25,




                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    // TablePlataforma(),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Text('Aplicativo - AUTOATENDIMENTO(TOTEM)',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 19,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextFormFieldPorcValor()),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: (){},
                                              child: Text('Cancelar recorência',
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(186, 26, 26, 1),
                                                  decoration: TextDecoration.underline,
                                                  letterSpacing: 0.25,




                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    // TablePlataforma(),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Text('Aplicativo - AUTOATENDIMENTO(TOTEM)',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 19,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextFormFieldPorcValor()),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: (){},
                                              child: Text('Cancelar recorência',
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(186, 26, 26, 1),
                                                  decoration: TextDecoration.underline,
                                                  letterSpacing: 0.25,




                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    // TablePlataforma(),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Text('Aplicativo - AUTOATENDIMENTO(TOTEM)',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 19,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextFormFieldPorcValor()),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: (){},
                                              child: Text('Cancelar recorência',
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(186, 26, 26, 1),
                                                  decoration: TextDecoration.underline,
                                                  letterSpacing: 0.25,




                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    // TablePlataforma(),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Text('Aplicativo - AUTOATENDIMENTO(TOTEM)',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 19,
                                                color: Color.fromRGBO(13, 13, 13, 1),
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.15,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextFormFieldPorcValor()),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: (){},
                                              child: Text('Cancelar recorência',
                                                style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(186, 26, 26, 1),
                                                  decoration: TextDecoration.underline,
                                                  letterSpacing: 0.25,




                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),


                              ]
                          ),
                        ),


                  ),
                  // TODO TERCEIRO
                  Container(
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,
                      // padding: const EdgeInsets.all(16),
                      children: [
                        const SizedBox(
                          height: 52,
                        ),
                        Wrap(
                          alignment: WrapAlignment.spaceAround,
                          spacing: 36,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              color: Color.fromRGBO(252, 252, 255, 1),
                              child: SizedBox(
                                width: 328,
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(26.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Valor do contrato',
                                            minFontSize: 12,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.textoComissao,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          AutoSizeText(
                                            'R\$ 100,00',
                                            minFontSize: 12,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.textoComissao,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Comissão do contrato',
                                            minFontSize: 12,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.salvar,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          AutoSizeText(
                                            'R\$ 500,00',
                                            minFontSize: 12,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.salvar,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              color: Color.fromRGBO(252, 252, 255, 1),
                              child: SizedBox(
                                width: 328,
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(26.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Valor do contrato',
                                            minFontSize: 12,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.textoComissao,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          AutoSizeText(
                                            'R\$ 100,00',
                                            minFontSize: 12,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.textoComissao,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Comissão do contrato',
                                            minFontSize: 12,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.salvar,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          AutoSizeText(
                                            'R\$ 500,00',
                                            minFontSize: 12,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.salvar,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              color: Color.fromRGBO(252, 252, 255, 1),
                              child: SizedBox(
                                width: 328,
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(26.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Valor do contrato',
                                            minFontSize: 12,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.textoComissao,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          AutoSizeText(
                                            'R\$ 100,00',
                                            minFontSize: 12,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.textoComissao,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Comissão do contrato',
                                            minFontSize: 12,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.salvar,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          AutoSizeText(
                                            'R\$ 500,00',
                                            minFontSize: 12,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.salvar,
                                              letterSpacing: 0.5,
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
                        const SizedBox(height: 36),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(child: Container()),
                            Text(
                              'Saldo Total:',
                              textAlign: TextAlign.end,
                              style: GoogleFonts.comfortaa(
                                fontWeight: FontWeight.w500,
                                fontSize: 23,
                                color: AppTheme.confirm,
                              ),
                            ),
                            Text(
                              ' R\$ 100,00',
                              textAlign: TextAlign.end,
                              style: GoogleFonts.comfortaa(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                color: AppTheme.confirm,
                              ),
                            ),
                          ],
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
//                 Text(
//                   'Assinaturas',
//                   textAlign: TextAlign.left,
//                   style: GoogleFonts.comfortaa(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 46,
//                   ),
//                 ),
//                 Expanded(child: Container()),
//               ],
//             ),
//             const Divider(thickness: 2,),
//             const SizedBox(height: 36,),
//             Wrap(
//               alignment: WrapAlignment.center,
//               // direction: Axis.horizontal,
//               spacing: 51,
//               runSpacing: 25,
//               children: <Widget>[
//                 Expanded(
//                   flex: 4,
//                   child: SelecaoDeImagem(nome: 'Plano',
//                     acao: () {
//                       // Get.offAndToNamed(Routes.PLATAFORMA_EMPRESA_PLANO);
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   flex: 4,
//                   child: SelecaoDeImagem(
//                     nome: 'Extras',
//                     acao: () {
//                       // Get.offAndToNamed(Routes.PLATAFORMA_EMPRESA_EXTRA);
//                     },
//                     imagem: Image.asset('assets/images/extras.png'),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 4,
//                   child: SelecaoDeImagem(
//                     nome: 'Comissão',
//                     acao: () {
//                       // Get.offAndToNamed(Routes.PLATAFORMA_EMPRESA_COMISSAO);
//                     },
//                     imagem: Image.asset('assets/images/comissao.png'),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//----------- WIDGETS
  Widget _btnSalvar() {
    return BotaoPadrao(
      corIcone: AppTheme.salvar,
      corTexto: Colors.white,
      texto: 'Salvar',
      icone: Icons.save,
      acao: () {
        //TODO: AÇÃO SALVAR
      },
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

  Widget expandedInformacoesDoPlano() {
    return ExpansionTile(
      collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
      collapsedBackgroundColor: Color(0xFFE9F1FF),
      title: Row(
        children: [
          Text('Informações do plano',
              style: GoogleFonts.comfortaa(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(0, 29, 52, 1),
                letterSpacing: -0.5,
              )),
          SizedBox(
            width: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(229, 255, 229, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99)),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Text(
                'Pagamento em dia',
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color.fromRGBO(22, 156, 52, 1),
                ),
              ),
            ),
          ),
        ],
      ),
      children: [
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Vencimento:',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            letterSpacing: 0.15,
                          ),
                        ),
                        Text(
                          '01/01/2099',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            letterSpacing: 0.5,
                            color: Color.fromRGBO(66, 71, 78, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Valor do contrato: ',
                          // textAlign: TextAlign.right,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            letterSpacing: 0.5,
                            color: Color.fromRGBO(66, 71, 78, 1),
                          ),
                        ),
                        Text(
                          '45,00',
                          // textAlign: TextAlign.right,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            letterSpacing: 0.5,
                            color: Color.fromRGBO(66, 71, 78, 1),
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
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Prorrogação do contrato:',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            letterSpacing: 0.15,
                          ),
                        ),
                        Text(
                          '01/01/2099',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            letterSpacing: 0.5,
                            color: Color.fromRGBO(66, 71, 78, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Desconto: ',
                          // textAlign: TextAlign.right,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            letterSpacing: 0.5,
                            color: Color.fromRGBO(66, 71, 78, 1),
                          ),
                        ),
                        Text(
                          '- 10,00',
                          // textAlign: TextAlign.right,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            letterSpacing: 0.5,
                            color: Color.fromRGBO(186, 26, 26, 1),
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
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormFieldPorcValor(),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Valor Total: ',
                          // textAlign: TextAlign.right,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            letterSpacing: 0.5,
                            color: Color.fromRGBO(66, 71, 78, 1),
                          ),
                        ),
                        Text(
                          'R\$ 10,00',
                          // textAlign: TextAlign.right,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            letterSpacing: 0.5,
                            color: Color.fromRGBO(30, 168, 52, 1),
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
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget expandedInformacoesDePagamento() {
    return ExpansionTile(
      collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
      collapsedBackgroundColor: Color(0xFFE9F1FF),
      title: Row(
        children: [
          Text('Informações de pagamento',
              style: GoogleFonts.comfortaa(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(0, 29, 52, 1),
                letterSpacing: -0.5,
              )),
          SizedBox(
            width: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(255, 248, 214, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99)),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Text(
                'Cobrança Gerada',
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color.fromRGBO(156, 143, 22, 1),
                ),
              ),
            ),
          ),
        ],
      ),
      children: [
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Cobrado no dia:',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            letterSpacing: 0.15,
                          ),
                        ),
                        Text(
                          '01/01/2099',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            letterSpacing: 0.5,
                            color: Color.fromRGBO(66, 71, 78, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            //

                            elevation: 0,
                            backgroundColor: Color.fromRGBO(250, 250, 250, 255),
                            //
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text(
                              textAlign: TextAlign.end,
                              'Alterar cobrança',
                              style: GoogleFonts.sourceSansPro(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(186, 26, 26, 1),
                                letterSpacing: 0.25,
                              ),
                            ),
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
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget expandedPeriodoDeTestes() {
    return ExpansionTile(
      collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
      collapsedBackgroundColor: Color(0xFFE9F1FF),
      title: Text('Período de testes',
          style: GoogleFonts.comfortaa(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 29, 52, 1),
            letterSpacing: -0.5,
          )),
      children: [
        SizedBox(height: 8,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Seu período de testes começou, e vencerá no dia:',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            letterSpacing: 0.15,
                          ),
                        ),
                        Text(
                          '01/01/2099',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            letterSpacing: 0.5,
                            color: Color.fromRGBO(66, 71, 78, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(186, 26, 26, 1),
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
                              'Cancelar período de teste',
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                letterSpacing: 0.25,
                              ),
                            ),
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
        SizedBox(height: 8,),

      ],
    );
  }

  Widget expandedListaLimites() {
    return ExpansionTile(
      collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
      collapsedBackgroundColor: Color(0xFFE9F1FF),
      title: Text('Limites',
          style: GoogleFonts.comfortaa(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 29, 52, 1),
            letterSpacing: -0.5,
          )),
      children: [
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Faturamento/mês',
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
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Cadastro de Produtos',
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
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Contas a receber',
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
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Contas a pagar',
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
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Usuários e conexões simultâneas',
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
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }

  Widget expandedListaFinanceiro() {
    return ExpansionTile(
      collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
      collapsedBackgroundColor: Color(0xFFE9F1FF),
      title: Text('Financeiro',
          style: GoogleFonts.comfortaa(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 29, 52, 1),
            letterSpacing: -0.5,
          )),
      children: [
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Módulo Financeiro',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Controle de boleto bancário',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Controle de cartões',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Controle de DRE/DFC',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Controle de vendas a prazo',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }

  Widget expandedListaFiscal() {
    return ExpansionTile(
      collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
      collapsedBackgroundColor: Color(0xFFE9F1FF),
      title: Text('Fiscal',
          style: GoogleFonts.comfortaa(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 29, 52, 1),
            letterSpacing: -0.5,
          )),
      children: [
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Emissão de NF-e (saída)',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Emissão de NFS-e (serviço)',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Lançamento NF-e (entrada)',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }

  Widget expandedListaEstoque() {
    return ExpansionTile(
      collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
      collapsedBackgroundColor: Color(0xFFE9F1FF),
      title: Text('Estoque',
          style: GoogleFonts.comfortaa(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 29, 52, 1),
            letterSpacing: -0.5,
          )),
      children: [
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Módulo Estoque',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Controle de multiplos locais',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }

  Widget expandedListaProduto() {
    return ExpansionTile(
      collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
      collapsedBackgroundColor: Color(0xFFE9F1FF),
      title: Text('Produto',
          style: GoogleFonts.comfortaa(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 29, 52, 1),
            letterSpacing: -0.5,
          )),
      children: [
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Controle de observações',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Controle de gerador de etiqueta',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Controle de pacotes',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Controle de promoção',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Controle de tabela de preços',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Controle de variações',
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CheckBoxMobile()),
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }


  Widget _btnProrrogarContrato(context) {
    return BotaoPadrao(
      corIcone: AppTheme.adicionar,
      corTexto: Colors.white,
      texto: 'Prorrogar contrato',
      icone: Icons.calendar_today_outlined,
      acao: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              )),
          builder: (context) => Container(
            height: Get.height / 2,
            // height: Get.height / 2,
            // height: 100,
            padding: EdgeInsets.all(16),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Novo Contrato',
                            // textAlign: TextAlign.end,
                            style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w400,
                              fontSize: 33,
                            ),
                          ),

                        ],
                      ),
                      Divider(
                        thickness: 2,
                      ),
                    ],
                  ),
                  // color: Colors.red,
                ),
              ),

              Expanded(
                flex: 8,
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              width: Get.width / 4,
                              height: Get.height / 4,
                              child:

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Insira os dados do novo contrato customizado',
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.sourceSansPro(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      DropDownButtonPadrao(
                                        itensLista: ['plano'],
                                        valorSelecionado: 'Plano',
                                      ),
                                      // Expanded(child: Container()),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      DropDownButtonPadrao(
                                        itensLista: ['plano'],
                                        valorSelecionado: 'Plano',
                                      ),
                                      // Expanded(child: Container()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: Color.fromRGBO(233, 241, 255, 1),
                          child: Container(
                            width: 360,
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(26.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        'Alteração do novo plano',
                                        // textAlign: TextAlign.end,
                                        style: GoogleFonts.comfortaa(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 23,
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Valor debitado do plano R\$58,00',
                                        // minFontSize: 12,
                                        softWrap: true,
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.blackSubtitulo,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Dias acrescentados ao vencimento: 10',
                                        // minFontSize: 12,
                                        softWrap: true,
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.blackSubtitulo,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Valor do novo contrato R\$58,00',
                                        // minFontSize: 12,
                                        softWrap: true,
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.blackSubtitulo,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    // runSpacing: 16,
                    // alignment: WrapAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
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
              ),
            ]),
          ),
        );

        //TODO: AÇÃO SALVAR
      },
    );
  }

















  Widget _btnNovoContrato(context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.corBranco,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: Color.fromRGBO(255, 87, 34, 1),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      ),
      icon: Icon(
        Icons.add,
        color: Color.fromRGBO(255, 87, 34, 1),
        size: AppTheme.h4,
      ),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              )),
          builder: (context) => Container(
            // height: Get.height / 2,
            padding: EdgeInsets.all(16),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 34, top: 28),
                      child: Text(
                        'Novo Contrato',
                        // textAlign: TextAlign.end,
                        style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w400,
                          fontSize: 33,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 12,
                  runSpacing: 16,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue,


                          backgroundColor: Color.fromRGBO(255, 237, 232, 1),


                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: Color.fromRGBO(215, 81, 0, 1),
                            ),

                          ),

                        ),
                        onPressed: () {},
                        child:

                        Container(
                          width: 340,
                          height: 180,
                          child: Padding(
                            padding: const EdgeInsets.all(26.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      'Contrato Customizado',
                                      // textAlign: TextAlign.end,
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Expanded(
                                  child: Text(
                                    'Dados do contrato são negociados diferente com o integrador,'
                                        ' esse tipo de contrato não fica disponível para compra pelos '
                                        'usuários',
                                    // minFontSize: 12,
                                    softWrap: true,
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.blackSubtitulo,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue,


                          backgroundColor: Color.fromRGBO(255, 237, 232, 1),


                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: Color.fromRGBO(215, 81, 0, 1),
                            ),

                          ),

                        ),
                        onPressed: () {},
                        child:

                        Container(
                          width: 340,
                          height: 180,
                          child: Padding(
                            padding: const EdgeInsets.all(26.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      'Contrato Convencional',
                                      // textAlign: TextAlign.end,
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                        color: Color.fromRGBO(23, 28, 34, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Expanded(
                                  child: Text(
                                    'Dados do contrato são personalizados pelo usuários(Plano e Contratos Extras),'
                                        ' esse tipo de contrato fica disponível para compra pelos '
                                        'usuários',
                                    // minFontSize: 12,
                                    softWrap: true,
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.blackSubtitulo,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ]),
          ),
        );
      },
      label: Text(
        'Novo Contrato',
        style: GoogleFonts.sourceSansPro(
            fontSize: AppTheme.h4,
            color: Color.fromRGBO(255, 87, 34, 1)),
      ),
    );
  }
}
