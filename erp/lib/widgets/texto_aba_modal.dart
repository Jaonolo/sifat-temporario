import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextoAbaModal extends StatelessWidget {
  // const TextoAbaModal({Key? key}) : super(key: key);

  final String texto;

  const TextoAbaModal({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
        style: GoogleFonts.sourceSansPro(
          fontSize: 17,
          color: Color(0xFF0D0D0D),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        )
      );
  }
}
