import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_theme.dart';
import '../../../widgets/botao_padrao.dart';
import '../../../widgets/chebox_mobile.dart';
import '../../../widgets/responsive.dart';

class ComissaoPage extends StatelessWidget {
  const ComissaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: Container(
          color: Colors.amber,
        ),
        desktop: ListView(padding: const EdgeInsets.all(16), children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Assinaturas',
                textAlign: TextAlign.left,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w400,
                  fontSize: 46,
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 36,
          ),
          Row(
            children: [
              Text(
                'Comissão',
                textAlign: TextAlign.left,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                  letterSpacing: 0.15,
                ),
              ),
              Expanded(child: Container()),
              _btnProrrogarContrato(),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton.icon(
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
                onPressed: () {},
                label: Text(
                  'Novo Contrato',
                  style: GoogleFonts.sourceSansPro(
                      fontSize: AppTheme.h4,
                      color: Color.fromRGBO(255, 87, 34, 1)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 72),

          Wrap(
            alignment: WrapAlignment.spaceAround,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Color.fromRGBO(252, 252, 255, 1),
                child: SizedBox(
                  width: Get.width / 4,
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
                  width: Get.width / 4,
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
                  width: Get.width / 4,
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

          const Divider(
            thickness: 2,
          ),

          // Row(
          //     mainAxisSize: MainAxisSize.min,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Card(
          //         elevation: 2,
          //         child: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           crossAxisAlignment: CrossAxisAlignment.stretch,
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             Wrap(
          //               // runAlignment: WrapAlignment.spaceBetween,
          //               crossAxisAlignment: WrapCrossAlignment.center,
          //               alignment: WrapAlignment.spaceBetween,
          //               children: <Widget>[
          //                 Text(
          //                   'agpraa',
          //                   style: const TextStyle(fontSize: 18),
          //                 ),
          //
          //               ],
          //             ),
          //           ],
          //         ),
          //       )
          //     ]
          // ),

          //   Row(
          //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Expanded(
          //         child: Container(
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               Row(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     AutoSizeText(
          //                       'Valor do  asda  contrato',
          //                       minFontSize: 12,
          //                       style: GoogleFonts.sourceSansPro(
          //                         fontSize: 17,
          //                         fontWeight: FontWeight.w400,
          //                         color: AppTheme.salvar,
          //                         letterSpacing: 0.5,
          //                       ),
          //                     ),
          //                     const SizedBox(width: 16,),
          //                     AutoSizeText(
          //                       'R\$ 100,00',
          //                       minFontSize: 12,
          //                       style: GoogleFonts.sourceSansPro(
          //                         fontSize: 17,
          //                         fontWeight: FontWeight.w400,
          //                         color: AppTheme.salvar,
          //                         letterSpacing: 0.5,
          //                       ),
          //                     ),
          //                   ]
          //               ),
          //               Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   AutoSizeText(
          //                     'Comissão do contrato',
          //                     minFontSize: 12,
          //                     style: GoogleFonts.sourceSansPro(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.w400,
          //                       color: AppTheme.salvar,
          //                       letterSpacing: 0.5,
          //                     ),
          //                   ),
          //                   const SizedBox(width: 16,),
          //                   AutoSizeText(
          //                     'R\$ 100,00',
          //                     minFontSize: 12,
          //                     style: GoogleFonts.sourceSansPro(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.w400,
          //                       color: AppTheme.salvar,
          //                       letterSpacing: 0.5,
          //                     ),
          //                   ),
          // ]
          //                   ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   AutoSizeText(
          //                     'Valor do contrato',
          //                     textAlign: TextAlign.left,
          //                     minFontSize: 12,
          //                     style: GoogleFonts.sourceSansPro(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.w400,
          //                       color: AppTheme.textoComissao,
          //                       letterSpacing: 0.5,
          //                     ),
          //                   ),
          //                   const SizedBox(width: 16,),
          //                   AutoSizeText(
          //                     'R\$ 100,00',
          //                     minFontSize: 12,
          //                     style: GoogleFonts.sourceSansPro(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.w400,
          //                       color: AppTheme.textoComissao,
          //                       letterSpacing: 0.5,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     AutoSizeText(
          //                       'Comissão do contrato',
          //                       minFontSize: 12,
          //                       style: GoogleFonts.sourceSansPro(
          //                         fontSize: 17,
          //                         fontWeight: FontWeight.w400,
          //                         color: AppTheme.salvar,
          //                         letterSpacing: 0.5,
          //                       ),
          //                     ),
          //                     const SizedBox(width: 16,),
          //                     AutoSizeText(
          //                       'R\$ 100,00',
          //                       minFontSize: 12,
          //                       style: GoogleFonts.sourceSansPro(
          //                         fontSize: 17,
          //                         fontWeight: FontWeight.w400,
          //                         color: AppTheme.salvar,
          //                         letterSpacing: 0.5,
          //                       ),
          //                     ),
          //                   ]
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   AutoSizeText(
          //                     'Valor do contrato',
          //                     textAlign: TextAlign.left,
          //                     minFontSize: 12,
          //                     style: GoogleFonts.sourceSansPro(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.w400,
          //                       color: AppTheme.textoComissao,
          //                       letterSpacing: 0.5,
          //                     ),
          //                   ),
          //                   const SizedBox(width: 16,),
          //                   AutoSizeText(
          //                     'R\$ 100,00',
          //                     minFontSize: 12,
          //                     style: GoogleFonts.sourceSansPro(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.w400,
          //                       color: AppTheme.textoComissao,
          //                       letterSpacing: 0.5,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     AutoSizeText(
          //                       'Comissão do contrato',
          //                       minFontSize: 12,
          //                       style: GoogleFonts.sourceSansPro(
          //                         fontSize: 17,
          //                         fontWeight: FontWeight.w400,
          //                         color: AppTheme.salvar,
          //                         letterSpacing: 0.5,
          //                       ),
          //                     ),
          //                     const SizedBox(width: 16,),
          //                     AutoSizeText(
          //                       'R\$ 100,00',
          //                       minFontSize: 12,
          //                       style: GoogleFonts.sourceSansPro(
          //                         fontSize: 17,
          //                         fontWeight: FontWeight.w400,
          //                         color: AppTheme.salvar,
          //                         letterSpacing: 0.5,
          //                       ),
          //                     ),
          //                   ]
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   AutoSizeText(
          //                     'Valor do contrato',
          //                     textAlign: TextAlign.left,
          //                     minFontSize: 12,
          //                     style: GoogleFonts.sourceSansPro(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.w400,
          //                       color: AppTheme.textoComissao,
          //                       letterSpacing: 0.5,
          //                     ),
          //                   ),
          //                   const SizedBox(width: 16,),
          //                   AutoSizeText(
          //                     'R\$ 100,00',
          //                     minFontSize: 12,
          //                     style: GoogleFonts.sourceSansPro(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.w400,
          //                       color: AppTheme.textoComissao,
          //                       letterSpacing: 0.5,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     AutoSizeText(
          //                       'Comissão do contrato',
          //                       minFontSize: 12,
          //                       style: GoogleFonts.sourceSansPro(
          //                         fontSize: 17,
          //                         fontWeight: FontWeight.w400,
          //                         color: AppTheme.salvar,
          //                         letterSpacing: 0.5,
          //                       ),
          //                     ),
          //                     const SizedBox(width: 16,),
          //                     AutoSizeText(
          //                       'R\$ 100,00',
          //                       minFontSize: 12,
          //                       style: GoogleFonts.sourceSansPro(
          //                         fontSize: 17,
          //                         fontWeight: FontWeight.w400,
          //                         color: AppTheme.salvar,
          //                         letterSpacing: 0.5,
          //                       ),
          //                     ),
          //                   ]
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //
          //
          //
          //
          //     ],
          //   ),
        ]),
      ),
    );
  }
}

Widget _btnProrrogarContrato() {
  return BotaoPadrao(
    corIcone: AppTheme.adicionar,
    corTexto: Colors.white,
    texto: 'Prorrogar contrato',
    icone: Icons.calendar_today_outlined,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}
