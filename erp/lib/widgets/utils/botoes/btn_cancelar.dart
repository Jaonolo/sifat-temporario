import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BtnCancelar extends StatelessWidget {
  final VoidCallback onPressed;

  const BtnCancelar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Color.fromRGBO(186, 26, 26, 1),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Text(
          textAlign: TextAlign.end,
          'Cancelar',
          style: GoogleFonts.sourceSansPro(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(186, 26, 26, 1),
            letterSpacing: 0.25,
          ),
        ),
      ),
    );
  }
}
