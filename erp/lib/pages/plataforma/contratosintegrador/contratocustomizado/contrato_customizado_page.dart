import 'package:auto_size_text/auto_size_text.dart';
import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_change/status_change.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/botao_proximo.dart';
import '../../../../widgets/responsive.dart';



class ContratoCustomizadoPage extends StatelessWidget {
  const ContratoCustomizadoPage({Key? key}) : super(key: key);

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

            // Container(
            //   height: Get.width / 2,
            //   width: Get.height / 2,
            //   child: Stepper(
            //     type: StepperType.horizontal,
            //     steps: getSteps(),
            //   ),
            // ),
            //

            const SizedBox(
              height: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Digite o nome do plano',
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
            expandedListaLimitesCustomizado(),
            expandedListaFinanceiroCustomizado(),
            expandedListaFiscalCustomizado(),
            expandedListaEstoqueCustomizado(),
            expandedListaProdutoCustomizado(),
            expandedListaValoresCustomizado(),
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

Widget expandedListaLimitesCustomizado() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Limites',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )),
    children: [
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
                    'Faturamento/mês',
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
                    'Cadastro de Produtos',
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
                    'Contas a receber',
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
                    'Contas a pagar',
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
                    'Usuários e conexões simultâneas',
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

Widget expandedListaFinanceiroCustomizado() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Financeiro',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )),
    children: [
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
                    'Módulo Financeiro',
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
                    'Controle de boleto bancário',
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
                    'Controle de cartões',
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
                    'Controle de DRE/DFC',
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
                  child:Align(
                      alignment: Alignment.centerLeft,
                      child: CheckBoxMobile()),
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
                    'Controle de vendas a prazo',
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
      ),
    ],
  );
}

Widget expandedListaFiscalCustomizado() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Fiscal',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )),
    children: [
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
                    'Emissão de NF-e (saída)',
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
                    'Emissão de NFS-e (serviço)',
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
                    'Lançamento NF-e (entrada)',
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
      ),

    ],
  );
}

Widget expandedListaEstoqueCustomizado() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Estoque',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )),
    children: [
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
                    'Módulo Estoque',
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
                    'Controle de multiplos locais',
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
      ),

    ],
  );
}

Widget expandedListaProdutoCustomizado() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Produto',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )),
    children: [
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
                    'Controle de observações',
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
                    'Controle de gerador de etiqueta',
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
                    'Controle de pacotes',
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
                    'Controle de promoção',
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
                    'Controle de tabela de preços',
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
                    'Controle de variações',
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
      ),

    ],
  );
}

Widget expandedListaValoresCustomizado() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Valores',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )),
    children: [
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
//
// List<Step> getSteps() => [
//   Step(
//     title: Text('Account'),
//     content: Container(),
//   ),
//   Step(
//     title: Text('texto2'),
//     content: Container(),
//   ),
//   Step(
//     title: Text('texto2'),
//     content: Container(),
//   ),
// ];




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
