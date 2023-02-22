import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_theme.dart';


class BtnPadrao extends StatelessWidget {

  final String texto;
  final IconData? icone;
  final Color? corIcone;
  final Color? corTexto;
  final VoidCallback acao;


  const BtnPadrao({
    required this.texto,
    required this.acao,
    this.icone,
    this.corIcone,
    this.corTexto
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: (corIcone != null) ? corIcone : AppTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      ),
      icon: Icon(
        icone,
        color: (corTexto != null) ? corTexto : Colors.white,
        size: AppTheme.h4,
      ),
      onPressed: (){
        acao.call();
      },
      label: Text(
        texto,
        softWrap: false,
        style: GoogleFonts.sourceSansPro(
          fontSize: AppTheme.h4,
          color: (corTexto != null) ? corTexto : Colors.white,
        ),
      ),
    );
  }
}