import 'package:erp/widgets/chebox_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/expanded_lista.dart';
import '../../../widgets/responsive.dart';

class DetalhesPlanoPage extends StatelessWidget {
  const DetalhesPlanoPage({Key? key}) : super(key: key);

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
            const SizedBox(
              height: 36,
            ),
            expandedListaLimites(),
            expandedListaFinaceiro(),
            expandedListaFiscal(),
            expandedListaEstoque(),
            expandedListaProduto(),
            expandedListaValores(),

          ],
        ),
      ),
    );
  }
}

Widget expandedListaLimites() {
  return ExpansionTile(
    title: Text('Limites'),
    children: [
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Faturamento/mês'),

            Text('R\$ 35,00'),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Cadastro de Produtos'),

            Text('R\$ 5,00'),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Contas a receber'),

            Text('R\$ 35,00'),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Contas a pagar'),

            Text('R\$ 35,00'),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Usuários e conexões simultâneas'),

            Text('R\$ 35,00'),

          ],
        ),

      ),
    ],
  );
}
Widget expandedListaFinaceiro() {
  return ExpansionTile(
    title: Text('Financeiro'),
    children: [
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Módulo Financeiro'),

            CheckBoxMobile(),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Controle de boleto bancário'),

            CheckBoxMobile(),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Controle de cartões'),

            CheckBoxMobile(),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Controle de DRE/DFC'),

            CheckBoxMobile(),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Controle de vendas a prazo'),

            Text('R\$ 50,00'),

          ],
        ),

      ),
    ],
  );
}
Widget expandedListaFiscal() {
  return ExpansionTile(
    title: Text('Fiscal'),
    children: [
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Faturamento/mês'),

            Text('R\$ 35,00'),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Emissão de NF-e (saída)'),
            CheckBoxMobile(),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Emissão de NF-e (serviço)'),
            CheckBoxMobile(),
          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Lançamento de NF-e (entrada)'),
            CheckBoxMobile(),

          ],
        ),

      ),

    ],
  );
}
Widget expandedListaEstoque() {
  return ExpansionTile(
    title: Text('Estoque'),
    children: [
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Módulo Estoque'),

            CheckBoxMobile(),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Controle de multiplos locais'),

            CheckBoxMobile(),

          ],
        ),

      ),

    ],
  );
}
Widget expandedListaProduto() {
  return ExpansionTile(
    title: Text('Produto'),
    children: [
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Controle de observações'),

            CheckBoxMobile(),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Controle de gerador de etiqueta'),

            CheckBoxMobile(),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Controle de pacotes'),

            CheckBoxMobile(),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Controle de promoção'),

            CheckBoxMobile(),


          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Controle de tabela de preços'),

            CheckBoxMobile(),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Controle de variações'),

            CheckBoxMobile(),

          ],
        ),

      ),
    ],
  );
}
Widget expandedListaValores() {
  return ExpansionTile(
    title: Text('Valores'),
    children: [
      Divider(),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Valor mensal'),

            Text('R\$ 35,00'),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Valor trimestral'),

            Text('R\$ 5,00'),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Valor semestral'),

            Text('R\$ 35,00'),

          ],
        ),

      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Valor anual'),

            Text('R\$ 35,00'),

          ],
        ),

      ),

    ],
  );
}

