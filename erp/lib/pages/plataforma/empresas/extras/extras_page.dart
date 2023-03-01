import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/utils/botoes/botao_padrao.dart';
import '../../../../widgets/chebox_mobile.dart';
import '../../../../widgets/drop_down_button_padrao.dart';
import '../../../../widgets/responsive.dart';
// import '../../../theme/app_theme.dart';
// import '../../../widgets/botao_padrao.dart';
// import '../../../widgets/chebox_mobile.dart';
// import '../../../widgets/responsive.dart';
// import '../../../widgets/texto_aba_modal.dart';
// import '../../../widgets/texto_plataforma_extras.dart';
import '../../../../widgets/texto_plataforma_extras.dart';
import 'extras_controller.dart';

// class ExtrasPage extends StatelessWidget {
class ExtrasPage extends GetView<ExtrasController> {
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
                _btnProrrogarContrato(context),
                const SizedBox(
                  width: 8,
                ),
                _btnNovoContrato(context),
                const SizedBox(width: 8,),



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

Widget _btnProrrogarContrato(context) {
  return BtnPadrao(
    corIcone: AppTheme.adicionar,
    corTexto: Colors.white,
    texto: 'Prorrogar contrato',
    icone: Icons.calendar_today_outlined,
    acao: () {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            )),
        builder: (context) => Container(
          height: Get.height / 2,
          // height: Get.height / 2,
          // height: 100,
          padding: EdgeInsets.all(16),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Novo Contrato',
                          // textAlign: TextAlign.end,
                          style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w400,
                            fontSize: 33,
                          ),
                        ),

                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                  ],
                ),
                // color: Colors.red,
              ),
            ),

            Expanded(
              flex: 8,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            width: Get.width / 4,
                            height: Get.height / 4,
                            child:

                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Insira os dados do novo contrato customizado',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    DropDownButtonPadrao(
                                      itensLista: ['plano'],
                                      valorSelecionado: 'Plano',
                                    ),
                                    // Expanded(child: Container()),
                                  ],
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    DropDownButtonPadrao(
                                      itensLista: ['plano'],
                                      valorSelecionado: 'Plano',
                                    ),
                                    // Expanded(child: Container()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: Color.fromRGBO(233, 241, 255, 1),
                        child: Container(
                          width: 360,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(26.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      'Alteração do novo plano',
                                      // textAlign: TextAlign.end,
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Valor debitado do plano R\$58,00',
                                      // minFontSize: 12,
                                      softWrap: true,
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.blackSubtitulo,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Dias acrescentados ao vencimento: 10',
                                      // minFontSize: 12,
                                      softWrap: true,
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.blackSubtitulo,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Valor do novo contrato R\$58,00',
                                      // minFontSize: 12,
                                      softWrap: true,
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.blackSubtitulo,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  // runSpacing: 16,
                  // alignment: WrapAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: Color.fromRGBO(186, 26, 26, 1),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Text(
                          textAlign: TextAlign.end,
                          'Cancelar',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(186, 26, 26, 1),
                            letterSpacing: 0.25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(22, 156, 52, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Text(
                          textAlign: TextAlign.end,
                          'Confirmar',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.buttomModalConfirmar,
                            letterSpacing: 0.25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      );

      //TODO: AÇÃO SALVAR
    },
  );
}


