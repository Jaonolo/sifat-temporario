import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:models/model/models.dart';

import '../../../widgets/responsive.dart';

class TELADEERRO extends StatelessWidget {
  const TELADEERRO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(181, 181, 181, 1),
      body: Responsive(
        mobile: Container(),
        desktop: Stack(
          children: [
            _textoPaginaNaoEncontrada(largura, altura),
            _itensCaminhoNaoExiste(largura, altura),
          ],
        ),
      ),
    );
  }


  _textoPaginaNaoEncontrada(largura, altura) {
    return Align(
      alignment: altura >= 391 ? Alignment(0, -0.45) : Alignment(0, -0.70),
      child: Container(
        width: largura / 1.5,
        height: altura / 2.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            'ESSA PÁGINA NÃO FOI \n ENCONTRADA!',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.sourceSansPro(
              fontSize: largura / 22,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(14, 32, 49, 1),
              letterSpacing: -0.5,
            ),
          ),
        ),
      ),
    );
  }

  _itensCaminhoNaoExiste(largura, altura) {
    return Align(
      alignment: Alignment(0, 0.45),
      child: Container(
        width: largura / 2.8,
        height: altura >= 391 ? altura / 3.2 : altura / 2.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromRGBO(14, 32, 49, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textoCaminhoErrado(altura, largura),
              _espacoExpandedContainer(),
              _btnPaginaInicial(altura,largura),
              _espacoExpandedContainer(),
              _rowCodigoeRelatorio(largura, altura),
            ],
          ),
        ),
      ),
    );
  }

  _btnPaginaInicial(altura, largura){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(47, 64, 80, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Página inicial',
            style: GoogleFonts.sourceSansPro(
              fontWeight: FontWeight.w600,
              fontSize: largura / 105,
              letterSpacing: 1.25,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
  }

  _textoCaminhoErrado(altura, largura){
    return Text(
      ' O caminho que você procura está errado ou não existe, para mais detalhes entre em contato com o nosso suporte',
      textAlign: TextAlign.center,
      style: GoogleFonts.sourceSansPro(
        fontSize: largura / 70,
        letterSpacing: 1.25,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
    );
  }

  _espacoExpandedContainer() {
    return Expanded(
      child: Container(),
    );
  }

  _rowCodigoeRelatorio(largura, altura) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: largura / 105,
              letterSpacing: 1.25,
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: 'CÓDIGO DO ERRO: ',
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: '404',
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Color.fromRGBO(14, 32, 49, 1),
          ),
          icon: Icon(
            FontAwesomeIcons.download,
            size: altura >= 391 ? 16 : 12,
            color: Color.fromRGBO(255, 87, 34, 1),
          ),
          label: Text(
            'Baixar Relatório',
            style: GoogleFonts.sourceSansPro(
              color: Color.fromRGBO(255, 87, 34, 1),
              fontSize: largura / 105,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

}
