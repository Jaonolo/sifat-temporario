// import 'package:autoatendimento/app/modules/home/pages/configuracao/configuracao_controller.dart';
// import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
// import 'package:autoatendimento/app/theme/default_theme.dart';
// import 'package:autoatendimento/app/utils/style_utils.dart';
// import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
//
// class ConfiguracaoPageComponent {
//   ConfiguracaoController controller = Modular.get();
//   late Orientation orientation;
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
//                       Modular.to.pushNamed('/comecar');
//                     },
//                   )),
//               Expanded(flex: 15, child: const AppBarImage()),
//             ],
//           ),
//           Expanded(
//             flex: 70,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: SizedBox(),
//                   flex: 10,
//                 ),
//                 Expanded(
//                   flex: 30,
//                   child: _cardOpcao(
//                   "administrativoTEF.svg", "TEF ADMINISTRATIVO", controller.goAdministrativo),
//                 ),
//                 Expanded(child: SizedBox(),flex: 10,),
//                 Expanded(
//                   flex: 30,
//                   child: _cardOpcao("pendenciaFiscal.svg", "PENDENCIA FISCAL",
//                       controller.goPendenciaFiscal),
//                 ),
//                 Expanded(
//                   child: SizedBox(),
//                   flex: 10,
//                 ),
//               ],
//             ),
//           ),
//           Expanded(flex: 15, child: SizedBox()),
//         ],
//       ),
//     );
//   }
//
//   Widget _cardOpcao( String icon, String texto, Function onpressed) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         width: 40,
//         height: 250,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: DefaultTheme.accentColor,
//                       ),
//           child: Column(
//             children: [
//               Expanded(flex: 10, child: Container()),
//               Expanded(flex: 60, child: SvgPicture.asset(icon, color: Colors.white,)),
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
//           onPressed: () =>
//             onpressed.call(),
//         ),
//       ),
//     );
//   }
// }
