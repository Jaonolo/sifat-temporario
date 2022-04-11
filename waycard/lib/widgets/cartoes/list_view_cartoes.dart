import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:waycard/widgets/cartoes/list_tile_cartao.dart';

class ListViewCartoes extends StatelessWidget {
  final List<ClienteCartao> cartoes;

  const ListViewCartoes(this.cartoes);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartoes.length,
        itemBuilder: (context, index) {
          var cartao = cartoes[index];
          return ListTileCartao(
            cartao: cartao,
          );
        });
  }
}
