import 'package:auto_size_text/auto_size_text.dart';
import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_change/status_change.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'stepper.dart';
import '../../../../theme/app_theme.dart';
import '../../../../widgets/utils/botoes/botao_padrao.dart';
import '../../../../widgets/botao_proximo.dart';
import '../../../../widgets/card_preco.dart';
import '../../../../widgets/responsive.dart';
import 'contrato_customizado_controller.dart';
import 'contrato_customizado_segundo_page.dart';

class ContratoCustomizadoPage extends GetView<ContratoCustomizadoController> {
// class ContratoCustomizadoPage extends StatelessWidget {
  const ContratoCustomizadoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//------------ VARIAVEIS------------
//     Size _size = MediaQuery
//         .of(context)
//         .size;
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
              height: 36,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Digite o nome do plano',
                textAlign: TextAlign.left,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                  decorationThickness: 2,
                ),
              ),
            ),

            const SizedBox(
              height: 36,
            ),
            CardPreco(
              elevated: false,
              menorCallback: () {},
              maiorCallback: () {},
              preco: 6.00,
              quantidade: 1,
              labelAdicional: 'Sessões Adicional',
              label: 'Sessão',
            ),
            const SizedBox(
              height: 8,
            ),
            expandedListaLimitesCustomizado(),
            expandedListaFinanceiroCustomizado(),
            expandedListaFiscalCustomizado(),
            expandedListaEstoqueCustomizado(),
            expandedListaProdutoCustomizado(),
            // expandedListaValoresCustomizado(),
            const SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Container()),
                Container(
                  child: BotaoPadraoProximo(
                    corTexto: Colors.white,
                    texto: 'Próximo',
                    acao: () {
                      Get.to(ContratoCustomizadoSegundoPage());
                    },
                  ),
                ),
              ],
            ),


            //
          ],
        ),
      ),
    );

  }

  // List<Step> getSteps() => [
  //       Step(
  //           title: Text(''),
  //           content: Container(
  //             child: Column(
  //               children: [
  //                 const SizedBox(
  //                   height: 36,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     Text(
  //                       'Digite o nome do plano',
  //                       textAlign: TextAlign.left,
  //                       style: GoogleFonts.comfortaa(
  //                         fontWeight: FontWeight.w400,
  //                         fontSize: 46,
  //                       ),
  //                     ),
  //                     Expanded(child: Container()),
  //                   ],
  //                 ),
  //                 const Divider(
  //                   thickness: 2,
  //                 ),
  //                 const SizedBox(
  //                   height: 36,
  //                 ),
  //                 CardPreco(
  //                   elevated: false,
  //                   menorCallback: () {},
  //                   maiorCallback: () {},
  //                   preco: 6.00,
  //                   quantidade: 1,
  //                   labelAdicional: 'Sessões Adicional',
  //                   label: 'Sessão',
  //                 ),
  //                 const SizedBox(
  //                   height: 8,
  //                 ),
  //                 expandedListaLimitesCustomizado(),
  //                 expandedListaFinanceiroCustomizado(),
  //                 expandedListaFiscalCustomizado(),
  //                 expandedListaEstoqueCustomizado(),
  //                 expandedListaProdutoCustomizado(),
  //                 expandedListaValoresCustomizado(),
  //                 const SizedBox(
  //                   height: 36,
  //                 ),
  //                 // Row(
  //                 //   mainAxisAlignment: MainAxisAlignment.center,
  //                 //   children: [
  //                 //     _btnProximo(),
  //                 //   ],
  //                 // ),
  //               ],
  //             ),
  //
  //             // height: 100,
  //             // width: 200,
  //             // color: Colors.red,
  //           ),
  //           isActive: controller.contadorStep.value >= 0,
  //           state: controller.contadorStep.value > 0
  //               ? StepState.complete
  //               : StepState.indexed),
  //
  //       // Step(
  //       //     title: Text(''),
  //       //     content: Container(
  //       //       child: Column(
  //       //         children: [
  //       //           const SizedBox(
  //       //             height: 36,
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.end,
  //       //             children: [
  //       //               Text(
  //       //                 'Digite o nome do plano',
  //       //                 textAlign: TextAlign.left,
  //       //                 style: GoogleFonts.comfortaa(
  //       //                   fontWeight: FontWeight.w400,
  //       //                   fontSize: 46,
  //       //                 ),
  //       //               ),
  //       //               Expanded(child: Container()),
  //       //             ],
  //       //           ),
  //       //           const Divider(
  //       //             thickness: 2,
  //       //           ),
  //       //           const SizedBox(
  //       //             height: 36,
  //       //           ),
  //       //           const SizedBox(
  //       //             height: 36,
  //       //           ),
  //       //           Row(
  //       //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   padding: EdgeInsets.fromLTRB(8, 32, 8, 32),
  //       //                   color: Color(0xFFE9F1FF),
  //       //                   child: Text(
  //       //                     'Extras',
  //       //                     style: GoogleFonts.comfortaa(
  //       //                       fontWeight: FontWeight.w700,
  //       //                       fontSize: 23,
  //       //                       letterSpacing: -0.5,
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //             ],
  //       //           ),
  //       //           const SizedBox(
  //       //             height: 28,
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'Aplicativo - AUTOPESAGEM',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'Aplicativo - WAYWALLET',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'Aplicativo XML Venda',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'Concentrador',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'Dashboard WEB',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'Emissores Fiscais',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'Integração - Catraca',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'Integração - Everest',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'Integração - TrackApp',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'Integração - WayMenu',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'Sessão Extra',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'Suporte Premium - Telefone',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'TEF - Cielo',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'TEF - Elgin Pay',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'TEF - PayGo',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'TEF - REDE',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //           Row(
  //       //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //             children: [
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: EdgeInsets.all(14.0),
  //       //                     child: Text(
  //       //                       'TEF - SiTef',
  //       //                       textAlign: TextAlign.left,
  //       //                       style: GoogleFonts.comfortaa(
  //       //                         fontWeight: FontWeight.w500,
  //       //                         fontSize: 19,
  //       //                         letterSpacing: 0.15,
  //       //                       ),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               Expanded(
  //       //                 child: Container(
  //       //                   child: Padding(
  //       //                     padding: const EdgeInsets.all(16.0),
  //       //                     child: Align(
  //       //                         alignment: Alignment.centerLeft,
  //       //                         child: CheckBoxMobile()),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //               const SizedBox(width: 12),
  //       //             ],
  //       //           ),
  //       //
  //       //         ],
  //       //       ),
  //       //     ),
  //       //     isActive: controller.contadorStep.value >= 1,
  //       //     state: controller.contadorStep.value > 1
  //       //         ? StepState.complete
  //       //         : StepState.indexed),
  //       //
  //       // Step(
  //       //   title: Text(''),
  //       //   content: Container(
  //       //     child: Column(
  //       //       children: [
  //       //         Row(
  //       //           mainAxisAlignment: MainAxisAlignment.end,
  //       //           children: [
  //       //             Text(
  //       //               'Plano Diamante',
  //       //               textAlign: TextAlign.left,
  //       //               style: GoogleFonts.comfortaa(
  //       //                 fontWeight: FontWeight.w400,
  //       //                 fontSize: 46,
  //       //               ),
  //       //             ),
  //       //             Expanded(child: Container()),
  //       //           ],
  //       //         ),
  //       //         const Divider(
  //       //           thickness: 2,
  //       //         ),
  //       //         const SizedBox(
  //       //           height: 36,
  //       //         ),
  //       //         Row(
  //       //           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //           children: [
  //       //             Expanded(
  //       //               child: Container(
  //       //                 padding: EdgeInsets.fromLTRB(8, 32, 8, 32),
  //       //                 color: Color(0xFFE9F1FF),
  //       //                 child: Text(
  //       //                   'Valores',
  //       //                   style: GoogleFonts.comfortaa(
  //       //                     fontWeight: FontWeight.w700,
  //       //                     fontSize: 23,
  //       //                     letterSpacing: -0.5,
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //             ),
  //       //           ],
  //       //         ),
  //       //         const SizedBox(
  //       //           height: 28,
  //       //         ),
  //       //         Row(
  //       //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //           children: [
  //       //             Expanded(
  //       //               child: Container(
  //       //                 child: Padding(
  //       //                   padding: EdgeInsets.all(14.0),
  //       //                   child: Text(
  //       //                     'Valor mensal',
  //       //                     textAlign: TextAlign.left,
  //       //                     style: GoogleFonts.comfortaa(
  //       //                       fontWeight: FontWeight.w500,
  //       //                       fontSize: 19,
  //       //                       letterSpacing: 0.15,
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //               ),
  //       //             ),
  //       //             Expanded(
  //       //               child: Container(
  //       //                 child: Padding(
  //       //                   padding: const EdgeInsets.all(16.0),
  //       //                   child: Align(
  //       //                       alignment: Alignment.centerLeft,
  //       //                       child: Text(
  //       //                         'R\$ 45.90',
  //       //                         style: GoogleFonts.sourceSansPro(
  //       //                           fontWeight: FontWeight.w400,
  //       //                           fontSize: 20,
  //       //                           color: Color(0xFF0D0D0D),
  //       //                         ),
  //       //                       )),
  //       //                 ),
  //       //               ),
  //       //             ),
  //       //             const SizedBox(width: 12),
  //       //           ],
  //       //         ),
  //       //         const SizedBox(
  //       //           height: 36,
  //       //         ),
  //       //         Row(
  //       //           children: [
  //       //             Text(
  //       //               'Empresas',
  //       //               textAlign: TextAlign.left,
  //       //               style: GoogleFonts.comfortaa(
  //       //                 fontWeight: FontWeight.w500,
  //       //                 fontSize: 28,
  //       //                 letterSpacing: 0.15,
  //       //               ),
  //       //             ),
  //       //             Expanded(child: Container()),
  //       //             // _btnProrrogarContrato(),
  //       //             const SizedBox(
  //       //               width: 8,
  //       //             ),
  //       //           ],
  //       //         ),
  //       //         const SizedBox(
  //       //           height: 36,
  //       //         ),
  //       //         const SizedBox(
  //       //           height: 36,
  //       //         ),
  //       //         Wrap(
  //       //           alignment: WrapAlignment.center,
  //       //           // direction: Axis.horizontal,
  //       //           spacing: 51,
  //       //           runSpacing: 25,
  //       //           children: <Widget>[
  //       //             Card(
  //       //               child: ElevatedButton(
  //       //                 onPressed: () {},
  //       //                 style: ElevatedButton.styleFrom(
  //       //                   backgroundColor: Colors.white,
  //       //                   shape: RoundedRectangleBorder(
  //       //                     borderRadius: BorderRadius.circular(16),
  //       //                     side: BorderSide(
  //       //                       color: Color(0xFFFF5722),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //                 child: Row(
  //       //                   mainAxisSize: MainAxisSize.min,
  //       //                   children: [
  //       //                     Text(
  //       //                       textAlign: TextAlign.end,
  //       //                       'Lorem Ipsum é simplesmente',
  //       //                       style: GoogleFonts.sourceSansPro(
  //       //                         fontSize: 20,
  //       //                         fontWeight: FontWeight.w600,
  //       //                         color: Color(0xFFFF5722),
  //       //                         letterSpacing: 0.25,
  //       //                       ),
  //       //                     ),
  //       //                     IconButton(
  //       //                       onPressed: () {},
  //       //                       icon: Icon(
  //       //                         Icons.close,
  //       //                         color: Color(0xFFFF5722),
  //       //                         size: 16,
  //       //                       ),
  //       //                       // icon: Icon(Icons.close)
  //       //                     ),
  //       //                   ],
  //       //                 ),
  //       //               ),
  //       //
  //       //               // child: ElevatedButton(
  //       //               //    onPressed: (){
  //       //               //     print("You pressed Icon Elevated Button");
  //       //               //   },
  //       //               //   child: Row(
  //       //               //     mainAxisSize: MainAxisSize.min,
  //       //               //     children: [
  //       //               //       Text('Lorem Ipsum is simply dummy text of '),
  //       //               //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
  //       //               //     ],
  //       //               //   )
  //       //               //
  //       //               //   ),
  //       //             ),
  //       //             Card(
  //       //               child: ElevatedButton(
  //       //                 onPressed: () {},
  //       //                 style: ElevatedButton.styleFrom(
  //       //                   backgroundColor: Colors.white,
  //       //                   shape: RoundedRectangleBorder(
  //       //                     borderRadius: BorderRadius.circular(16),
  //       //                     side: BorderSide(
  //       //                       color: Color(0xFFFF5722),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //                 child: Row(
  //       //                   mainAxisSize: MainAxisSize.min,
  //       //                   children: [
  //       //                     Text(
  //       //                       textAlign: TextAlign.end,
  //       //                       'Lorem Ipsum é simplesmente',
  //       //                       style: GoogleFonts.sourceSansPro(
  //       //                         fontSize: 20,
  //       //                         fontWeight: FontWeight.w600,
  //       //                         color: Color(0xFFFF5722),
  //       //                         letterSpacing: 0.25,
  //       //                       ),
  //       //                     ),
  //       //                     IconButton(
  //       //                       onPressed: () {},
  //       //                       icon: Icon(
  //       //                         Icons.close,
  //       //                         color: Color(0xFFFF5722),
  //       //                         size: 16,
  //       //                       ),
  //       //                       // icon: Icon(Icons.close)
  //       //                     ),
  //       //                   ],
  //       //                 ),
  //       //               ),
  //       //
  //       //               // child: ElevatedButton(
  //       //               //    onPressed: (){
  //       //               //     print("You pressed Icon Elevated Button");
  //       //               //   },
  //       //               //   child: Row(
  //       //               //     mainAxisSize: MainAxisSize.min,
  //       //               //     children: [
  //       //               //       Text('Lorem Ipsum is simply dummy text of '),
  //       //               //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
  //       //               //     ],
  //       //               //   )
  //       //               //
  //       //               //   ),
  //       //             ),
  //       //             Card(
  //       //               child: ElevatedButton(
  //       //                 onPressed: () {},
  //       //                 style: ElevatedButton.styleFrom(
  //       //                   backgroundColor: Colors.white,
  //       //                   shape: RoundedRectangleBorder(
  //       //                     borderRadius: BorderRadius.circular(16),
  //       //                     side: BorderSide(
  //       //                       color: Color(0xFFFF5722),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //                 child: Row(
  //       //                   mainAxisSize: MainAxisSize.min,
  //       //                   children: [
  //       //                     Text(
  //       //                       textAlign: TextAlign.end,
  //       //                       'Lorem Ipsum é simplesmente',
  //       //                       style: GoogleFonts.sourceSansPro(
  //       //                         fontSize: 20,
  //       //                         fontWeight: FontWeight.w600,
  //       //                         color: Color(0xFFFF5722),
  //       //                         letterSpacing: 0.25,
  //       //                       ),
  //       //                     ),
  //       //                     IconButton(
  //       //                       onPressed: () {},
  //       //                       icon: Icon(
  //       //                         Icons.close,
  //       //                         color: Color(0xFFFF5722),
  //       //                         size: 16,
  //       //                       ),
  //       //                       // icon: Icon(Icons.close)
  //       //                     ),
  //       //                   ],
  //       //                 ),
  //       //               ),
  //       //
  //       //               // child: ElevatedButton(
  //       //               //    onPressed: (){
  //       //               //     print("You pressed Icon Elevated Button");
  //       //               //   },
  //       //               //   child: Row(
  //       //               //     mainAxisSize: MainAxisSize.min,
  //       //               //     children: [
  //       //               //       Text('Lorem Ipsum is simply dummy text of '),
  //       //               //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
  //       //               //     ],
  //       //               //   )
  //       //               //
  //       //               //   ),
  //       //             ),
  //       //             Card(
  //       //               child: ElevatedButton(
  //       //                 onPressed: () {},
  //       //                 style: ElevatedButton.styleFrom(
  //       //                   backgroundColor: Colors.white,
  //       //                   shape: RoundedRectangleBorder(
  //       //                     borderRadius: BorderRadius.circular(16),
  //       //                     side: BorderSide(
  //       //                       color: Color(0xFFFF5722),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //                 child: Row(
  //       //                   mainAxisSize: MainAxisSize.min,
  //       //                   children: [
  //       //                     Text(
  //       //                       textAlign: TextAlign.end,
  //       //                       'Lorem Ipsum é simplesmente',
  //       //                       style: GoogleFonts.sourceSansPro(
  //       //                         fontSize: 20,
  //       //                         fontWeight: FontWeight.w600,
  //       //                         color: Color(0xFFFF5722),
  //       //                         letterSpacing: 0.25,
  //       //                       ),
  //       //                     ),
  //       //                     IconButton(
  //       //                       onPressed: () {},
  //       //                       icon: Icon(
  //       //                         Icons.close,
  //       //                         color: Color(0xFFFF5722),
  //       //                         size: 16,
  //       //                       ),
  //       //                       // icon: Icon(Icons.close)
  //       //                     ),
  //       //                   ],
  //       //                 ),
  //       //               ),
  //       //
  //       //               // child: ElevatedButton(
  //       //               //    onPressed: (){
  //       //               //     print("You pressed Icon Elevated Button");
  //       //               //   },
  //       //               //   child: Row(
  //       //               //     mainAxisSize: MainAxisSize.min,
  //       //               //     children: [
  //       //               //       Text('Lorem Ipsum is simply dummy text of '),
  //       //               //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
  //       //               //     ],
  //       //               //   )
  //       //               //
  //       //               //   ),
  //       //             ),
  //       //             Card(
  //       //               child: ElevatedButton(
  //       //                 onPressed: () {},
  //       //                 style: ElevatedButton.styleFrom(
  //       //                   backgroundColor: Colors.white,
  //       //                   shape: RoundedRectangleBorder(
  //       //                     borderRadius: BorderRadius.circular(16),
  //       //                     side: BorderSide(
  //       //                       color: Color(0xFFFF5722),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //                 child: Row(
  //       //                   mainAxisSize: MainAxisSize.min,
  //       //                   children: [
  //       //                     Text(
  //       //                       textAlign: TextAlign.end,
  //       //                       'Lorem Ipsum é simplesmente',
  //       //                       style: GoogleFonts.sourceSansPro(
  //       //                         fontSize: 20,
  //       //                         fontWeight: FontWeight.w600,
  //       //                         color: Color(0xFFFF5722),
  //       //                         letterSpacing: 0.25,
  //       //                       ),
  //       //                     ),
  //       //                     IconButton(
  //       //                       onPressed: () {},
  //       //                       icon: Icon(
  //       //                         Icons.close,
  //       //                         color: Color(0xFFFF5722),
  //       //                         size: 16,
  //       //                       ),
  //       //                       // icon: Icon(Icons.close)
  //       //                     ),
  //       //                   ],
  //       //                 ),
  //       //               ),
  //       //
  //       //               // child: ElevatedButton(
  //       //               //    onPressed: (){
  //       //               //     print("You pressed Icon Elevated Button");
  //       //               //   },
  //       //               //   child: Row(
  //       //               //     mainAxisSize: MainAxisSize.min,
  //       //               //     children: [
  //       //               //       Text('Lorem Ipsum is simply dummy text of '),
  //       //               //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
  //       //               //     ],
  //       //               //   )
  //       //               //
  //       //               //   ),
  //       //             ),
  //       //             Card(
  //       //               child: ElevatedButton(
  //       //                 onPressed: () {},
  //       //                 style: ElevatedButton.styleFrom(
  //       //                   backgroundColor: Colors.white,
  //       //                   shape: RoundedRectangleBorder(
  //       //                     borderRadius: BorderRadius.circular(16),
  //       //                     side: BorderSide(
  //       //                       color: Color(0xFFFF5722),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //                 child: Row(
  //       //                   mainAxisSize: MainAxisSize.min,
  //       //                   children: [
  //       //                     Text(
  //       //                       textAlign: TextAlign.end,
  //       //                       'Lorem Ipsum é simplesmente',
  //       //                       style: GoogleFonts.sourceSansPro(
  //       //                         fontSize: 20,
  //       //                         fontWeight: FontWeight.w600,
  //       //                         color: Color(0xFFFF5722),
  //       //                         letterSpacing: 0.25,
  //       //                       ),
  //       //                     ),
  //       //                     IconButton(
  //       //                       onPressed: () {},
  //       //                       icon: Icon(
  //       //                         Icons.close,
  //       //                         color: Color(0xFFFF5722),
  //       //                         size: 16,
  //       //                       ),
  //       //                       // icon: Icon(Icons.close)
  //       //                     ),
  //       //                   ],
  //       //                 ),
  //       //               ),
  //       //
  //       //               // child: ElevatedButton(
  //       //               //    onPressed: (){
  //       //               //     print("You pressed Icon Elevated Button");
  //       //               //   },
  //       //               //   child: Row(
  //       //               //     mainAxisSize: MainAxisSize.min,
  //       //               //     children: [
  //       //               //       Text('Lorem Ipsum is simply dummy text of '),
  //       //               //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
  //       //               //     ],
  //       //               //   )
  //       //               //
  //       //               //   ),
  //       //             ),
  //       //             Card(
  //       //               child: ElevatedButton(
  //       //                 onPressed: () {},
  //       //                 style: ElevatedButton.styleFrom(
  //       //                   backgroundColor: Colors.white,
  //       //                   shape: RoundedRectangleBorder(
  //       //                     borderRadius: BorderRadius.circular(16),
  //       //                     side: BorderSide(
  //       //                       color: Color(0xFFFF5722),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //                 child: Row(
  //       //                   mainAxisSize: MainAxisSize.min,
  //       //                   children: [
  //       //                     Text(
  //       //                       textAlign: TextAlign.end,
  //       //                       'Lorem Ipsum é simplesmente',
  //       //                       style: GoogleFonts.sourceSansPro(
  //       //                         fontSize: 20,
  //       //                         fontWeight: FontWeight.w600,
  //       //                         color: Color(0xFFFF5722),
  //       //                         letterSpacing: 0.25,
  //       //                       ),
  //       //                     ),
  //       //                     IconButton(
  //       //                       onPressed: () {},
  //       //                       icon: Icon(
  //       //                         Icons.close,
  //       //                         color: Color(0xFFFF5722),
  //       //                         size: 16,
  //       //                       ),
  //       //                       // icon: Icon(Icons.close)
  //       //                     ),
  //       //                   ],
  //       //                 ),
  //       //               ),
  //       //
  //       //               // child: ElevatedButton(
  //       //               //    onPressed: (){
  //       //               //     print("You pressed Icon Elevated Button");
  //       //               //   },
  //       //               //   child: Row(
  //       //               //     mainAxisSize: MainAxisSize.min,
  //       //               //     children: [
  //       //               //       Text('Lorem Ipsum is simply dummy text of '),
  //       //               //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
  //       //               //     ],
  //       //               //   )
  //       //               //
  //       //               //   ),
  //       //             ),
  //       //             Card(
  //       //               child: ElevatedButton(
  //       //                 onPressed: () {},
  //       //                 style: ElevatedButton.styleFrom(
  //       //                   backgroundColor: Colors.white,
  //       //                   shape: RoundedRectangleBorder(
  //       //                     borderRadius: BorderRadius.circular(16),
  //       //                     side: BorderSide(
  //       //                       color: Color(0xFFFF5722),
  //       //                     ),
  //       //                   ),
  //       //                 ),
  //       //                 child: Row(
  //       //                   mainAxisSize: MainAxisSize.min,
  //       //                   children: [
  //       //                     Text(
  //       //                       textAlign: TextAlign.end,
  //       //                       'Lorem Ipsum é simplesmente',
  //       //                       style: GoogleFonts.sourceSansPro(
  //       //                         fontSize: 20,
  //       //                         fontWeight: FontWeight.w600,
  //       //                         color: Color(0xFFFF5722),
  //       //                         letterSpacing: 0.25,
  //       //                       ),
  //       //                     ),
  //       //                     IconButton(
  //       //                       onPressed: () {},
  //       //                       icon: Icon(
  //       //                         Icons.close,
  //       //                         color: Color(0xFFFF5722),
  //       //                         size: 16,
  //       //                       ),
  //       //                       // icon: Icon(Icons.close)
  //       //                     ),
  //       //                   ],
  //       //                 ),
  //       //               ),
  //       //
  //       //               // child: ElevatedButton(
  //       //               //    onPressed: (){
  //       //               //     print("You pressed Icon Elevated Button");
  //       //               //   },
  //       //               //   child: Row(
  //       //               //     mainAxisSize: MainAxisSize.min,
  //       //               //     children: [
  //       //               //       Text('Lorem Ipsum is simply dummy text of '),
  //       //               //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
  //       //               //     ],
  //       //               //   )
  //       //               //
  //       //               //   ),
  //       //             ),
  //       //           ],
  //       //         ),
  //       //         const SizedBox(
  //       //           height: 36,
  //       //         ),
  //       //         const SizedBox(
  //       //           height: 36,
  //       //         ),
  //       //       ],
  //       //     ),
  //       //   ),
  //       //   isActive: controller.contadorStep.value >= 2,
  //       // ),
  //
  //     ];

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
  Widget expandedListaLimitesCustomizado() {
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

  Widget expandedListaFinanceiroCustomizado() {
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

  Widget expandedListaFiscalCustomizado() {
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

  Widget expandedListaEstoqueCustomizado() {
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

  Widget expandedListaProdutoCustomizado() {
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

  // Widget expandedListaValoresCustomizado() {
  //   return ExpansionTile(
  //     collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
  //     collapsedBackgroundColor: Color(0xFFE9F1FF),
  //     title: Text('Valores',
  //         style: GoogleFonts.comfortaa(
  //           fontSize: 23,
  //           fontWeight: FontWeight.w700,
  //           color: Color.fromRGBO(0, 29, 52, 1),
  //           letterSpacing: -0.5,
  //         )),
  //     children: [
  //       Divider(),
  //       Container(
  //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Expanded(
  //               child: Container(
  //                 child: Padding(
  //                   padding: EdgeInsets.all(14.0),
  //                   child: Text(
  //                     'Valor mensal',
  //                     textAlign: TextAlign.left,
  //                     style: GoogleFonts.comfortaa(
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 19,
  //                       letterSpacing: 0.15,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: Container(
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(16.0),
  //                   child: Text(
  //                     'R\$ 45,00',
  //                     style: GoogleFonts.comfortaa(
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 19,
  //                       letterSpacing: 0.15,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(width: 12),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Expanded(
  //               child: Container(
  //                 child: Padding(
  //                   padding: EdgeInsets.all(14.0),
  //                   child: Text(
  //                     'Valor trimestral',
  //                     textAlign: TextAlign.left,
  //                     style: GoogleFonts.comfortaa(
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 19,
  //                       letterSpacing: 0.15,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: Container(
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(16.0),
  //                   child: Text(
  //                     'R\$ 45,00',
  //                     style: GoogleFonts.comfortaa(
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 19,
  //                       letterSpacing: 0.15,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(width: 12),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Expanded(
  //               child: Container(
  //                 child: Padding(
  //                   padding: EdgeInsets.all(14.0),
  //                   child: Text(
  //                     'Valor semestral',
  //                     textAlign: TextAlign.left,
  //                     style: GoogleFonts.comfortaa(
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 19,
  //                       letterSpacing: 0.15,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: Container(
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(16.0),
  //                   child: Text(
  //                     'R\$ 45,00',
  //                     style: GoogleFonts.comfortaa(
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 19,
  //                       letterSpacing: 0.15,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(width: 12),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Expanded(
  //               child: Container(
  //                 child: Padding(
  //                   padding: EdgeInsets.all(14.0),
  //                   child: Text(
  //                     'Valor anual',
  //                     textAlign: TextAlign.left,
  //                     style: GoogleFonts.comfortaa(
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 19,
  //                       letterSpacing: 0.15,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: Container(
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(16.0),
  //                   child: Text(
  //                     'R\$ 45,00',
  //                     style: GoogleFonts.comfortaa(
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 19,
  //                       letterSpacing: 0.15,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(width: 12),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }


}








// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:erp/widgets/chebox_mobile.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:status_change/status_change.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// // import 'stepper.dart';
// import '../../../../theme/app_theme.dart';
// import '../../../../widgets/botao_padrao.dart';
// import '../../../../widgets/botao_proximo.dart';
// import '../../../../widgets/card_preco.dart';
// import '../../../../widgets/responsive.dart';
// import 'contrato_customizado_controller.dart';
//
// class ContratoCustomizadoPage extends GetView<ContratoCustomizadoController> {
// // class ContratoCustomizadoPage extends StatelessWidget {
//   const ContratoCustomizadoPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
// //------------ VARIAVEIS------------
// //     Size _size = MediaQuery
// //         .of(context)
// //         .size;
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
//                   'Cadastrar contrato customizado',
//                   textAlign: TextAlign.left,
//                   style: GoogleFonts.comfortaa(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 46,
//                   ),
//                 ),
//                 Expanded(child: Container()),
//               ],
//             ),
//             const Divider(
//               thickness: 2,
//             ),
//
//             Container(
//               height: Get.width / 2,
//               width: Get.height / 2,
//               child:
//               Obx(
//                 () => Stepper(
//                   elevation: 0,
//                   type: StepperType.horizontal,
//                   steps: getSteps(),
//                   currentStep: controller.contadorStep.value,
//                   onStepContinue: () {
//                     if (controller.contadorStep.value ==
//                         getSteps().length - 1) {
//                       print('traduzir send data to server');
//                     } else {
//                       controller.contadorStep.value++;
//                     }
//                   },
//                   onStepCancel: () {
//                     controller.contadorStep.value == 0
//                         ? null
//                         : controller.contadorStep.value--;
//                   },
//                   onStepTapped: (index) {
//                     controller.contadorStep.value = index;
//                   },
//                   controlsBuilder:
//                       (BuildContext context, ControlsDetails controls) {
//                     return Container(
//                       child: Row(
//                         children: [
//                           Expanded(child: Container()),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor:
//                               controller.contadorStep.value == getSteps().length - 1 ? Color(0xFF169C34) : Color(0xFFFF5722),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(16.0),
//                               ),
//                               padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                               child: Text(
//                                 controller.contadorStep.value == getSteps().length - 1 ? "Finalizar" : "Próximo",
//                                 softWrap: false,
//                                 style: GoogleFonts.sourceSansPro(
//                                   fontSize: AppTheme.h4,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             onPressed: controls.onStepContinue,
//                           ),
//
//                           Visibility(
//                             visible: controller.contadorStep.value != 0,
//                             child: SizedBox(
//                               width: 16,
//                             ),
//                           ),
//
//                           if (controller.contadorStep.value != 0)
//
//                             ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xFFBA1A1A),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(16.0),
//                                 ),
//                                 padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                                 child: Text(
//                                   "Cancelar",
//                                   softWrap: false,
//                                   style: GoogleFonts.sourceSansPro(
//                                     fontSize: AppTheme.h4,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               onPressed: controls.onStepCancel,
//                             ),
//
//                         ],
//                       ),
//
//                     );
//                   },
//                 ),
//               ),
//             ),
//             //
//           ],
//         ),
//       ),
//     );
//
//
//   }
//
//   List<Step> getSteps() => [
//         Step(
//             title: Text(''),
//             content: Container(
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 36,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         'Digite o nome do plano',
//                         textAlign: TextAlign.left,
//                         style: GoogleFonts.comfortaa(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 46,
//                         ),
//                       ),
//                       Expanded(child: Container()),
//                     ],
//                   ),
//                   const Divider(
//                     thickness: 2,
//                   ),
//                   const SizedBox(
//                     height: 36,
//                   ),
//                   CardPreco(
//                     elevated: false,
//                     menorCallback: () {},
//                     maiorCallback: () {},
//                     preco: 6.00,
//                     quantidade: 1,
//                     labelAdicional: 'Sessões Adicional',
//                     label: 'Sessão',
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   expandedListaLimitesCustomizado(),
//                   expandedListaFinanceiroCustomizado(),
//                   expandedListaFiscalCustomizado(),
//                   expandedListaEstoqueCustomizado(),
//                   expandedListaProdutoCustomizado(),
//                   expandedListaValoresCustomizado(),
//                   const SizedBox(
//                     height: 36,
//                   ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     _btnProximo(),
//                   //   ],
//                   // ),
//                 ],
//               ),
//
//               // height: 100,
//               // width: 200,
//               // color: Colors.red,
//             ),
//             isActive: controller.contadorStep.value >= 0,
//             state: controller.contadorStep.value > 0
//                 ? StepState.complete
//                 : StepState.indexed),
//
//         Step(
//             title: Text(''),
//             content: Container(
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 36,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         'Digite o nome do plano',
//                         textAlign: TextAlign.left,
//                         style: GoogleFonts.comfortaa(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 46,
//                         ),
//                       ),
//                       Expanded(child: Container()),
//                     ],
//                   ),
//                   const Divider(
//                     thickness: 2,
//                   ),
//                   const SizedBox(
//                     height: 36,
//                   ),
//                   const SizedBox(
//                     height: 36,
//                   ),
//                   Row(
//                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           padding: EdgeInsets.fromLTRB(8, 32, 8, 32),
//                           color: Color(0xFFE9F1FF),
//                           child: Text(
//                             'Extras',
//                             style: GoogleFonts.comfortaa(
//                               fontWeight: FontWeight.w700,
//                               fontSize: 23,
//                               letterSpacing: -0.5,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 28,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Aplicativo - AUTOPESAGEM',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Aplicativo - WAYWALLET',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Aplicativo XML Venda',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Concentrador',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Dashboard WEB',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Emissores Fiscais',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Integração - Catraca',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Integração - Everest',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Integração - TrackApp',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Integração - WayMenu',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Sessão Extra',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Suporte Premium - Telefone',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'TEF - Cielo',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'TEF - Elgin Pay',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'TEF - PayGo',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'TEF - REDE',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'TEF - SiTef',
//                               textAlign: TextAlign.left,
//                               style: GoogleFonts.comfortaa(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 19,
//                                 letterSpacing: 0.15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: CheckBoxMobile()),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//
//                 ],
//               ),
//             ),
//             isActive: controller.contadorStep.value >= 1,
//             state: controller.contadorStep.value > 1
//                 ? StepState.complete
//                 : StepState.indexed),
//
//         Step(
//           title: Text(''),
//           content: Container(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       'Plano Diamante',
//                       textAlign: TextAlign.left,
//                       style: GoogleFonts.comfortaa(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 46,
//                       ),
//                     ),
//                     Expanded(child: Container()),
//                   ],
//                 ),
//                 const Divider(
//                   thickness: 2,
//                 ),
//                 const SizedBox(
//                   height: 36,
//                 ),
//                 Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.fromLTRB(8, 32, 8, 32),
//                         color: Color(0xFFE9F1FF),
//                         child: Text(
//                           'Valores',
//                           style: GoogleFonts.comfortaa(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 23,
//                             letterSpacing: -0.5,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 28,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         child: Padding(
//                           padding: EdgeInsets.all(14.0),
//                           child: Text(
//                             'Valor mensal',
//                             textAlign: TextAlign.left,
//                             style: GoogleFonts.comfortaa(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 19,
//                               letterSpacing: 0.15,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'R\$ 45.90',
//                                 style: GoogleFonts.sourceSansPro(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 20,
//                                   color: Color(0xFF0D0D0D),
//                                 ),
//                               )),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 36,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       'Empresas',
//                       textAlign: TextAlign.left,
//                       style: GoogleFonts.comfortaa(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 28,
//                         letterSpacing: 0.15,
//                       ),
//                     ),
//                     Expanded(child: Container()),
//                     // _btnProrrogarContrato(),
//                     const SizedBox(
//                       width: 8,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 36,
//                 ),
//                 const SizedBox(
//                   height: 36,
//                 ),
//                 Wrap(
//                   alignment: WrapAlignment.center,
//                   // direction: Axis.horizontal,
//                   spacing: 51,
//                   runSpacing: 25,
//                   children: <Widget>[
//                     Card(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(
//                               color: Color(0xFFFF5722),
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               textAlign: TextAlign.end,
//                               'Lorem Ipsum é simplesmente',
//                               style: GoogleFonts.sourceSansPro(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFFFF5722),
//                                 letterSpacing: 0.25,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.close,
//                                 color: Color(0xFFFF5722),
//                                 size: 16,
//                               ),
//                               // icon: Icon(Icons.close)
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // child: ElevatedButton(
//                       //    onPressed: (){
//                       //     print("You pressed Icon Elevated Button");
//                       //   },
//                       //   child: Row(
//                       //     mainAxisSize: MainAxisSize.min,
//                       //     children: [
//                       //       Text('Lorem Ipsum is simply dummy text of '),
//                       //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
//                       //     ],
//                       //   )
//                       //
//                       //   ),
//                     ),
//                     Card(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(
//                               color: Color(0xFFFF5722),
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               textAlign: TextAlign.end,
//                               'Lorem Ipsum é simplesmente',
//                               style: GoogleFonts.sourceSansPro(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFFFF5722),
//                                 letterSpacing: 0.25,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.close,
//                                 color: Color(0xFFFF5722),
//                                 size: 16,
//                               ),
//                               // icon: Icon(Icons.close)
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // child: ElevatedButton(
//                       //    onPressed: (){
//                       //     print("You pressed Icon Elevated Button");
//                       //   },
//                       //   child: Row(
//                       //     mainAxisSize: MainAxisSize.min,
//                       //     children: [
//                       //       Text('Lorem Ipsum is simply dummy text of '),
//                       //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
//                       //     ],
//                       //   )
//                       //
//                       //   ),
//                     ),
//                     Card(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(
//                               color: Color(0xFFFF5722),
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               textAlign: TextAlign.end,
//                               'Lorem Ipsum é simplesmente',
//                               style: GoogleFonts.sourceSansPro(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFFFF5722),
//                                 letterSpacing: 0.25,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.close,
//                                 color: Color(0xFFFF5722),
//                                 size: 16,
//                               ),
//                               // icon: Icon(Icons.close)
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // child: ElevatedButton(
//                       //    onPressed: (){
//                       //     print("You pressed Icon Elevated Button");
//                       //   },
//                       //   child: Row(
//                       //     mainAxisSize: MainAxisSize.min,
//                       //     children: [
//                       //       Text('Lorem Ipsum is simply dummy text of '),
//                       //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
//                       //     ],
//                       //   )
//                       //
//                       //   ),
//                     ),
//                     Card(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(
//                               color: Color(0xFFFF5722),
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               textAlign: TextAlign.end,
//                               'Lorem Ipsum é simplesmente',
//                               style: GoogleFonts.sourceSansPro(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFFFF5722),
//                                 letterSpacing: 0.25,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.close,
//                                 color: Color(0xFFFF5722),
//                                 size: 16,
//                               ),
//                               // icon: Icon(Icons.close)
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // child: ElevatedButton(
//                       //    onPressed: (){
//                       //     print("You pressed Icon Elevated Button");
//                       //   },
//                       //   child: Row(
//                       //     mainAxisSize: MainAxisSize.min,
//                       //     children: [
//                       //       Text('Lorem Ipsum is simply dummy text of '),
//                       //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
//                       //     ],
//                       //   )
//                       //
//                       //   ),
//                     ),
//                     Card(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(
//                               color: Color(0xFFFF5722),
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               textAlign: TextAlign.end,
//                               'Lorem Ipsum é simplesmente',
//                               style: GoogleFonts.sourceSansPro(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFFFF5722),
//                                 letterSpacing: 0.25,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.close,
//                                 color: Color(0xFFFF5722),
//                                 size: 16,
//                               ),
//                               // icon: Icon(Icons.close)
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // child: ElevatedButton(
//                       //    onPressed: (){
//                       //     print("You pressed Icon Elevated Button");
//                       //   },
//                       //   child: Row(
//                       //     mainAxisSize: MainAxisSize.min,
//                       //     children: [
//                       //       Text('Lorem Ipsum is simply dummy text of '),
//                       //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
//                       //     ],
//                       //   )
//                       //
//                       //   ),
//                     ),
//                     Card(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(
//                               color: Color(0xFFFF5722),
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               textAlign: TextAlign.end,
//                               'Lorem Ipsum é simplesmente',
//                               style: GoogleFonts.sourceSansPro(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFFFF5722),
//                                 letterSpacing: 0.25,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.close,
//                                 color: Color(0xFFFF5722),
//                                 size: 16,
//                               ),
//                               // icon: Icon(Icons.close)
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // child: ElevatedButton(
//                       //    onPressed: (){
//                       //     print("You pressed Icon Elevated Button");
//                       //   },
//                       //   child: Row(
//                       //     mainAxisSize: MainAxisSize.min,
//                       //     children: [
//                       //       Text('Lorem Ipsum is simply dummy text of '),
//                       //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
//                       //     ],
//                       //   )
//                       //
//                       //   ),
//                     ),
//                     Card(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(
//                               color: Color(0xFFFF5722),
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               textAlign: TextAlign.end,
//                               'Lorem Ipsum é simplesmente',
//                               style: GoogleFonts.sourceSansPro(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFFFF5722),
//                                 letterSpacing: 0.25,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.close,
//                                 color: Color(0xFFFF5722),
//                                 size: 16,
//                               ),
//                               // icon: Icon(Icons.close)
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // child: ElevatedButton(
//                       //    onPressed: (){
//                       //     print("You pressed Icon Elevated Button");
//                       //   },
//                       //   child: Row(
//                       //     mainAxisSize: MainAxisSize.min,
//                       //     children: [
//                       //       Text('Lorem Ipsum is simply dummy text of '),
//                       //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
//                       //     ],
//                       //   )
//                       //
//                       //   ),
//                     ),
//                     Card(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(
//                               color: Color(0xFFFF5722),
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               textAlign: TextAlign.end,
//                               'Lorem Ipsum é simplesmente',
//                               style: GoogleFonts.sourceSansPro(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFFFF5722),
//                                 letterSpacing: 0.25,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.close,
//                                 color: Color(0xFFFF5722),
//                                 size: 16,
//                               ),
//                               // icon: Icon(Icons.close)
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // child: ElevatedButton(
//                       //    onPressed: (){
//                       //     print("You pressed Icon Elevated Button");
//                       //   },
//                       //   child: Row(
//                       //     mainAxisSize: MainAxisSize.min,
//                       //     children: [
//                       //       Text('Lorem Ipsum is simply dummy text of '),
//                       //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
//                       //     ],
//                       //   )
//                       //
//                       //   ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 36,
//                 ),
//                 const SizedBox(
//                   height: 36,
//                 ),
//               ],
//             ),
//           ),
//           isActive: controller.contadorStep.value >= 2,
//         ),
//
//       ];
//
//   Widget _btnProximo() {
//     return BotaoPadraoProximo(
//       corTexto: Colors.white,
//       texto: 'Próximo',
//       // icone: Icons.calendar_today_outlined,
//       acao: () {
//         //TODO: AÇÃO SALVAR
//       },
//     );
//   }
// }
//
// Widget expandedListaLimitesCustomizado() {
//   return ExpansionTile(
//     collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
//     collapsedBackgroundColor: Color(0xFFE9F1FF),
//     title: Text('Limites',
//         style: GoogleFonts.comfortaa(
//           fontSize: 23,
//           fontWeight: FontWeight.w700,
//           color: Color.fromRGBO(0, 29, 52, 1),
//           letterSpacing: -0.5,
//         )),
//     children: [
//       Divider(),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Faturamento/mês',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     'R\$ 45,00',
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Cadastro de Produtos',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     'R\$ 45,00',
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Contas a receber',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     'R\$ 45,00',
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Contas a pagar',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     'R\$ 45,00',
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Usuários e conexões simultâneas',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     'R\$ 45,00',
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//     ],
//   );
// }
//
// Widget expandedListaFinanceiroCustomizado() {
//   return ExpansionTile(
//     collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
//     collapsedBackgroundColor: Color(0xFFE9F1FF),
//     title: Text('Financeiro',
//         style: GoogleFonts.comfortaa(
//           fontSize: 23,
//           fontWeight: FontWeight.w700,
//           color: Color.fromRGBO(0, 29, 52, 1),
//           letterSpacing: -0.5,
//         )),
//     children: [
//       Divider(),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Módulo Financeiro',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Controle de boleto bancário',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Controle de cartões',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Controle de DRE/DFC',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Controle de vendas a prazo',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//     ],
//   );
// }
//
// Widget expandedListaFiscalCustomizado() {
//   return ExpansionTile(
//     collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
//     collapsedBackgroundColor: Color(0xFFE9F1FF),
//     title: Text('Fiscal',
//         style: GoogleFonts.comfortaa(
//           fontSize: 23,
//           fontWeight: FontWeight.w700,
//           color: Color.fromRGBO(0, 29, 52, 1),
//           letterSpacing: -0.5,
//         )),
//     children: [
//       Divider(),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Emissão de NF-e (saída)',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Emissão de NFS-e (serviço)',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Lançamento NF-e (entrada)',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//     ],
//   );
// }
//
// Widget expandedListaEstoqueCustomizado() {
//   return ExpansionTile(
//     collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
//     collapsedBackgroundColor: Color(0xFFE9F1FF),
//     title: Text('Estoque',
//         style: GoogleFonts.comfortaa(
//           fontSize: 23,
//           fontWeight: FontWeight.w700,
//           color: Color.fromRGBO(0, 29, 52, 1),
//           letterSpacing: -0.5,
//         )),
//     children: [
//       Divider(),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Módulo Estoque',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Controle de multiplos locais',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//     ],
//   );
// }
//
// Widget expandedListaProdutoCustomizado() {
//   return ExpansionTile(
//     collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
//     collapsedBackgroundColor: Color(0xFFE9F1FF),
//     title: Text('Produto',
//         style: GoogleFonts.comfortaa(
//           fontSize: 23,
//           fontWeight: FontWeight.w700,
//           color: Color.fromRGBO(0, 29, 52, 1),
//           letterSpacing: -0.5,
//         )),
//     children: [
//       Divider(),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Controle de observações',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Controle de gerador de etiqueta',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Controle de pacotes',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Controle de promoção',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Controle de tabela de preços',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Controle de variações',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft, child: CheckBoxMobile()),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//     ],
//   );
// }
//
// Widget expandedListaValoresCustomizado() {
//   return ExpansionTile(
//     collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
//     collapsedBackgroundColor: Color(0xFFE9F1FF),
//     title: Text('Valores',
//         style: GoogleFonts.comfortaa(
//           fontSize: 23,
//           fontWeight: FontWeight.w700,
//           color: Color.fromRGBO(0, 29, 52, 1),
//           letterSpacing: -0.5,
//         )),
//     children: [
//       Divider(),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Valor mensal',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     'R\$ 45,00',
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Valor trimestral',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     'R\$ 45,00',
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Valor semestral',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     'R\$ 45,00',
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Valor anual',
//                     textAlign: TextAlign.left,
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Text(
//                     'R\$ 45,00',
//                     style: GoogleFonts.comfortaa(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 19,
//                       letterSpacing: 0.15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//           ],
//         ),
//       ),
//     ],
//   );
// }
