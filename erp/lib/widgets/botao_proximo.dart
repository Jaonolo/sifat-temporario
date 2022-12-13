import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class BotaoPadraoProximo extends StatelessWidget {
  final String texto;

  final Color? corTexto;
  final Function acao;

  const BotaoPadraoProximo(
      {required this.texto, required this.acao, this.corTexto});

  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFF5722),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      ),
      onPressed: () {
        acao.call();
      },
      child: Text(
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