Widget _btnNovoContrato(context) {
  return ElevatedButton.icon(
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
    onPressed: () {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            )),
        builder: (context) => Container(
          // height: Get.height / 2,
          padding: EdgeInsets.all(16),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              child: Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 34, top: 28),
                    child: Text(
                      'Novo Contrato',
                      // textAlign: TextAlign.end,
                      style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.w400,
                        fontSize: 33,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 12,
                runSpacing: 16,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blue,


                        backgroundColor: Color.fromRGBO(255, 237, 232, 1),


                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: Color.fromRGBO(215, 81, 0, 1),
                          ),

                        ),

                      ),
                      onPressed: () {},
                      child:

                      Container(
                        width: 340,
                        height: 180,
                        child: Padding(
                          padding: const EdgeInsets.all(26.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    'Contrato Customizado',
                                    // textAlign: TextAlign.end,
                                    style: GoogleFonts.comfortaa(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 23,
                                      letterSpacing: -0.5,
                                      color: Color.fromRGBO(23, 28, 34, 1),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Expanded(
                                child: Text(
                                  'Dados do contrato são negociados diferente com o integrador,'
                                      ' esse tipo de contrato não fica disponível para compra pelos '
                                      'usuários',
                                  // minFontSize: 12,
                                  softWrap: true,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: AppTheme.blackSubtitulo,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blue,


                        backgroundColor: Color.fromRGBO(255, 237, 232, 1),


                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: Color.fromRGBO(215, 81, 0, 1),
                          ),

                        ),

                      ),
                      onPressed: () {},
                      child:

                      Container(
                        width: 340,
                        height: 180,
                        child: Padding(
                          padding: const EdgeInsets.all(26.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    'Contrato Convencional',
                                    // textAlign: TextAlign.end,
                                    style: GoogleFonts.comfortaa(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 23,
                                      letterSpacing: -0.5,
                                      color: Color.fromRGBO(23, 28, 34, 1),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Expanded(
                                child: Text(
                                  'Dados do contrato são personalizados pelo usuários(Plano e Contratos Extras),'
                                      ' esse tipo de contrato fica disponível para compra pelos '
                                      'usuários',
                                  // minFontSize: 12,
                                  softWrap: true,
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: AppTheme.blackSubtitulo,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ]),
        ),
      );
    },
    label: Text(
      'Novo Contrato',
      style: GoogleFonts.sourceSansPro(
          fontSize: AppTheme.h4,
          color: Color.fromRGBO(255, 87, 34, 1)),
    ),
  );
}


Widget _modalCobrancaContrato(context){
  return TextButton(
    onPressed: () => showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          side: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        title: Container(
          decoration: BoxDecoration(

          ),
          child: Column(
            children: [
              Text('Cobrança do contrato',
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.w400,
                  fontSize: 33,
                  letterSpacing: -0.5,
                  color: Color.fromRGBO(13, 13, 13, 1),
                ),),

              Divider(thickness: 2,),
              SizedBox(height: 1,),
            ],
          ),
        ),
        content: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 380, maxWidth: 400,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('O contrato será cobrado do cliente caso você'
                  ' cobrar, se desejar isentar a cobrança do contrato é'
                  ' só selecionar isentar',
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                  letterSpacing: 0.5,
                  color: Color.fromRGBO(13, 13, 13, 1),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  // TablePlataforma(),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: CheckBoxMobile(),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Center(child: Text('Cobrar contrato',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.25,
                          color: Color(0xFF5A5F66),
                        ),
                      )),
                    ),
                  ),


                ],
              ),
              Row(
                children: [
                  // TablePlataforma(),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: CheckBoxMobile(),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Center(child: Text('Isentar contrato',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.25,
                          color: Color(0xFF5A5F66),
                        ),
                      )),
                    ),
                  ),


                ],
              ),
              SizedBox(height: 8,),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Color.fromRGBO(233, 241, 255, 1),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Alteração do novo plano',
                            // textAlign: TextAlign.end,
                            style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w700,
                              fontSize: 23,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        children: [
                          Text(
                            'Valor debitado do plano R\$58,00',
                            // minFontSize: 12,
                            softWrap: true,
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.blackSubtitulo,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        children: [
                          Text(
                            'Dias acrescentados ao vencimento: 10',
                            // minFontSize: 12,
                            softWrap: true,
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.blackSubtitulo,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            'Valor do novo contrato R\$58,00',
                            // minFontSize: 12,
                            softWrap: true,
                            style: GoogleFonts.sourceSansPro(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.blackSubtitulo,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32,),
              Row(
                // runSpacing: 16,
                // alignment: WrapAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: Color.fromRGBO(186, 26, 26, 1),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Text(
                        textAlign: TextAlign.end,
                        'Cancelar',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(186, 26, 26, 1),
                          letterSpacing: 0.25,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(22, 156, 52, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Text(
                        textAlign: TextAlign.end,
                        'Salvar',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.buttomModalConfirmar,
                          letterSpacing: 0.25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Todo me acha agora
            ],
          ),

        ),
      ),
    ),
    child: const Text('Modal Cobrança do contrato'),
  );
}


