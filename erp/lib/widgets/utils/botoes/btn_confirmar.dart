import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_theme.dart';

class BtnConfirmar extends StatelessWidget {
  final VoidCallback onPressed;

  const BtnConfirmar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(22, 156, 52, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Text(
          textAlign: TextAlign.end,
          'Confirmar',
          style: GoogleFonts.sourceSansPro(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppTheme.buttomModalConfirmar,
            letterSpacing: 0.25,
          ),
        ),
      ),
    );
  }
}
