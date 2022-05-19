import 'package:autoatendimento/app/modules/home/pages/produto/controller/produto_controller.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

// ignore: must_be_immutable
class CardRevisao extends StatelessWidget {
  final ProdutoController controller = Modular.get();
  late BuildContext context;

  @override
  Widget build(BuildContext c) {
    context = c;
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: Text("REVISÃO",
                style: TextStyle(fontSize: FontUtils.h2(context)))),
        Expanded(flex: 92, child: _listViewRevisao()),
      ],
    );
  }

  //tela de revisao compartilhada
  Widget _listViewRevisao() {
    List<NotaItem> itensVendidos =
    NotaItemUtils.getItensComboComposto(controller.produtoCarrinho.notaItem);

    return Column(
      children: [
        Expanded(
          flex: 100,
          child: Card(
            elevation: 5,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: itensVendidos.length,
              itemBuilder: (c, index) {
                NotaItem nota = itensVendidos[index];
                return _cardNotaItemRevisao(nota);
              },
            ),
          ),
        ),
        Expanded(child: Container()),
        Center(
          child: Text(
            'TOTAL R\$ ${NotaItemUtils.getSubtotal(controller.produtoCarrinho.notaItem).toStringAsFixed(2)} ',
            style: TextStyle(fontSize: FontUtils.h2(context)),
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }

  //card revisao com todos os item escolhidos do combo
  Widget _cardNotaItemRevisao(NotaItem subItens) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: Text(
                    '${subItens.quantidade} UN',
                    style: TextStyle(fontSize: FontUtils.h3(context)),
                  ),
                )),
            Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    subItens.descricao!.toUpperCase(),
                    style: TextStyle(fontSize: FontUtils.h3(context)),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'R\$ ${subItens.precoTotal!.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: FontUtils.h3(context)),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
