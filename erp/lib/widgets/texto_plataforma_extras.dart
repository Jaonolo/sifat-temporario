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
          fontSize: 19,
          color: Color(0xFF0D0D0D),
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        )
    );
  }
}
