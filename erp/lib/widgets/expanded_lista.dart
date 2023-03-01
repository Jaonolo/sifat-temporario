import 'package:flutter/material.dart';

class ExpandirLista extends StatelessWidget {
  const ExpandirLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
