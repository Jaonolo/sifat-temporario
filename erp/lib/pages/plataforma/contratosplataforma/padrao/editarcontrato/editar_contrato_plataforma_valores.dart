import 'package:auto_size_text/auto_size_text.dart';
import 'package:erp/pages/plataforma/contratosplataforma/padrao/editarcontrato/editar_contrato_plataforma_controller.dart';
import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../theme/app_theme.dart';
import '../../../../../widgets/botao_padrao.dart';
import '../../../../../widgets/botao_proximo.dart';
import '../../../../../widgets/responsive.dart';


class EditarContratoPlataformaValoresPage
    extends GetView<EditarContratoPlataformaErpController> {
// class EditarContratoErpPage extends StatelessWidget {
  const EditarContratoPlataformaValoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//------------ VARIAVEIS------------
    Size _size = MediaQuery.of(context).size;
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
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    'Edição de contrato padrão',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w400,
                      fontSize: 46,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 36,
            ),

            expandedListaValores(),
            const SizedBox(
              height: 36,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: _btnSalvar(),
            )
          ],
        ),
      ),
    );
  }
}

Widget expandedListaValores() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(16),
        color: Color(0xFFE9F1FF),
        child: Row(
          children: [
            Text('Valores',
                style: GoogleFonts.comfortaa(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 29, 52, 1),
                  letterSpacing: -0.5,
                )),
          ],
        ),
      ),
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Valor mensal',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Valor trimestral',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Valor semestral',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Valor anual',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'R\$ 45,00',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    ],
  );
}

Widget _btnProximo() {
  return BotaoPadraoProximo(
    corTexto: Colors.white,
    texto: 'Próximo',
    // icone: Icons.calendar_today_outlined,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}

Widget _btnAdicionar() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Color(0xFFFF5722),
        ),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        textAlign: TextAlign.end,
        'Adicionar',
        style: GoogleFonts.sourceSansPro(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFF5722),
          letterSpacing: 0.25,
        ),
      ),
    ),
  );
}

Widget _btnSalvar() {
  return BotaoPadrao(
    corIcone: AppTheme.salvar,
    corTexto: Colors.white,
    texto: 'Finalizar',
    icone: Icons.save,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}
