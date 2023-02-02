import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextoPlataformaExtras extends StatelessWidget {
  // const TextoAbaModal({Key? key}) : super(key: key);

  final String texto;

  const TextoPlataformaExtras({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        texto,
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          color: Color.fromRGBO(13, 13, 13, 1),
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        )
    );
  }
}
