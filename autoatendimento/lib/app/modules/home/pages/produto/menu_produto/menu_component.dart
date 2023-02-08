import 'package:autoatendimento/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:models/model/models.dart';

import '../../../../../utils/style_utils.dart';
import 'menu_controller.dart';

class MenuComponent {

  late BuildContext context;
  AppController appController = Modular.get();
  MenuController menuController = Modular.get();

  initialize(BuildContext context) {
  this.context = context;
  }

  Widget body () {
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
          child: Row(
            children: [
              Expanded(
                flex: 75,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 18),
                            child: Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0
                                ),
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
                              width: 728,
                              height: 216,
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
                            height: 32,
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 32,
                            runSpacing: 32,
                            children: listaWrap(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 30,
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                     color: Color.fromRGBO(249, 77, 24, 1),
                      child: Padding(
                        padding: EdgeInsets.only(top:64),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> listaWrap() {
    List<Widget> listWrap = [];
    if (appController.listCardapioMenu.isNotEmpty) {
      for (CardapioMenu cardapioMenu in appController.listCardapioMenu) {
        print(cardapioMenu.descricao);
        listWrap.add(_cardMenu(cardapioMenu));
      }
    } else {
      listWrap = [];
    }
    return listWrap;
  }

  Widget _cardMenu(CardapioMenu cardapioMenu) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () {
         menuController.confirmarMenu(cardapioMenu);
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 20,
                  right: 50,
                  top: 160,
                  bottom: 5),
              child: Text( cardapioMenu.descricao!,
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
      width: 352,
      height: 222,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            fit: BoxFit.fill,
            image:
            AssetImage('assets/no-image.png')),
        border: Border.all(
          width: 4,
          color: Color.fromRGBO(249, 77, 24, 1),
        ),
      ),
    );
  }
}