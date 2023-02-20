// import 'package:autoatendimento/app/theme/default_theme.dart';
// import 'package:autoatendimento/app/utils/font_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:models/model/models.dart';
// import 'package:utils/utils/hex_color.dart';
//
// class CardFormaPagamento extends StatefulWidget {
//   final Finalizadora finalizadora;
//   final Function function;
//
//   CardFormaPagamento(this.finalizadora, this.function, {Key? key})
//       : super(key: key);
//
//   @override
//   _CardFormaPagamentoState createState() => _CardFormaPagamentoState();
// }
//
// class _CardFormaPagamentoState extends State<CardFormaPagamento> {
//   @override
//   Widget build(BuildContext context) {
//     Orientation orientation = MediaQuery
//         .of(context)
//         .orientation;
//
//     return SizedBox(
//       width: FontUtils.h1(context) * 4,
//       height: FontUtils.h1(context) * 4,
//       child: ElevatedButton(
//         child: Column(
//           children: [
//             if (_imagem() != null)
//               Expanded(
//                   flex: 70,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(
//                       _imagem(),
//                       color: HexColor('FFFFFF'),
//                     ),
//                   )),
//             Expanded(
//                 flex: 30,
//                 child: Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       widget.finalizadora.descricao!.toUpperCase(),
//                       softWrap: false,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: orientation == Orientation.landscape
//                               ? FontUtils.h2(context)
//                               : FontUtils.h4(context)),
//                     ))),
//           ],
//         ),
//         style: ElevatedButton.styleFrom(
//           primary: DefaultTheme.accentColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(40.0),
//           ),
//         ),
//         onPressed: () => widget.function.call(),
//       ),
//     );
//   }
//
//   _imagem() {
//     var param = "";
//     switch (widget.finalizadora.finalizadoraRFB) {
//       case "DINHEIRO":
//         param = 'assets/dinheiro.png';
//         break;
//       case "CARTAO_CREDITO":
//         param = 'assets/credito.png';
//         break;
//       case "CARTAO_DEBITO":
//         param = 'assets/debito.png';
//         break;
//       case "VALE_REFEICAO":
//         param = 'assets/vale.png';
//         break;
//       case "VALE_ALIMENTACAO":
//         param = 'assets/vale.png';
//         break;
//     }
//     return (param);
//   }
// }
