import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:erp/pages/plataforma/plataforma_page_controller.dart';
import '../theme/app_theme.dart';
import 'utils/botoes/botao_padrao.dart';
import 'responsive.dart';

import 'package:auto_size_text/auto_size_text.dart';



// class PlataformaPage extends GetView<PlataformaPageController> {
//   PlataformaPage({Key? key}) : super(key: key);

// {
//
class ContratoPadraoPage extends StatelessWidget {
  const ContratoPadraoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//------------ VARIAVEIS------------
    Size _size = MediaQuery
        .of(context)
        .size;
//------------ EstruturaPrincipal
    return Scaffold(
      body: Responsive(
        mobile: Container(
          height: 200,
          width: 200,
          color: Colors.amber,
        ),
        desktop: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _btnAdicionar(),
                Expanded(child: Container()),
                _btnSalvar(),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 8,
            ),

          ],
        ),
      ),
    );
  }

//----------- WIDGETS
  Widget _btnSalvar() {
    return BtnPadrao(
      corIcone: AppTheme.sucesso,
      corTexto: Colors.white,
      texto: 'Salvar',
      icone: Icons.save,
      acao: () {
        //TODO: AÇÃO SALVAR
      },
    );
  }

  Widget _btnAdicionar() {
    return BtnPadrao(
      corIcone: AppTheme.adicionar,
      corTexto: Colors.white,
      texto: 'Adicionar',
      icone: Icons.add_circle,
      acao: () {
        //TODO: AÇÃO SALVAR
      },
    );
  }
  }


