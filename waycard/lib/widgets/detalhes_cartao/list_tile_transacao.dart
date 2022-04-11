import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/date_time_utils.dart';
import 'package:waycard/config/app_config.dart';

class ListTileTransacao extends StatelessWidget {
  final WaycardTransacao transacao;

  const ListTileTransacao({required this.transacao});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(transacao.lojista!.pessoa!.nome!),
      leading: IconButton(
        icon: Icon(
          transacao.status == "EFETUADA" ? Icons.shopping_cart : Icons
              .remove_shopping_cart,
          color: transacao.status == "EFETUADA" ? null : AppConfig.theme
              .colorScheme.secondary,
        ),
        onPressed: null,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "R\$ ${transacao.valor!.toStringAsFixed(2)}",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: AppConfig.theme.primaryColorLight,
              decoration: transacao.status != "EFETUADA" ? TextDecoration
                  .lineThrough : null,
              decorationColor: Colors.white),
        ),
      ),
      trailing: Text("${DateTimeUtils.format(
          transacao.data, [DateTimeUtils.dd, "/", DateTimeUtils.mm])}"),
    );
  }
}
