import 'package:auto_size_text/auto_size_text.dart';
import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_change/status_change.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/botao_proximo.dart';
import '../../../../widgets/responsive.dart';


class ContratoCustomizadoSegundoPage extends StatelessWidget {
  const ContratoCustomizadoSegundoPage({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Cadastrar contrato customizado',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w400,
                    fontSize: 46,
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Plano Diamante',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w400,
                    fontSize: 46,
                  ),
                ),
                Expanded(child: Container()),



              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 36,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 32, 8, 32),
              color: Color(0xFFE9F1FF),
              child: Text('Extras',
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Aplicativo - AUTOATENDIMENTO (TOTEM)',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Aplicativo - AUTOPESAGEM',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Aplicativo - WAYWALLET',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Aplicativo XML Venda',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Concentrador',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Dashboard WEB',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Emissores Fiscais',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Integração - Catraca',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Integração - Everest',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Integração - TrackApp',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Integração - WayMenu',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Sessão Extra',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Suporte Premium - Telefone',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'TEF - Cielo',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'TEF - Elgin Pay',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'TEF - PayGo',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'TEF - REDE',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'TEF - SiTef',
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
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CheckBoxMobile()),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),







            const SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _btnProximo(),
              ],
            ),

          ],
        ),


      ),
    );
  }
}



// Widget expandedListaFinanceiroCustomizado() {
//   return ExpansionTile(
//     collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
//     collapsedBackgroundColor: Color(0xFFE9F1FF),
//     title: Text('Financeiro',
//         style: GoogleFonts.comfortaa(
//           fontSize: 23,
//           fontWeight: FontWeight.w700,
//           color: Color.fromRGBO(0, 29, 52, 1),
//           letterSpacing: -0.5,
//         )
//     ),
//     children: [
//       Divider(),
//
//     ],
//   );
// }



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
