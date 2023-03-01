import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';


class CardPrecoButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String label;
  final double fontSize;

  const CardPrecoButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.fontSize = 24,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label,
        style: TextStyle(
          color: AppTheme.adicionar,
          fontWeight: FontWeight.w800,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        elevation: 0,
        backgroundColor: Colors.white
      ),
    );
  }
}
