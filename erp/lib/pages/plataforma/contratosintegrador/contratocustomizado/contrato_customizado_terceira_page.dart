import 'package:auto_size_text/auto_size_text.dart';
import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_change/status_change.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/botao_padrao.dart';
import '../../../../widgets/responsive.dart';

// import '../../../theme/app_theme.dart';
// import '../../../widgets/botao_padrao.dart';
// import '../../../widgets/botao_proximo.dart';
// import '../../../widgets/expanded_lista.dart';
// import '../../../widgets/responsive.dart';

class ContratoCustomizadoTerceiraPage extends StatelessWidget {
  const ContratoCustomizadoTerceiraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//------------ VARIAVEIS------------
    Size _size = MediaQuery.of(context).size;
//------------ EstruturaPrincipal
    return Scaffold(
      body: Responsive(
        mobile: Container(
          height: 200,
          width: 200,
          color: Colors.amber,
        ),
        desktop: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Cadastrar contrato customizado',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w400,
                    fontSize: 46,
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Plano Diamante',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w400,
                    fontSize: 46,
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 36,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 32, 8, 32),
              color: Color(0xFFE9F1FF),
              child: Text(
                'Valores',
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Valor mensal',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          letterSpacing: 0.15,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'R\$ 45.90',
                            style: GoogleFonts.sourceSansPro(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xFF0D0D0D),
                            ),
                          )),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            Row(
              children: [
                Text(
                  'Empresas',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                    letterSpacing: 0.15,
                  ),
                ),
                Expanded(child: Container()),
                _btnProrrogarContrato(),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            const SizedBox(
              height: 36,
            ),


            const SizedBox(
              height: 36,
            ),


            Wrap(

              alignment: WrapAlignment.center,
              // direction: Axis.horizontal,
              spacing: 51,
              runSpacing: 25,
              children: <Widget>[

                Card(
                  child:  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: Color(0xFFFF5722),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          textAlign: TextAlign.end,
                          'Lorem Ipsum é simplesmente',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF5722),
                            letterSpacing: 0.25,
                          ),
                        ),
                        IconButton(
                            onPressed: (){},
                              icon: Icon(
                                Icons.close,
                                color: Color(0xFFFF5722),
                                size: 16,
                              ),
                            // icon: Icon(Icons.close)
                        ),
                      ],
                    ),
                  ),

                  // child: ElevatedButton(
                  //    onPressed: (){
                  //     print("You pressed Icon Elevated Button");
                  //   },
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Text('Lorem Ipsum is simply dummy text of '),
                  //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                  //     ],
                  //   )
                  //
                  //   ),
                  ),
                Card(
                  child:  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: Color(0xFFFF5722),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          textAlign: TextAlign.end,
                          'Lorem Ipsum é simplesmente',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF5722),
                            letterSpacing: 0.25,
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.close,
                            color: Color(0xFFFF5722),
                            size: 16,
                          ),
                          // icon: Icon(Icons.close)
                        ),
                      ],
                    ),
                  ),

                  // child: ElevatedButton(
                  //    onPressed: (){
                  //     print("You pressed Icon Elevated Button");
                  //   },
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Text('Lorem Ipsum is simply dummy text of '),
                  //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                  //     ],
                  //   )
                  //
                  //   ),
                ),
                Card(
                  child:  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: Color(0xFFFF5722),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          textAlign: TextAlign.end,
                          'Lorem Ipsum é simplesmente',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF5722),
                            letterSpacing: 0.25,
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.close,
                            color: Color(0xFFFF5722),
                            size: 16,
                          ),
                          // icon: Icon(Icons.close)
                        ),
                      ],
                    ),
                  ),

                  // child: ElevatedButton(
                  //    onPressed: (){
                  //     print("You pressed Icon Elevated Button");
                  //   },
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Text('Lorem Ipsum is simply dummy text of '),
                  //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                  //     ],
                  //   )
                  //
                  //   ),
                ),
                Card(
                  child:  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: Color(0xFFFF5722),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          textAlign: TextAlign.end,
                          'Lorem Ipsum é simplesmente',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF5722),
                            letterSpacing: 0.25,
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.close,
                            color: Color(0xFFFF5722),
                            size: 16,
                          ),
                          // icon: Icon(Icons.close)
                        ),
                      ],
                    ),
                  ),

                  // child: ElevatedButton(
                  //    onPressed: (){
                  //     print("You pressed Icon Elevated Button");
                  //   },
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Text('Lorem Ipsum is simply dummy text of '),
                  //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                  //     ],
                  //   )
                  //
                  //   ),
                ),
                Card(
                  child:  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: Color(0xFFFF5722),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          textAlign: TextAlign.end,
                          'Lorem Ipsum é simplesmente',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF5722),
                            letterSpacing: 0.25,
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.close,
                            color: Color(0xFFFF5722),
                            size: 16,
                          ),
                          // icon: Icon(Icons.close)
                        ),
                      ],
                    ),
                  ),

                  // child: ElevatedButton(
                  //    onPressed: (){
                  //     print("You pressed Icon Elevated Button");
                  //   },
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Text('Lorem Ipsum is simply dummy text of '),
                  //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                  //     ],
                  //   )
                  //
                  //   ),
                ),
                Card(
                  child:  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: Color(0xFFFF5722),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          textAlign: TextAlign.end,
                          'Lorem Ipsum é simplesmente',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF5722),
                            letterSpacing: 0.25,
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.close,
                            color: Color(0xFFFF5722),
                            size: 16,
                          ),
                          // icon: Icon(Icons.close)
                        ),
                      ],
                    ),
                  ),

                  // child: ElevatedButton(
                  //    onPressed: (){
                  //     print("You pressed Icon Elevated Button");
                  //   },
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Text('Lorem Ipsum is simply dummy text of '),
                  //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                  //     ],
                  //   )
                  //
                  //   ),
                ),
                Card(
                  child:  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: Color(0xFFFF5722),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          textAlign: TextAlign.end,
                          'Lorem Ipsum é simplesmente',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF5722),
                            letterSpacing: 0.25,
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.close,
                            color: Color(0xFFFF5722),
                            size: 16,
                          ),
                          // icon: Icon(Icons.close)
                        ),
                      ],
                    ),
                  ),

                  // child: ElevatedButton(
                  //    onPressed: (){
                  //     print("You pressed Icon Elevated Button");
                  //   },
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Text('Lorem Ipsum is simply dummy text of '),
                  //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                  //     ],
                  //   )
                  //
                  //   ),
                ),
                Card(
                  child:  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: Color(0xFFFF5722),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          textAlign: TextAlign.end,
                          'Lorem Ipsum é simplesmente',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF5722),
                            letterSpacing: 0.25,
                          ),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.close,
                            color: Color(0xFFFF5722),
                            size: 16,
                          ),
                          // icon: Icon(Icons.close)
                        ),
                      ],
                    ),
                  ),

                  // child: ElevatedButton(
                  //    onPressed: (){
                  //     print("You pressed Icon Elevated Button");
                  //   },
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Text('Lorem Ipsum is simply dummy text of '),
                  //       IconButton(onPressed: (){}, icon: Icon(Icons.close))
                  //     ],
                  //   )
                  //
                  //   ),
                ),

              ],
            ),


            const SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _btnFinalizar(),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _btnProrrogarContrato() {
  return BotaoPadrao(
    corIcone: AppTheme.adicionar,
    corTexto: Colors.white,
    texto: 'Adicionar',
    icone: Icons.add,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}

Widget _btnFinalizar() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF169C34),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
    ),
    onPressed: () {},
    child: Text(
      'Finalizar',
      softWrap: false,
      style: GoogleFonts.sourceSansPro(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}

