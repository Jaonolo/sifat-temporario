import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SelecaoDeImagem extends StatelessWidget {
  final String? nome;
  final Image? imagem;
  final Function acao;

  SelecaoDeImagem({
    this.nome,
    this.imagem,
    required this.acao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Color(0xFFFFEDE8),
      elevation: 1,
      child: Container(
         width: Get.width / 4,
         height: 265,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Image.asset("assets/images/plano.png",),

              SizedBox(height: 30,),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(width: 8.0),
                  //TODO: Ler nome do arquivo
                  TextButton(
                    onPressed: () {
                      acao.call();
                    },
                    child: Text( nome!,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w400,
                          fontSize: 33,
                          letterSpacing: -0.5,
                        )
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
}
