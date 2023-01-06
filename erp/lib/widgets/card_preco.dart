import 'package:erp/widgets/formatter_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'card_preco_button.dart';

class CardPreco extends StatelessWidget {
  final bool elevated;
  final String? label;
  final String? labelAdicional;
  final int quantidade;
  final double preco;
  final VoidCallback menorCallback;
  final VoidCallback maiorCallback;
  final bool calcularTotal;

  const CardPreco({
    Key? key,
    required this.quantidade,
    required this.preco,
    required this.maiorCallback,
    required this.menorCallback,
    this.elevated = false,
    this.calcularTotal = false,
    this.label,
    this.labelAdicional,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Card(
        color: Color.fromRGBO(250, 250, 250, 255),
        elevation: elevated ? 5 : 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: label != null,
                child: Text(
                  label ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Color.fromRGBO(13, 13, 13, 1),
                  ),
                ),
              ),


              Row(
                children: [
                  CardPrecoButton(
                    onPressed: menorCallback,
                    label: '-',
                    fontSize: 26,
                  ),
                  Text('$quantidade',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Color.fromRGBO(13, 13, 13, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CardPrecoButton(
                    onPressed: maiorCallback,
                    label: '+',
                    fontSize: 96,
                  ),
                ],
              ),

              Text(
                labelAdicional ?? '',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Color.fromRGBO(13, 13, 13, 1),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20, right: 10,),
                constraints: BoxConstraints(minWidth: 70),
                child: Text(FormatterHelper.formatCurrency(
                    calcularTotal ? preco * quantidade : preco,),
                  style: TextStyle(

                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                    decorationColor: Color.fromRGBO(13, 13, 13, 1),
                    decorationThickness: 1,
                ),

                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
