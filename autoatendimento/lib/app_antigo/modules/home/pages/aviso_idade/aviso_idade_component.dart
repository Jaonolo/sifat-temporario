// import 'package:autoatendimento/app/app_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
// import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
// import 'package:autoatendimento/app/utils/font_utils.dart';
// import 'package:autoatendimento/app/utils/style_utils.dart';
//
// class AvisoIdadeComponent {
//   late BuildContext context;
//
//   final AppController appController = Modular.get();
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
//           const Expanded(flex: 20, child: AppBarImage()),
//           Expanded(flex: 70, child: align()),
//           const Expanded(flex: 10, child: SizedBox()),
//         ],
//       ),
//     );
//   }
//
//   Widget align() {
//     return Row(
//       children: [
//         const Expanded(flex: 10, child: SizedBox()),
//         Expanded(flex: 80, child: aviso()),
//         const Expanded(flex: 10, child: SizedBox()),
//       ],
//     );
//   }
//
//   Widget aviso() {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10),
//         child: Column(
//           children: [
//             Expanded(
//                 flex: 20,
//                 child: Center(
//                   child: Text(
//                     "Proibida a venda de bebidas alcoólicas para menores de 18 anos!",
//                     style: TextStyle(fontSize: FontUtils.h2(context) * 1.3),
//                     textAlign: TextAlign.center,
//                   ),
//                 )),
//             Expanded(
//                 flex: 15,
//                 child: Center(
//                     child: Text(
//                       "Lei Federal n. 8.069/1990",
//                       style: TextStyle(fontSize: FontUtils.h2(context) * 1.3),
//                     ))),
//             Expanded(
//                 flex: 15,
//                 child: Center(
//                     child: Text(
//                       "Você declara ser maior de 18 anos?",
//                       style: TextStyle(
//                           fontSize: FontUtils.h2(context) * 1.5,
//                           fontWeight: FontWeight.bold),
//                     ))),
//             const Expanded(flex: 20, child: SizedBox()),
//             Expanded(
//                 flex: 10,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     BotaoPrimario(
//
//                         descricao: "SIM",
//                         function: () {
//                           appController.maiorIdade = true;
//                           Modular.to.pop(true);
//                         }),
//                     BotaoPrimario(
//                         descricao: "NÃO",
//                         function: () {
//                           Modular.to.pop(false);
//                         }),
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
