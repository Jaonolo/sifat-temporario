import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:waycard/config/app_config.dart';

class CardDetalhesCartao extends StatelessWidget {
  final ClienteCartao cartao;

  const CardDetalhesCartao({required this.cartao});

  @override
  Widget build(BuildContext context) {
    TextStyle styleLegends = TextStyle(fontWeight: FontWeight.bold);
    TextStyle styleValues = TextStyle(
        fontSize: 18, color: AppConfig.theme.primaryColorLight);

    var _percent = cartao.saldo! / cartao.limite!;
    if (_percent < BigDecimal.ZERO()) _percent = BigDecimal.ZERO();
    if (_percent > BigDecimal.ONE()) _percent = BigDecimal.ONE();

    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Fatura atual",
                        style: styleLegends,
                      ),
                    ),
                    Text(
                      "R\$ ${(cartao.limite! - cartao.saldo).toStringAsFixed(
                          2)}",
                      style: styleValues,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Limite",
                        style: styleLegends,
                      ),
                    ),
                    Text(
                      "R\$ ${(cartao.limite!).toStringAsFixed(2)}",
                      style: styleValues,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Limite disponível",
                        style: styleLegends,
                      ),
                    ),
                    CircularPercentIndicator(
                      radius: 60,
                      percent: _percent.toDouble(),
                      center: Text(
                        "${((cartao.saldo! / cartao.limite!) *
                            BigDecimal("100")).toDouble()}%",
                        style: styleLegends,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "R\$ ${cartao.saldo!.toStringAsFixed(2)}",
                        style: styleValues,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Dia Vencimento", style: styleLegends),
                    ),
                    Text(
                      "${cartao.vencimento}",
                      style: styleValues,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Status", style: styleLegends),
                    ),
                    Text(
                      "${cartao.status}",
                      style: styleValues,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
