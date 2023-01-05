import 'package:auto_size_text/auto_size_text.dart';
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
import 'editar_contato_integrador_controller.dart';

class EditarContratoIntegradorErpPage
    extends GetView<EditarContratoIntegradorErpController> {
// class EditarContratoErpPage extends StatelessWidget {
  const EditarContratoIntegradorErpPage({Key? key}) : super(key: key);

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
                    'Edição de contrato padrão',
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
                        expandedListaLimites(),
                        expandedListaFinanceiro(),
                        expandedListaFiscal(),
                        expandedListaEstoque(),
                        expandedListaProduto(),
                        expandedListaValores(),
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
                        // Row(
                        //   children: [
                        //     Container(
                        //       child: RadioListTile(
                        //         value: "Nao possui",
                        //         groupValue: Get
                        //             .find<
                        //             EditarContratoIntegradorErpController>()
                        //             .selectedValue,
                        //         title: Text(
                        //           "Nao possui",
                        //           overflow: TextOverflow
                        //               .ellipsis,
                        //           style: GoogleFonts
                        //               .sourceSansPro(
                        //             fontSize: 15,
                        //             fontWeight:
                        //             FontWeight.w400,
                        //             letterSpacing: 0.25,
                        //           ),
                        //         ),
                        //         onChanged: (newValue) {
                        //           Get.find<
                        //               EditarContratoIntegradorErpController>()
                        //               .updateSelectedValue(
                        //               newValue
                        //                   .toString());
                        //         },
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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
                      alignment: Alignment.centerLeft, child: CheckBoxMobile()),
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

Widget expandedListaValores() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Valores',
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

