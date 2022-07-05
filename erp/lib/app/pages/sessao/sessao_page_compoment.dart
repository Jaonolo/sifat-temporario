import 'package:erp/app/pages/sessao/sessao_controller.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';

class SessaoPageCompoment {
  //-------------------------------------------------- VARIAVEIS ------------------------------------------------------------
  SessaoController controller = SessaoController();


  //-------------------------------------------------- WIDGETS --------------------------------------------------------------
  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<DadosSessaoDTO>>(
        future: controller.buscarSessoes(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            default:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');

              return Text('Meu retorno: ${snapshot.data}');
          }
        },
      ),
    );
  }
}
