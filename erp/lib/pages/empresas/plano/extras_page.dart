import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_theme.dart';
import '../../../widgets/botao_padrao.dart';
import '../../../widgets/chebox_mobile.dart';
import '../../../widgets/responsive.dart';
import '../../../widgets/texto_aba_modal.dart';
import '../../../widgets/texto_plataforma_extras.dart';

class ExtrasPage extends StatelessWidget {
  const ExtrasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: Container(
          color: Colors.amber,
        ),
        desktop: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Assinaturas',
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
            const SizedBox(height: 36,),
            Row(
              children: [
                Text(
                  'Extras',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                    letterSpacing: 0.15,
                  ),
                ),
                Expanded(child: Container()),
                _btnProrrogarContrato(),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.corBranco,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: Color.fromRGBO(255, 87, 34, 1),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: Color.fromRGBO(255, 87, 34, 1),
                    size: AppTheme.h4,
                  ),
                  onPressed: () {},
                  label: Text(
                    'Novo Contrato',
                    style: GoogleFonts.sourceSansPro(
                        fontSize: AppTheme.h4,
                        color: Color.fromRGBO(255, 87, 34, 1)),
                  ),
                ),


              ],
            ),
            const SizedBox(height: 72,),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextoPlataformaExtras(texto: 'Aplicativo - AUTOATENDIMENTO(TOTEM)',),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CheckBoxMobile()),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              ]
          ),
        ),


          ],
        ),
      ),
    );
  }
}

Widget _btnProrrogarContrato() {
  return BotaoPadrao(
    corIcone: AppTheme.adicionar,
    corTexto: Colors.white,
    texto: 'Prorrogar contrato',
    icone: Icons.calendar_today_outlined,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}
