import 'package:erp/config/application.dart';
import 'package:erp/pages/plataforma/empresas/plataforma_empresa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:erp/pages/plataforma/plataforma_page_controller.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/botao_padrao.dart';
import '../../../widgets/card_preco.dart';
import '../../../widgets/chebox_mobile.dart';
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
                          'ERP',
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
                          'Waychef',
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
                          'Valores',
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
                          ],
                        ),
                        const SizedBox(
                          height: 52,
                        ),
                        CardPreco(
                          elevated: false,
                          menorCallback: () {},
                          maiorCallback: () {},
                          preco: 6.00,
                          quantidade: 1,
                          labelAdicional: 'Sessão Adicional',
                          label: 'Sessão',
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
                                  'Safira',
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 33,
                                    letterSpacing: -0.5,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(13, 13, 13, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 52,
                        ),
                        ExpansionTile(
                          collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
                          collapsedBackgroundColor: Color(0xFFE9F1FF),
                          title: Text('Módulos de vendas',
                              style: GoogleFonts.comfortaa(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 29, 52, 1),
                                letterSpacing: -0.5,
                              )),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: TextoPlataformaExtras(
                                              texto: 'AUTOATENDIMENTO',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child:
                                                Center(child: CheckBoxMobile()),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: TextoPlataformaExtras(
                                              texto: 'Balcão',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child:
                                                Center(child: CheckBoxMobile()),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: TextoPlataformaExtras(
                                              texto: 'Mesa',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child:
                                                Center(child: CheckBoxMobile()),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ExpansionTile(
                          collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
                          collapsedBackgroundColor: Color(0xFFE9F1FF),
                          title: Text('Serviços/ aplicações',
                              style: GoogleFonts.comfortaa(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 29, 52, 1),
                                letterSpacing: -0.5,
                              )),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: TextoPlataformaExtras(
                                              texto: 'Serviço impressão',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child:
                                                Center(child: CheckBoxMobile()),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: TextoPlataformaExtras(
                                              texto: 'Waychef Desktop',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child:
                                                Center(child: CheckBoxMobile()),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: TextoPlataformaExtras(
                                              texto: 'Waychef Mobile',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child:
                                                Center(child: CheckBoxMobile()),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        // Container(
                        //   child: Row(children: [
                        //     Expanded(child: Container()),
                        //     _btnProximo(),
                        //   ]),
                        // ),
                      ],
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
                            SizedBox(
                              height: 16,
                            ),
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
                        Row(
                          children: [
                            Text(
                              'Integradores',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.comfortaa(
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                letterSpacing: 0.15,
                              ),
                            ),
                            Expanded(child: Container()),
                            // _btnProrrogarContrato(),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          // direction: Axis.horizontal,
                          spacing: 51,
                          runSpacing: 25,
                          children: <Widget>[
                            Card(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                      color: Color(0xFFFF5722),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.end,
                                      'Lorem Ipsum é simplesmente',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFF5722),
                                        letterSpacing: 0.25,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.close,
                                        color: Color(0xFFFF5722),
                                        size: 16,
                                      ),
                                      // icon: Icon(Icons.close)
                                    ),
                                  ],
                                ),
                              ),

                              // child: ElevatedButton(
                              //    onPressed: (){
                              //     print("You pressed Icon Elevated Button");
                              //   },
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       Text('Lorem Ipsum is simply dummy text of '),
                              //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                              //     ],
                              //   )
                              //
                              //   ),
                            ),
                            Card(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                      color: Color(0xFFFF5722),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.end,
                                      'Lorem Ipsum é simplesmente',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFF5722),
                                        letterSpacing: 0.25,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.close,
                                        color: Color(0xFFFF5722),
                                        size: 16,
                                      ),
                                      // icon: Icon(Icons.close)
                                    ),
                                  ],
                                ),
                              ),

                              // child: ElevatedButton(
                              //    onPressed: (){
                              //     print("You pressed Icon Elevated Button");
                              //   },
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       Text('Lorem Ipsum is simply dummy text of '),
                              //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                              //     ],
                              //   )
                              //
                              //   ),
                            ),
                            Card(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                      color: Color(0xFFFF5722),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.end,
                                      'Lorem Ipsum é simplesmente',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFF5722),
                                        letterSpacing: 0.25,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.close,
                                        color: Color(0xFFFF5722),
                                        size: 16,
                                      ),
                                      // icon: Icon(Icons.close)
                                    ),
                                  ],
                                ),
                              ),

                              // child: ElevatedButton(
                              //    onPressed: (){
                              //     print("You pressed Icon Elevated Button");
                              //   },
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       Text('Lorem Ipsum is simply dummy text of '),
                              //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                              //     ],
                              //   )
                              //
                              //   ),
                            ),
                            Card(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                      color: Color(0xFFFF5722),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.end,
                                      'Lorem Ipsum é simplesmente',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFF5722),
                                        letterSpacing: 0.25,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.close,
                                        color: Color(0xFFFF5722),
                                        size: 16,
                                      ),
                                      // icon: Icon(Icons.close)
                                    ),
                                  ],
                                ),
                              ),

                              // child: ElevatedButton(
                              //    onPressed: (){
                              //     print("You pressed Icon Elevated Button");
                              //   },
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       Text('Lorem Ipsum is simply dummy text of '),
                              //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                              //     ],
                              //   )
                              //
                              //   ),
                            ),
                            Card(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                      color: Color(0xFFFF5722),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.end,
                                      'Lorem Ipsum é simplesmente',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFF5722),
                                        letterSpacing: 0.25,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.close,
                                        color: Color(0xFFFF5722),
                                        size: 16,
                                      ),
                                      // icon: Icon(Icons.close)
                                    ),
                                  ],
                                ),
                              ),

                              // child: ElevatedButton(
                              //    onPressed: (){
                              //     print("You pressed Icon Elevated Button");
                              //   },
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       Text('Lorem Ipsum is simply dummy text of '),
                              //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                              //     ],
                              //   )
                              //
                              //   ),
                            ),
                            Card(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                      color: Color(0xFFFF5722),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.end,
                                      'Lorem Ipsum é simplesmente',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFF5722),
                                        letterSpacing: 0.25,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.close,
                                        color: Color(0xFFFF5722),
                                        size: 16,
                                      ),
                                      // icon: Icon(Icons.close)
                                    ),
                                  ],
                                ),
                              ),

                              // child: ElevatedButton(
                              //    onPressed: (){
                              //     print("You pressed Icon Elevated Button");
                              //   },
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       Text('Lorem Ipsum is simply dummy text of '),
                              //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                              //     ],
                              //   )
                              //
                              //   ),
                            ),
                            Card(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                      color: Color(0xFFFF5722),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.end,
                                      'Lorem Ipsum é simplesmente',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFF5722),
                                        letterSpacing: 0.25,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.close,
                                        color: Color(0xFFFF5722),
                                        size: 16,
                                      ),
                                      // icon: Icon(Icons.close)
                                    ),
                                  ],
                                ),
                              ),

                              // child: ElevatedButton(
                              //    onPressed: (){
                              //     print("You pressed Icon Elevated Button");
                              //   },
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       Text('Lorem Ipsum is simply dummy text of '),
                              //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                              //     ],
                              //   )
                              //
                              //   ),
                            ),
                            Card(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(
                                      color: Color(0xFFFF5722),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.end,
                                      'Lorem Ipsum é simplesmente',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFF5722),
                                        letterSpacing: 0.25,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.close,
                                        color: Color(0xFFFF5722),
                                        size: 16,
                                      ),
                                      // icon: Icon(Icons.close)
                                    ),
                                  ],
                                ),
                              ),

                              // child: ElevatedButton(
                              //    onPressed: (){
                              //     print("You pressed Icon Elevated Button");
                              //   },
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       Text('Lorem Ipsum is simply dummy text of '),
                              //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                              //     ],
                              //   )
                              //
                              //   ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        Container(
                          child: Row(children: [
                            Expanded(child: Container()),
                            BotaoPadrao(
                              corIcone: AppTheme.salvar,
                              corTexto: Colors.white,
                              texto: 'Finalizar',
                              // icone: Icons.save,
                              acao: () {
                                //TODO: AÇÃO SALVAR
                              },
                            ),
                          ]),
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
}
