import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';
import 'package:utils/utils/string_utils.dart';

// ignore: must_be_immutable
class CardItemRevisaoPedido extends StatefulWidget {
  final VendaController vendaController = Modular.get();
  int index;
  late NotaItem notaItem;

  CardItemRevisaoPedido({Key? key, required this.index})
      : super(key: key) {
    notaItem = vendaController.itensLancados[index].notaItem;
  }

  @override
  _CardItemRevisaoPedidoState createState() => _CardItemRevisaoPedidoState();
}

class _CardItemRevisaoPedidoState extends State<CardItemRevisaoPedido> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: Text(
                    '${widget.notaItem.quantidade} UN',
                    style: TextStyle(
                        fontSize: orientation == Orientation.landscape
                            ? FontUtils.h2(context)
                            : FontUtils.h3(context)),
                  ),
                )),
            Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "${widget.notaItem.descricao!.toUpperCase()} ",
                    style: TextStyle(
                        fontSize: orientation == Orientation.landscape
                            ? FontUtils.h2(context)
                            : FontUtils.h3(context)),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'R\$ ${NotaItemUtils.getSubtotal(widget.notaItem)
                        .toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: orientation == Orientation.landscape
                            ? FontUtils.h2(context)
                            : FontUtils.h3(context)),
                  ),
                )),
          ],
        ),
        if (widget.notaItem.subitens.isNotEmpty)
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                  flex: 8,
                  child: Wrap(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        StringUtils.montaDescricaoSubItensAuto(widget.notaItem),
                        style: TextStyle(
                            fontSize: orientation == Orientation.landscape
                                ? FontUtils.h2(context)
                                : FontUtils.h3(context) * 0.70),
                      ),
                    )
                  ])),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          )
      ],
    );
  }
}
