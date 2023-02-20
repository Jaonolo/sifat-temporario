// import 'package:autoatendimento/app/app_controller.dart';
// import 'package:autoatendimento/app/modules/home/home_controller.dart';
// import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_page.dart';
// import 'package:autoatendimento/app/modules/home/pages/produto/combo/produto_combo_page.dart';
// import 'package:autoatendimento/app/modules/home/pages/produto/composto/produto_composto_page.dart';
// import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
// import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
// import 'package:autoatendimento/app/theme/default_theme.dart';
// import 'package:autoatendimento/app/utils/dialog_auto.dart';
// import 'package:autoatendimento/app/utils/font_utils.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:models/model/models.dart';
// import 'package:utils/utils/nota_item_utils.dart';
// import 'package:utils/utils/string_utils.dart';
//
// class CardItemCarrinho extends StatefulWidget {
//   final int index;
//   final ProdutoCarrinho produtoCarrinho;
//   final AppController appController = Modular.get();
//
//   CardItemCarrinho(this.produtoCarrinho, this.index);
//
//   @override
//   _CardItemCarrinhoState createState() => _CardItemCarrinhoState();
// }
//
// class _CardItemCarrinhoState extends State<CardItemCarrinho> {
//   final VendaController vendaController = Modular.get();
//   final HomeController homeController = Modular.get();
//   late Orientation orientation;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     bool isWindows = defaultTargetPlatform == TargetPlatform.windows;
//
//     return Card(
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 15, bottom: 15),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(flex:isWindows? 8 : 6, child: _botaoRemove()),
//                 Expanded(flex: 4, child: _txtUnidade()),
//                 Expanded(flex: isWindows? 8 : 6, child: _botaoAdd()),
//                 Expanded(flex: isWindows? 54 : 10, child: _txtDescricao()),
//                 Expanded(flex:isWindows? 14 :  7, child: _txtValor()),
//                 Expanded(flex: 1,
//                   child: Container(),
//                 ),
//               ],
//             ),
//               _txtSubItens(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _botaoAdd() {
//     return Center(
//       child: SizedBox(
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: DefaultTheme.accentColor,
//             onPrimary: DefaultTheme.branco,
//             elevation: 4.0,
//             shape: const CircleBorder(),
//           ),
//           onPressed: () => widget.produtoCarrinho.adicionar(),
//           child: Icon(
//             Icons.add,
//             size: FontUtils.h3(context),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _txtUnidade() {
//     return Observer(builder: (_) {
//       String qtde = widget.produtoCarrinho.notaItem.quantidade.toString();
//       return Text(
//         qtde,
//         textAlign: TextAlign.center,
//         softWrap: false,
//         style: TextStyle(
//             color: DefaultTheme.preto, fontSize: defaultTargetPlatform == TargetPlatform.windows? FontUtils.h3(context) : FontUtils.h3(context) * 1.80),
//       );
//     });
//   }
//
//   Widget _botaoRemove() {
//     return Center(
//       child: SizedBox(
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: DefaultTheme.accentColor,
//             onPrimary: DefaultTheme.branco,
//             elevation: 4.0,
//             shape: const CircleBorder(),
//             //splashColor: Colors.grey, Desativado pelo uso do ElevatedButton
//           ),
//           onPressed: () {
//             //se for o ultimo pedido aparece uma dialog de confirmação
//             widget.produtoCarrinho.remover(
//                 ultimoPedido: (index) =>
//                     showDialog(
//                         context: context,
//                         builder: (context) =>
//                             DialogAuto(
//                               message: "Deseja remover o item do carrinho?",
//                               txtConfirmar: "SIM",
//                               txtCancelar: "NÃO",
//                               onConfirm: () =>
//                                   vendaController.removerProdutoCarrinho(index),
//                               title: '',
//                             )));
//           },
//           child: Icon(
//             Icons.remove,
//             size: FontUtils.h3(context),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _botaoEditar() {
//     return Center(
//         child: SizedBox(
//             child: IconButton(
//               alignment: AlignmentDirectional.topEnd,
//               onPressed: onEditar,
//               icon: Icon(
//                 Icons.edit,
//                 color: Colors.black,
//               ),
//             )));
//   }
//
//   void onEditar() {
//     //caso o item tiver grade botao editar adiciona o palco do cardapio com a grade do produto
//     if (widget.appController.mapProdutos[widget.produtoCarrinho.notaItem.idProdutoEmpresa]!.gradesAtivas.length >
//         1) {
//       homeController.habilitarCarrinho = true;
//       homeController.addPalco(ProdutoAdicionalPage(vendaController.itensLancados[widget.index]));
//       return;
//     }
//     switch (widget.appController.mapProdutos[widget.produtoCarrinho.notaItem.idProdutoEmpresa]!.produto!.pacote) {
//       case TipoPacote.ADICIONAIS:
//         homeController.habilitarCarrinho = true;
//         homeController.addPalco(ProdutoAdicionalPage(vendaController.itensLancados[widget.index]));
//         break;
//       case TipoPacote.COMBO:
//         homeController.habilitarCarrinho = true;
//         homeController.addPalco(
//             ProdutoComboPage(vendaController.itensLancados[widget.index]));
//         break;
//       case TipoPacote.COMPOSTO:
//         homeController.habilitarCarrinho = true;
//         homeController.addPalco(
//             ProdutoCompostoPage(vendaController.itensLancados[widget.index]));
//         break;
//       default:
//         throw Exception("TipoPacote não implementado na edicão");
//     }
//   }
//
//   Widget _txtDescricao() {
//     return Text(
//       "${widget.produtoCarrinho.notaItem.descricao!.toUpperCase()} ",
//       style:
//       TextStyle(color: DefaultTheme.preto, fontSize: FontUtils.h3(context)),
//     );
//   }
//
//   Widget _txtValor() {
//     return Observer(builder: (_) {
//       return Center(
//         child: Text(
//           'R\$ ${NotaItemUtils.getSubtotal(widget.produtoCarrinho.notaItem)
//               .toStringAsFixed(2)}',
//           textAlign: TextAlign.end,
//           style: TextStyle(
//               color: DefaultTheme.preto, fontSize: FontUtils.h3(context) * 1.2),
//         ),
//       );
//     });
//   }
//
//   Widget _txtSubItens() {
//     bool podeEditar = false;
//     bool isSubItens = false ;
//
//     if(widget.produtoCarrinho.notaItem.subitens.isNotEmpty) {
//       isSubItens = true;
//     }
//
//
//     if (widget.appController.mapProdutos[widget.produtoCarrinho.notaItem.idProdutoEmpresa] != null) {
//       //Diferente de nenhum e que tenha menus  OU  diferente de nenhum a grade que é usado hoje por causa da variação que fica como tamanho e que tenha grade
//       //todos produtos tem grade, apenas pra validar certeza
//       if ((!widget.appController.mapProdutos[widget.produtoCarrinho.notaItem.idProdutoEmpresa]!.produto!.pacote.equals(TipoPacote.NENHUM)
//               && widget.appController.mapProdutos[widget.produtoCarrinho.notaItem.idProdutoEmpresa]!.produto!.menus.isNotEmpty)
//           ||
//              (widget.appController.mapProdutos[widget.produtoCarrinho.notaItem.idProdutoEmpresa]!.produto!.grade != "NENHUMA"
//               &&  widget.appController.mapProdutos[widget.produtoCarrinho.notaItem.idProdutoEmpresa]!.produto!.grades.isNotEmpty)) {
//         podeEditar = true;
//       }
//     }
//
//     if(podeEditar || isSubItens) {
//       return Row(
//         children: [
//           Expanded(
//             flex: 8,
//             child: Container(),
//           ),
//           Expanded(
//             flex: 74,
//             child: Wrap(children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 10, bottom: 10),
//                 child:
//                 isSubItens ?
//                 Text(
//                   StringUtils.montaDescricaoSubItensAuto(
//                       widget.produtoCarrinho.notaItem, isValorItemTotal: false),
//                   style: TextStyle(fontSize:  defaultTargetPlatform == TargetPlatform.windows ? FontUtils.h4(context) : FontUtils.h3(context) ),
//                 ):
//                 Text(""),
//               )
//             ]),
//           ),
//           Expanded(
//             flex: 7,
//             child: podeEditar? _botaoEditar() : Container(),
//           ),
//           Expanded(flex: 12,child: Container())
//         ],
//       );
//     }else{
//       return Container();
//     }
//   }
// }
