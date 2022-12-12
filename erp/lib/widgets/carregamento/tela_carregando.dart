import 'package:flutter/material.dart';
import 'package:erp/widgets/carregamento/icone_carregando.dart';

class TelaCarregando extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      backgroundColor: Colors.transparent,
      child: IconeCarregando(tamanho: 80,),
    );
  }
}
