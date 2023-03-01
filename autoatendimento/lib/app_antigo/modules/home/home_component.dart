// import 'package:autoatendimento/app/app_controller.dart';
// import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
// import 'package:autoatendimento/app/modules/home/widgets/botao_secundario.dart';
// import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
// import 'package:autoatendimento/app/modules/home/widgets/cardapio/build_card_cardapio.dart';
// import 'package:autoatendimento/app/modules/home/widgets/carrinho/card_item_carrinho.dart';
// import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
// import 'package:autoatendimento/app/theme/default_theme.dart';
// import 'package:autoatendimento/app/utils/font_utils.dart';
// import 'package:autoatendimento/app/utils/style_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:models/model/enum/clients.dart' as c;
// import 'package:models/model/models.dart';
//
// import 'home_controller.dart';
//
// class HomeComponent {
//   final HomeController controller = Modular.get();
//   final VendaController vendaController = Modular.get();
//   final AppController appController = Modular.get();
//
//   late BuildContext context;
//   late Orientation orientation;
//   final ScrollController scrollMenu = ScrollController();
//   final ScrollController scrollCarrinho = ScrollController();
//   GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
//
//   initialize(BuildContext context) {
//     orientation = MediaQuery.of(context).orientation;
//     appController.globalKey = key;
//
//     this.context = context;
//     controller.addPalco(
//       cardapio(c: context),
//     );
//   }
//
//   AppBar appBar() {
//     return AppBar(
//         elevation: 0.0,
//         leading: Container(),
//         backgroundColor: DefaultTheme.accentColor,
//         toolbarHeight: FontUtils.h1(context) * 2.5,
//         title: InkWell(
//             onTap: () => vendaController.resumo(),
//             child: Center(
//                 child: Image.asset(
//               'assets/waychef_autoatendimento_branco.png',
//               width: FontUtils.h1(context) * 4.6,
//             ))));
//   }
//
//   Widget body() {
//     //Estrutura Cardapio - Palco - Carrinho, um ao lado do outro apenas se estiver em landscape
//     return orientation == Orientation.landscape
//         ? Column(
//             children: [
//               //Estrutura do meio que contém menu lateral + palco (52% da tela)
//               // Caso a tela tenha uma largura maior que 1081
//               // Vai expandir o menu lateral até o fim dela
//               Expanded(
//                 flex: 65,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 15,
//                       child: _opcoesMenu(),
//                     ),
//                     // chama o menu lateral
//                     Expanded(
//                       flex: 60,
//                       child: _palco(),
//                     ),
//                     Observer(
//                       builder: (_) {
//                         return Expanded(
//                             flex: 35,
//                             child: vendaController.itensLancados.length > 0
//                                 ? !controller.habilitarCarrinho
//                                     ? _carinho()
//                                     : Stack(children: [
//                                         _carinho(),
//                                         Opacity(
//                                           opacity: 0.6,
//                                           child: Container(
//                                             color: Colors.grey,
//                                           ),
//                                         )
//                                       ])
//                                 : _carinhoVazio());
//
//                         // 1 - Verifica se o carinho esta vazio
//                         // 2 - Verifica se tem algum palco alem do cardapio aberto, se tiver nao deixa mexer no carrinho
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           )
//         : Column(
//             children: [
//               //Estrutura do meio que contém menu lateral + palco (52% da tela)
//               // Caso a tela tenha uma largura maior que 1081
//               // Vai expandir o menu lateral até o fim dela
//               Expanded(
//                 flex: 65,
//                 child: Row(
//                   children: [
//                     Expanded(flex: 20, child: _opcoesMenu()),
//                     // chama o menu lateral
//                     Expanded(flex: 80, child: _palco()),
//                   ],
//                 ),
//               ),
//               Observer(
//                 builder: (_) {
//                   if (controller.apareceCarrinho) {
//                     return Expanded(
//                         flex: 35,
//                         child: vendaController.itensLancados.length > 0
//                             ? !controller.habilitarCarrinho
//                                 ? _carinho()
//                                 : Stack(children: [
//                                     _carinho(),
//                                     Opacity(
//                                       opacity: 0.6,
//                                       child: Container(
//                                         color: Colors.grey,
//                                       ),
//                                     )
//                                   ])
//                             : _carinhoVazio());
//                   }
//                   return const SizedBox();
//                   // 1 - Verifica se o carinho esta vazio
//                   // 2 - Verifica se tem algum palco alem do cardapio aberto, se tiver nao deixa mexer no carrinho
//                 },
//               ),
//             ],
//           );
//   }
//
//   //Menu de Opções
//   Widget _opcoesMenu() {
//     return Container(
//         color: DefaultTheme.accentColor,
//         child: (appController.listCardapioMenu.isNotEmpty)
//             ? ListView.builder(
//                 controller: scrollMenu,
//                 scrollDirection: Axis.vertical,
//                 itemCount: appController.listCardapioMenu.length,
//                 itemBuilder: (c, index) {
//                   var menu = appController.listCardapioMenu[index];
//                   return _menu(menu);
//                 },
//               )
//             : const SizedBox());
//   }
//
//   Widget _menu(CardapioMenu menu) {
//     return InkWell(
//       onTap: () {
//         if (controller.palco.isNotEmpty) controller.palco.clear();
//         controller.habilitarCarrinho = false;
//         appController.reiniciaTimer();
//         controller.changeMenuSelecionado(menu);
//         controller.addPalco(
//           cardapio(c: context),
//         );
//       },
//       child: Observer(
//         builder: (_) {
//           return Container(
//             height: FontUtils.h1(context) * 3,
//             decoration: BoxDecoration(
//                 color: (controller.menuSelecionado == menu)
//                     ? DefaultTheme.vermelho
//                     : Colors.transparent),
//             child: Stack(children: [
//               Column(
//                 children: [
//                   Expanded(child: Container()),
//                   Expanded(
//                     flex: 4,
//                     child: (menu.icone != null && menu.icone!.urlPng != null)
//                         ? Image.network(
//                             '${menu.icone!.urlPng}',
//                             fit: BoxFit.fill,
//                             height: double.maxFinite,
//                             color: DefaultTheme.branco,
//                           )
//                         : Icon(Icons.image, color: DefaultTheme.branco),
//                   ),
//                   Expanded(child: Container()),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 4.0),
//                     child: Text(menu.descricao!.toUpperCase(),
//                         textAlign: TextAlign.center,
//                         softWrap: true,
//                         style: TextStyle(
//                             color: DefaultTheme.branco,
//                             fontSize: orientation == Orientation.landscape
//                                 ? FontUtils.h3(context) * 1.2
//                                 : FontUtils.h3(context))),
//                   ),
//                   Expanded(child: Container()),
//                 ],
//               ),
//               if (controller.menuSelecionado == menu)
//                 Positioned(
//                   right: 0,
//                   top: FontUtils.h1(context),
//                   child: RotatedBox(
//                     quarterTurns: 1,
//                     child: SizedBox(
//                       height: FontUtils.h1(context) * 0.5,
//                       width: FontUtils.h1(context) * 0.5,
//                       child: ClipPath(
//                         clipper: TriangleClipper(),
//                         child: Container(
//                           height: 10,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//             ]),
//           );
//         },
//       ),
//     );
//   }
//
//   //Cardapio de Produtos
//   Widget _palco() {
//     return Observer(
//       builder: (_) {
//         if (controller.palco.isNotEmpty) {
//           return controller.palco.last;
//         }
//         return Container();
//       },
//     );
//   }
//
//   //cardapio compartilhado quando o item possui variaçoes abre o mesmo widget com validaçoes
//   // sempre passa o context para definir tamanho da letra
//   Widget cardapio({ProdutoEmpresa? produtoEmpresa, required BuildContext c}) {
//     List<GradeEmpresa> gradeAtivas = [];
//     if (produtoEmpresa != null) {
//       produtoEmpresa.gradesAtivas.forEach((element) {
//         gradeAtivas.add(element);
//       });
//     }
//     orientation = MediaQuery.of(c).orientation;
//     return orientation == Orientation.landscape
//         ? Row(
//             children: [
//               Expanded(flex: 1, child: Container()),
//               Expanded(
//                 flex: 10,
//                 child: Column(
//                   children: [
//                     Expanded(
//                         flex: 10,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             if (produtoEmpresa != null)
//                               BotaoSetaVoltar(function: () {
//                                 controller.removePalco();
//                               }),
//                             Expanded(
//                               child: Text(
//                                 (produtoEmpresa != null)
//                                     ? produtoEmpresa.produto!.descricao!
//                                     : controller.menuSelecionado.descricao!
//                                         .toUpperCase(),
//                                 style: TextStyle(
//                                   color: DefaultTheme.preto,
//                                   fontSize: FontUtils.h1(c),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                     Expanded(
//                       child: Container(),
//                     ),
//                     Expanded(
//                       flex: 85,
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         childAspectRatio: 1.50,
//
//                         // altura da gridView
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                         children: (produtoEmpresa != null)
//                             ? List.generate(gradeAtivas.length, (index) {
//                                 return BuildCardCardapio.create(
//                                     produtoEmpresa: produtoEmpresa,
//                                     gradeEmpresa: gradeAtivas[index],
//                                     context: c);
//                               })
//                             : List.generate(
//                                 controller.menuSelecionado.itens.length,
//                                 (index) {
//                                 return BuildCardCardapio.create(
//                                     produtoEmpresa:
//                                         controller.menuSelecionado.itens[index],
//                                     context: context);
//                               }),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(flex: 1, child: Container()),
//             ],
//           )
//         : Row(
//             children: [
//               Expanded(flex: 1, child: Container()),
//               Expanded(
//                 flex: 84,
//                 child: Column(
//                   children: [
//                     Expanded(
//                         flex: 15,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             if (produtoEmpresa != null)
//                               BotaoSetaVoltar(function: () {
//                                 controller.removePalco();
//                                 controller.habilitarCarrinho = false;
//                               }),
//                             Expanded(
//                               child: Text(
//                                 (produtoEmpresa != null)
//                                     ? produtoEmpresa.produto!.descricao!
//                                     : controller.menuSelecionado.descricao!
//                                         .toUpperCase(),
//                                 style: TextStyle(
//                                   color: DefaultTheme.preto,
//                                   fontSize: FontUtils.h1(c),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                     Expanded(
//                       child: Container(),
//                     ),
//                     Expanded(
//                       flex: 85,
//                       child: Padding(
//                         padding: const EdgeInsets.all(1.5),
//                         child: Scrollbar(
//                           radius: Radius.circular(10),
//                           trackVisibility: true,
//                           isAlwaysShown: true,
//                           child: GridView.count(
//                             crossAxisCount: 2,
//                             childAspectRatio: 0.95,
//                             // altura da gridView
//                             crossAxisSpacing: 40,
//                             mainAxisSpacing: 30,
//                             children: (produtoEmpresa != null)
//                                 ? List.generate(gradeAtivas.length, (index) {
//                                     return BuildCardCardapio.create(
//                                         produtoEmpresa: produtoEmpresa,
//                                         gradeEmpresa: gradeAtivas[index],
//                                         context: c);
//                                   })
//                                 : List.generate(
//                                     controller.menuSelecionado.itens.length,
//                                     (index) {
//                                     return BuildCardCardapio.create(
//                                         produtoEmpresa:
//                                             controller.menuSelecionado.itens[index],
//                                         context: context);
//                                   }),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(flex: 8, child: Container()),
//             ],
//           );
//   }
//
//   Widget _carinho() {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border(
//               left: BorderSide(
//         color: Colors.grey.shade300,
//         width: 5,
//       ))),
//       child: Observer(
//         builder: (_) {
//           return Column(
//             children: [
//               Expanded(
//                 flex: 70,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: Container(),
//                     ),
//                     Expanded(
//                       flex: 98,
//                       child: Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: Scrollbar(
//                           radius: Radius.circular(10),
//                           trackVisibility: true,
//                           isAlwaysShown: true,
//                           child: ListView.builder(
//                             padding: EdgeInsetsDirectional.only(end: 5),
//                             scrollDirection: Axis.vertical,
//                             controller: scrollCarrinho,
//                             itemCount: vendaController.itensLancados.length,
//                             itemBuilder: (c, index) {
//                               var produtoCarrinho =
//                                   vendaController.itensLancados[index];
//                               return CardItemCarrinho(produtoCarrinho, index);
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 10,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: SizedBox(),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Text(
//                         'TOTAL: R\$ ${vendaController.nota.valorTotal!.toStringAsFixed(2)}',
//                         style: TextStyle(fontSize: FontUtils.h2(context)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               if (orientation == Orientation.landscape) ...[
//                 Expanded(
//                   flex: 20,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       BotaoPrimario(
//                           descricao: 'CONFIRMAR PEDIDO',
//                           function: () {
//                             controller.onConfirmar();
//                           }, largura: 0.25),
//                       BotaoSecundario(
//                           context: context,
//                           descricao: 'CANCELAR',
//                           function: () {
//                             controller.recomecar();
//                           }, largura: 0.25),
//                     ],
//                   ),
//                 ),
//               ],
//               if (orientation == Orientation.portrait) ...[
//                 Expanded(
//                   flex: 20,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       BotaoSecundario(
//                           context: context,
//                           descricao: 'CANCELAR',
//                           function: () {
//                             controller.recomecar();
//                           }),
//                       BotaoPrimario(
//                           descricao: 'CONFIRMAR PEDIDO',
//                           function: () {
//                             controller.onConfirmar();
//                           }),
//                     ],
//                   ),
//                 ),
//               ]
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _carinhoVazio() {
//     Border boder;
//     if (orientation == Orientation.landscape) {
//       boder = Border(
//           left: BorderSide(
//         color: Colors.grey.shade300,
//         width: 5,
//       ));
//     } else {
//       boder = Border(
//           top: BorderSide(
//         color: Colors.black,
//         width: 5,
//       ));
//     }
//
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//               image: StyleUtils.fundoTransparencia(), border: boder),
//           child: Column(
//             children: [
//               Expanded(flex: 2, child: Container()),
//               Text(
//                 'SEU CARRINHO DE COMPRAS',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     shadows: [
//                       StyleUtils.shadowDefault(),
//                     ],
//                     fontSize:
//                         FontUtils.h2(context)),
//               ),
//               Expanded(child: Container()),
//               Text("VOCÊ AINDA NÃO FEZ NENHUM PEDIDO",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       shadows: [StyleUtils.shadowDefault()],
//                       fontSize: FontUtils.h2(context))),
//               Expanded(child: Container()),
//               Expanded(flex: 2, child: Container()),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: BotaoSecundario(
//                     context: context,
//                     descricao: "CANCELAR",
//                     function: () => controller.recomecar(),
//                     largura: 0.20),
//               ),
//               Expanded(flex: 2, child: Container()),
//
//               //LOGO DA WAYBE, PEDIDO PARA OCULTAR
//
//               // Column(
//               //   mainAxisAlignment: MainAxisAlignment.start,
//               //   crossAxisAlignment: CrossAxisAlignment.start,
//               //   children: [
//               //     Text(
//               //       'DESENVOLVIDO POR',
//               //       textAlign: TextAlign.left,
//               //       style: TextStyle(fontSize: FontUtils.h4(context)),
//               //     ),
//               //     Image.asset(
//               //       'assets/logo_waybe.png',
//               //       height: FontUtils.h1(context) * 0.75,
//               //     ),
//               //   ],
//               // ),
//               Expanded(flex: 2, child: Container())
//             ],
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomRight,
//           child: Padding(
//             padding: const EdgeInsets.only(
//               bottom: 16,
//               right: 16,
//             ),
//             child: Text(
//               " v.${c.Clients.AUTOATENDIMENTO.versao}",
//               style: TextStyle(
//                   shadows: [StyleUtils.shadowDefault()],
//                   fontSize: FontUtils.h4(context)),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
