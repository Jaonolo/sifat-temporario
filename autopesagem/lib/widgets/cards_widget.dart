import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardsWidget extends StatelessWidget {
  String textCampo;
  String valor;
  Color color;

  CardsWidget(
      {required this.textCampo, required this.valor, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "$textCampo",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Roboto'),
          ),
          Text(
            "${valor}".replaceAll(".", ","),
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontFamily: 'Roboto'),
          ),
        ],
      ),
    );
  }
}
