import 'package:autoatendimento/novo_auto_atendimento/pages/pedido_viagem/pedido_viagem_page.dart';
import 'package:autoatendimento/novo_auto_atendimento/pages/toque_comecar/toque_comecar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../rotas_pages/rotas_pages.dart';

class ToqueComecarComponent {
  final ToqueComecarController controller = Get.find();
  late BuildContext context;

  initialize(BuildContext context) {
    this.context = context;
  }

  Widget body() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.4), BlendMode.softLight),
          image: NetworkImage(
              'https://www.montarumnegocio.com/wp-content/uploads/2021/11/Como-montar-um-restaurante-de-comida-caseira.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
            child: Container(),
          ),
          Column(
            children: [
              Container(
                child: Transform.scale(
                  scale: 1.1,
                  child: Image.asset('assets/way_chef_inicio.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 58),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromRGBO(249, 77, 24, 1),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.ESCOLHAOPCAO);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Toque na tela para começar',
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 41,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FractionalTranslation(
                      translation: Offset(4.1, 0.65),
                      child: Image.asset('assets/hand.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
