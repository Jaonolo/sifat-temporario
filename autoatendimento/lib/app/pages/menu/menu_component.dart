
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../rotas_pages/rotas_pages.dart';
import '../carrinho/carrinho_widget.dart';
import '../produto/produto_simples/produto_simples_page.dart';

class MenuComponent {
  late BuildContext context;

  initialize(BuildContext context) {
    this.context = context;
  }

  bool itens = false;

  Widget body() {
    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;
    print(largura);
    print(altura);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 80,
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Container(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0),
                                    onPressed: () {},
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 25,
                                              right: 20,
                                              top: 145,
                                              bottom: 5),
                                          child: Text(
                                            'Promoção do dia',
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 40,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  width: largura / 1.74,
                                  height: altura / 3.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage('assets/no-image.png')),
                                    border: Border.all(
                                      width: 4,
                                      color: Color.fromRGBO(249, 77, 24, 1),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Wrap(
                                runSpacing: altura / 27,
                                spacing: largura / 40,
                                direction: Axis.horizontal,
                                children: [
                                  Container(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ),
                                      onPressed: () {Get.toNamed(Routes.SIMPLES);},
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20,
                                                right: 50,
                                                top: 160,
                                                bottom: 5),
                                            child: Text(
                                              'Lanches',
                                              style: GoogleFonts.sourceSansPro(
                                                fontSize: 40,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    width: largura / 3.64,
                                    height: altura / 3.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/no-image.png')),
                                      border: Border.all(
                                        width: 4,
                                        color: Color.fromRGBO(249, 77, 24, 1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ),
                                      onPressed: () {},
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20,
                                                right: 50,
                                                top: 160,
                                                bottom: 5),
                                            child: Text(
                                              'Combos',
                                              style: GoogleFonts.sourceSansPro(
                                                fontSize: 40,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    width: largura / 3.64,
                                    height: altura / 3.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/no-image.png')),
                                      border: Border.all(
                                        width: 4,
                                        color: Color.fromRGBO(249, 77, 24, 1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ),
                                      onPressed: () {},
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20,
                                                right: 50,
                                                top: 160,
                                                bottom: 5),
                                            child: Text(
                                              'Bebidas',
                                              style: GoogleFonts.sourceSansPro(
                                                fontSize: 40,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    width: largura / 3.64,
                                    height: altura / 3.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/no-image.png')),
                                      border: Border.all(
                                        width: 4,
                                        color: Color.fromRGBO(249, 77, 24, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: largura / 3.62,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  itens
                      ? CarrinhoWidget()
                      : Container(
                        height: double.infinity,
                        width: largura / 3.5,
                        color: Color.fromRGBO(249, 77, 24, 1),
                        child: Padding(
                          padding: EdgeInsets.only(top: 64),
                          child: Text(
                            'Seu carrinho está vazio escolha um produto',
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// List<Widget> listaWrap() {
//   List<Widget> listWrap = [];
//   var appController;
//   if (appController.listCardapioMenu.isNotEmpty) {
//     var appController;
//     for (CardapioMenu cardapioMenu in appController.listCardapioMenu) {
//       print(cardapioMenu.descricao);
//       listWrap.add(_cardMenu(cardapioMenu));
//     }
//   } else {
//     listWrap = [];
//   }
//   return listWrap;
// }

// Widget _cardMenu(CardapioMenu cardapioMenu) {
//
//   var largura = MediaQuery.of(context).size.width;
//   var altura = MediaQuery.of(context).size.height;
//   print(largura);
//   print(altura);
//
//   return Container(
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       onPressed: () {},
//       child: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//                 left: 20,
//                 right: 50,
//                 top: 160,
//                 bottom: 5),
//             child: Text( 'Ola',
//               style: GoogleFonts.sourceSansPro(
//                 fontSize: 40,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//     width: largura / 3.64,
//     height: altura / 3.4,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(16),
//       image: DecorationImage(
//           fit: BoxFit.fill,
//           image:
//           AssetImage('assets/no-image.png')),
//       border: Border.all(
//         width: 4,
//         color: Color.fromRGBO(249, 77, 24, 1),
//       ),
//     ),
//   );
// }
}
