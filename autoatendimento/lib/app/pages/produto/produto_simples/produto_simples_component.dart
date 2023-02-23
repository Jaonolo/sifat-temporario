import 'package:autoatendimento/app/icons_auto_atendimento/icons/icons_auto_atendimento.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../rotas_pages/rotas_pages.dart';
import '../../carrinho/carrinho_widget.dart';
import 'produto_simples_controller.dart';

class ProdutoSimplesComponent {
  final ProdutoSimplesController controller = Get.find();
  late BuildContext context;
  late double _height;
  late double _width;
  late var _orientation;
  var count = 0.obs;

  initialize(BuildContext context) {
    this.context = context;

    _height = MediaQuery.of(context).size.height;
    print(_height);
    _width = MediaQuery.of(context).size.width;
    print(_width);
    _orientation = MediaQuery.of(context).orientation;
  }

  body() {
    print("Reconstruiu CORPO");
    return SafeArea(
      child: Stack(children: [
        Positioned(
            child: Container(
          color: Color.fromRGBO(246, 246, 246, 1),
        )),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 65,
              ),
              child: IconButton(
                icon: Icon(
                  IconsArrowCarrinho.arrowback,
                  size: 55,
                  color: Color.fromRGBO(249, 77, 24, 1),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 340),
              child: Text(
                'Lanches',
                style: GoogleFonts.righteous(
                  fontSize: 60,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(235, 76, 27, 1),
                ),
              ),
            ),
          ],
        ),
        Positioned(left: 33, top: 120, child: ItensSimples()),
        Positioned(right: 0, child: CarrinhoWidget()),
      ]),
    );
  }

  ItensSimples() {
    // TAMANHO E DISTRIBUIÇÃO DOS CARDS
    return Padding(
      padding: EdgeInsets.only(right: _width / 10),
      child: Container(
        height: _height / 1.25,
        width: _width / 1.16,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _orientation == Orientation.portrait ? 2 : 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.85,
            ),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              //CARD E SUAS FUNÇÕES
              return GestureDetector(
                onTap: () => {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Color.fromRGBO(249, 77, 24, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      title: Container(
                        width: _width / 1.4,
                        height: _height / 1.35,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Container(
                                width: _width / 4,
                                height: _height / 2.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(155),
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage('assets/lanche.png')),
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Container(
                                  width: _width / 7,
                                  height: _height / 14,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            IconsAutoCarrinho.minus,
                                            color:
                                                Color.fromRGBO(235, 76, 27, 1),
                                          ),
                                          onPressed: () {
                                            count--;
                                          },
                                        ),
                                        Obx(
                                          () => Text(
                                            "$count",
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Color.fromRGBO(13, 13, 13, 1),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            IconsAutoCarrinho.plus,
                                            color:
                                                Color.fromRGBO(235, 76, 27, 1),
                                          ),
                                          onPressed: () {
                                            count++;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        width: _width / 4,
                                        height: _height / 9,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Cancelar',
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () => Get.back(),
                                    ),
                                    SizedBox(width: 30),
                                    GestureDetector(
                                      child: Container(
                                        width: _width / 4,
                                        height: _height / 9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Adicionar ao carrinho',
                                            style: GoogleFonts.sourceSansPro(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(
                                                  249, 77, 24, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      elevation: 0,
                    ),
                  ),
                },
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromRGBO(249, 77, 24, 1),
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 280, top: 12),
                            child: Icon(
                                IconsPlusCard.plus2,
                                size: 55,
                                color: Color.fromRGBO(235, 76, 27, 1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Container(
                                width: _width / 6.5,
                                height: _height / 4,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/lanche.png')),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'X-Egg',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(46, 46, 46, 1),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: Text(
                                'R\$25,00',
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(0, 150, 93, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 28),
                          child: Text(
                            'Ovo com alface, tomate, queijo e hamburguer',
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(75, 75, 75, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
