// import 'package:autoatendimento/app/modules/home/pages/produto/abstract/controller_abstract.dart';
// import 'package:autoatendimento/app/utils/font_utils.dart';
// import 'package:flutter/material.dart';
//
// class MostraQuantidade extends StatelessWidget {
//   final ControllerAbstract controllerAbstract;
//
//   const MostraQuantidade(this.controllerAbstract);
//
//   @override
//   Widget build(BuildContext context) {
//     String info = "";
//     if (controllerAbstract.produtoMenu!.quantidadeMinima != 0)
//       info +=
//           "Você precisa escolher no minino ${controllerAbstract.produtoMenu!.quantidadeMinima} opç${(controllerAbstract.produtoMenu!.quantidadeMinima! > 1) ? 'ões' : "ão"} ";
//
//     if (controllerAbstract.produtoMenu!.quantidadeMaxima != 0)
//       info += (info.isNotEmpty ? "e " : "Escolha ") +
//           ' no máximo ${controllerAbstract.produtoMenu!.quantidadeMaxima} opç${(controllerAbstract.produtoMenu!.quantidadeMaxima! > 1) ? 'ões' : "ão"}';
//
//     if (info.isEmpty) return Container();
//
//     return Center(
//       child: Text(info, style: TextStyle(fontSize: FontUtils.h2(context))),
//     );
//   }
// }
