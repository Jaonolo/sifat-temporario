// import 'package:autoatendimento/app/modules/home/pages/produto/abstract/controller_abstract.dart';
// import 'package:autoatendimento/app/theme/default_theme.dart';
// import 'package:autoatendimento/app/utils/font_utils.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:mobx/mobx.dart';
// import 'package:models/model/models.dart';
// import 'package:utils/utils/nota_item_utils.dart';
//
// // ignore: must_be_immutable
// class CardProdutoObservacaoRadio extends StatelessWidget {
//   ControllerAbstract controllerAbstract;
//   ProdutoMenuComponente produtoMenuComponente;
//   @observable
//   int index;
//
//   @action
//   atualizaIndex(int value) {
//     index = value;
//     controllerAbstract.selecaoRadio(value);
//   }
//
//   CardProdutoObservacaoRadio(
//       this.controllerAbstract, this.produtoMenuComponente, this.index) {
//     if (index == controllerAbstract.radiovalue) _adicionaObservacao();
//   }
//
//   late BuildContext context;
//
//   @override
//   Widget build(BuildContext context) {
//     this.context = context;
//     return Observer(builder: (_) {
//       return InkWell(
//         onTap: () {
//           atualizaIndex(index);
//         },
//         child: Container(
//             height: FontUtils.h1(context),
//             decoration: BoxDecoration(
//               border: Border.all(
//                   width: 2,
//                   color: controllerAbstract.radiovalue == index
//                       ? DefaultTheme.accentColor
//                       : DefaultTheme.preto),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 8,
//                   child: Radio(
//                       activeColor: DefaultTheme.accentColor,
//                       value: index,
//                       groupValue: controllerAbstract.radiovalue,
//                       onChanged: (int? n) {
//                         atualizaIndex(n!);
//                       }),
//                 ),
//                 Expanded(
//                     flex: 50,
//                     child: Text(produtoMenuComponente.descricao!.toUpperCase(),
//                         style: TextStyle(
//                             fontSize:
//                                 defaultTargetPlatform == TargetPlatform.windows
//                                     ? FontUtils.h4(context)
//                                     : FontUtils.h3(context))))
//               ],
//             )),
//       );
//     });
//   }
//
//   void _adicionaObservacao() {
//     NotaItem? notaItem = NotaItemUtils.observacaoToNotaItem(
//         controllerAbstract.produtoCarrinho.notaItem.idNota!,
//         produtoMenuComponente);
//
//     NotaItem? menu = NotaItemUtils.localizaMenuJaLancado(
//         controllerAbstract.produtoCarrinho.notaItem,
//         controllerAbstract.produtoMenu!);
//
//     if (menu == null) {
//       menu = NotaItemUtils.menuToNotaItem(
//           controllerAbstract.produtoCarrinho.notaItem.idNota!,
//           controllerAbstract.produtoMenu!);
//       menu.subitens.add(notaItem);
//       controllerAbstract.produtoCarrinho.notaItem.subitens.add(menu);
//     } else {
//       menu.subitens.clear();
//       menu.subitens.add(notaItem);
//     }
//   }
// }
