// import 'package:autoatendimento/app/modules/home/pages/tef/administrativo_tef/administrativo_tef_controller.dart';
// import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
// import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
// import 'package:autoatendimento/app/theme/default_theme.dart';
// import 'package:autoatendimento/app/utils/style_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../transacao_tef/transacao_tef_controller.dart';
//
// class AdministrativoTefComponent {
//   AdministrativoTefController controller = Modular.get();
//   TransacaoTefController transacaoTefController = Modular.get();
//
//   Widget body() {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         image: StyleUtils.fundoTransparencia(),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                   flex: 0,
//                   child: BotaoSetaVoltar(
//                     function: () {
//                       Modular.to.pushNamed('/configuracao');
//                     },
//                   )),
//               Expanded(flex: 15, child: const AppBarImage()),
//             ],
//           ),
//           Expanded(
//             flex: 70,
//             child: opcoes(),
//           ),
//           Expanded(
//             child: SizedBox(),
//             flex: 15,
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget opcoes() {
//     return Row(
//       children: [
//         Expanded(
//           child: SizedBox(),
//           flex: 10,
//         ),
//         Expanded(
//             flex: 10,
//             child: _cardOpcao("cancelarTef.svg", "Cancelamento TEF",
//                 () => controller.cancelamentoTef())),
//         Expanded(child: SizedBox(),flex: 10,),
//
//         // Expanded(
//         //     flex: 30,
//         //     child:
//         //         _cardOpcao("impressora.svg", "Reimpressão TEF", () => { controller.reimpressaoTef(context)})),
//         // Expanded(flex: 10, child: SizedBox()),
//       ],
//     );
//   }
//
//   Widget _cardOpcao(String icon, String texto, Function onpressed) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         width: 40,
//         height: 250,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: DefaultTheme.accentColor,
//           ),
//           child: Column(
//             children: [
//               Expanded(flex: 10, child: Container()),
//               Expanded(
//                   flex: 60,
//                   child: SvgPicture.asset(
//                     icon,
//                     color: Colors.white,
//                   )),
//               Expanded(
//                 flex: 4,
//                 child: Container(),
//               ),
//               Expanded(
//                   flex: 20,
//                   child: Text(texto,
//                       style: TextStyle(color: Colors.white, fontSize: 20.00))),
//               Expanded(flex: 6, child: Container()),
//             ],
//           ),
//           onPressed: () => onpressed.call(),
//         ),
//       ),
//     );
//   }
//
//
//
//   //TESTANDO PARA REIMPRESSAO( NÃO ESTA FUNCIONANDO)
//   // Widget _reimprimirTEF() {
//   //   return Builder(
//   //     builder: (context) {
//   //       return AlertDialog(
//   //         shape: const RoundedRectangleBorder(
//   //           side: BorderSide(),
//   //           borderRadius: BorderRadius.all(Radius.circular(8)),
//   //         ),
//   //         title: Center(
//   //           child: Text(
//   //             "Selecione o tipo de Reimpressao",
//   //             textAlign: TextAlign.center,
//   //             style: TextStyle(
//   //               fontSize: 8,
//   //             ),
//   //           ),
//   //         ),
//   //         content: SingleChildScrollView(
//   //           child: Column(
//   //             children: [
//   //               btnTipoReimpressao( "1 - Ultimo Comprovante" , "114"),
//   //               btnTipoReimpressao( "2 - Comprovante Específico" , "113"),
//   //             ],
//   //           ),
//   //         ),
//   //         actions: [
//   //           Row(
//   //             mainAxisAlignment: MainAxisAlignment.center,
//   //             children: [
//   //               Padding(
//   //                 padding: const EdgeInsets.all(2.0),
//   //                 child: SizedBox(
//   //                   width: 4.5,
//   //                   child: BotaoPrimario(
//   //                     descricao: "Cancelar",
//   //                     function: () {
//   //                       Modular.to.pop();
//   //                     },
//   //                   ),
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         ],
//   //       );
//   //     }
//   //   );
//   // }
//   // Widget btnTipoReimpressao(String descricao, String tipo){
//   //   return Builder(
//   //     builder: (context) {
//   //       return SizedBox(
//   //         width: 8.40,
//   //         child: Padding(
//   //           padding: const EdgeInsets.all(8.0),
//   //           child: BotaoPrimario(
//   //             descricao: descricao,
//   //             function: () {
//   //               switch(tipo) {
//   //                 case "113":
//   //
//   //                   break;
//   //                 case "114":
//   //                   Modular.to.pushNamed("/transacao");
//   //                   transacaoTefController.comunicaWebSocket(context);
//   //                   transacaoTefController.reimprimirTransacao();
//   //                   break;
//   //               }
//   //             },
//   //           ),
//   //         ),
//   //       );
//   //     }
//   //   );
//   // }
//
// }
