import 'package:auto_size_text/auto_size_text.dart';
import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/botao_padrao.dart';
import '../../../../widgets/botao_proximo.dart';
import '../../../../widgets/expanded_lista.dart';
import '../../../../widgets/responsive.dart';
import 'editar_contato_integrador_controller.dart';

class EditarContratoIntegradorErpPage extends GetView<EditarContratoIntegradorErpController> {
// class EditarContratoErpPage extends StatelessWidget {
  const EditarContratoIntegradorErpPage({Key? key}) : super(key: key);

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
        desktop:
        ListView(
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
            expandedListaLimites(),
            expandedListaFinanceiro(),
            expandedListaFiscal(),
            expandedListaEstoque(),
            expandedListaProduto(),
            expandedListaValores(),
            const SizedBox(
              height: 36,
            ),
            Container(
              child: Center(
                child: _btnProximo(),
              ),
            )

          ],
        ),
      ),
    );
  }
}
Widget expandedListaLimites() {
  return ExpansionTile(
    collapsedIconColor: Color.fromRGBO(13, 13, 13, 1),
    collapsedBackgroundColor: Color(0xFFE9F1FF),
    title: Text('Limites',
        style: GoogleFonts.comfortaa(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 29, 52, 1),
          letterSpacing: -0.5,
        )
    ),
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

Widget expandedListaFinanceiro() {
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

Widget expandedListaFiscal() {
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

Widget expandedListaEstoque() {
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

Widget expandedListaProduto() {
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

Widget expandedListaValores() {
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
      padding: EdgeInsets.symmetric(
          horizontal: 16, vertical: 4),
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
    texto: 'Salvar',
    icone: Icons.save,
    acao: () {
      //TODO: AÇÃO SALVAR
    },
  );
}


//TODO SEPARAR O MODAL ABAIXO DEPOIS


