// import 'package:autoatendimento/app/theme/default_theme.dart';
// import 'package:autoatendimento/app/utils/font_utils.dart';
// import 'package:flutter/material.dart';
//
// // ignore: must_be_immutable
// class CardCardapio extends StatelessWidget {
//   final Function() function;
//   String url_imagem;
//   String descricao;
//   String? subdescricao;
//   String valor;
//
//   CardCardapio(this.function,
//       this.url_imagem,
//       this.descricao,
//       this.valor,
//       {this.subdescricao});
//
//   @override
//   Widget build(BuildContext context) {
//     Orientation orientation = MediaQuery
//         .of(context)
//         .orientation;
//
//     return InkWell(
//       onTap: function.call(),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(width: 1)),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 8,
//             ),
//             Expanded(
//               flex: 65,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15)),
//                 child: (url_imagem.isNotEmpty)
//                     ? Image.network(
//                   url_imagem,
//                   fit: BoxFit.contain,
//                   width: double.maxFinite,
//                 )
//                     : Icon(
//                   Icons.image,
//                   color: DefaultTheme.cinza,
//                   size: 50,
//                 ),
//               ),
//             ),
//             Expanded(
//                 flex: 80,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(descricao.toUpperCase(),
//                         softWrap: false,
//                         style: TextStyle(
//                             fontSize: orientation == Orientation.landscape
//                                 ? FontUtils.h3(context) * 1.2
//                                 : FontUtils.h2(context))),
//                     Text(valor,
//                         style: TextStyle(
//                             fontSize: orientation == Orientation.landscape
//                                 ? FontUtils.h3(context) * 1.1
//                                 : FontUtils.h3(context))),
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
