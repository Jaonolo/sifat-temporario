import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_theme.dart';

class TextoCustomizadoFormField extends StatefulWidget {
  final String label;
  final List<TextInputFormatter>? inputFormatters;

  const TextoCustomizadoFormField({
    Key? key,
    required this.label,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<TextoCustomizadoFormField> createState() => _TextoCustomizadoFormFieldState();
}

class _TextoCustomizadoFormFieldState extends State<TextoCustomizadoFormField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextFormField(
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: Color(0xFF49454F),
        ),
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: AppTheme.adicionar,),
          // ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: AppTheme.adicionar,),
          ),
          labelStyle: TextStyle(color: AppTheme.adicionar,),
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            labelText: widget.label,
            isDense: true,
            border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(4),

              borderSide: BorderSide(color: AppTheme.adicionar,),
            )
        ),
      ),
    );
  }
}
