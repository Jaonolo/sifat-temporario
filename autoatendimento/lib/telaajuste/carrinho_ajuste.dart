import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = true;
  bool _visible = true;
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    print("Passou pelo build");
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.centerRight,
          // **** ABAIXO ESTA O WIDGET QUE FAZ A ANIMAÇÃO DE ABRIR E FECHAR ****
          child: AnimatedContainer(
            width: selected ? _height / 7 : _width / 2.3,
            height: selected ? _height : _height,
            color: Color.fromRGBO(249, 77, 24, 1),
            alignment: selected
                ? Alignment.centerRight
                : AlignmentDirectional.centerEnd,
            duration: const Duration(milliseconds: 400),
            curve: Curves.decelerate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: selected,
                  maintainSemantics: false,
                  maintainInteractivity: false,
                  maintainState: false,
                  maintainSize: false,
                  // ****** A FUNÇÃO ABAIXO ELA TROCA O ICONE PELO CONTAINER COM A LISTA DE ITENS E AS DEMAIS FUNCIONALIDADES SEGUINTES  ******
                  replacement: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 26, right: 11, bottom: 50),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 88,
                              child: Text(
                                'Meu Carrinho',
                                style: GoogleFonts.righteous(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              height: 86,
                              width: 86,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    Future.delayed(Duration(seconds: 1))
                                        .then((value) {
                                      _visible = !_visible;
                                    });
                                    selected = !selected;
                                  });
                                },
                                child: Image(
                                  image: AssetImage('assets/x.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 513,
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 16, left: 36, bottom: 2),
                                  child: Text(
                                    'Para Viagem',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 35, right: 37, bottom: 21),
                              child: Divider(thickness: 1),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25, bottom: 8),
                                      child: Container(
                                        width: 419,
                                        height: 46,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color:
                                              Color.fromRGBO(245, 245, 245, 1),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 13,
                                                right: 8.6,
                                              ),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/lixeira.png'),
                                              ),
                                            ),
                                            Text(
                                              '1',
                                              style: GoogleFonts.sourceSansPro(
                                                fontSize: 24,
                                                color: Color.fromRGBO(
                                                    94, 94, 94, 1),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8, right: 12),
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/adição.png'),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'X Burguer',
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      94, 94, 94, 1),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 11),
                                              child: Text(
                                                'R\$25,00',
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  fontSize: 18,
                                                  color: Color.fromRGBO(
                                                      0, 150, 93, 1),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 35, right: 59),
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Limpar Carrinho',
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 16,
                                        color: Color.fromRGBO(231, 74, 59, 1),
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Total: R\$25,00',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 24,
                                      color: Color.fromRGBO(0, 150, 93, 1),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 45),
                        child: Container(
                          width: 513,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Pagar',
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 30,
                                color: Color.fromRGBO(249, 77, 24, 1),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Container(
                          width: 513,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Cancelar pedido',
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // **** ABAIXO ESTÁ O PRIMEIRO WIDGET(BOTÃO) QUE IRÁ DESAPARECER QUANDO FOR CLICADO ****
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 86,
                          width: 86,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                Future.delayed(Duration(seconds: 1))
                                    .then((value) {
                                  _visible = !_visible;
                                });
                                selected = !selected;
                              });
                            },
                            child: Image(
                              image: AssetImage(
                                'assets/cart.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
