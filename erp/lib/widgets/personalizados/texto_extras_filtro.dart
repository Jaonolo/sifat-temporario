import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/icons_erp/icons_erpersonalizados.dart';

class TextoExtrasFiltro extends StatelessWidget {
  final VoidCallback onPressed;
  final String texto;
  final int inteiroExpanded;
  final double fontSize;
  final IconData? icone;
  final Color? corIcone;
  final bool naoQuebraTexto;

  const TextoExtrasFiltro({
    Key? key,
    required this.onPressed,
    required this.texto,
    required this.inteiroExpanded,
    this.naoQuebraTexto = false,
    this.fontSize = 19,
    this.icone,
    this.corIcone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: inteiroExpanded,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  texto,
                  softWrap: naoQuebraTexto,
                  // overflow: TextOverflow.fade,
                  style: GoogleFonts.comfortaa(
                    fontSize: width / 70,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 51, 85, 1),
                    letterSpacing: 0.15,
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: onPressed,
              child: Icon(
                  icone,
                  size: 16,
                  color: (corIcone != null)
                      ? corIcone
                      : Color.fromRGBO(0, 51, 85, 1),
                ),
            ),
            Expanded(

                child: SizedBox()),

            // Spacer(),
          ],
        ),
      ),
    );
  }
}
