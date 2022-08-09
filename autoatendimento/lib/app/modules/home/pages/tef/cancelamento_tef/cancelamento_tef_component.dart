import 'package:autoatendimento/app/modules/home/pages/tef/cancelamento_tef/cancelamento_tef_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/tef/transacao_tef/transacao_tef_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:core/application/application.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';

class CancelamentoTefComponent {
  CancelamentoTefController cancelamentoTefController = Modular.get();
  TransacaoTefController transacaoTefController = Modular.get();

  Widget body() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: StyleUtils.fundoTransparencia(),
      ),
      child: Column(
        children: [
          Expanded(
              flex: 20,
              child: BotaoSetaVoltar(
                function: () {
                  Modular.to.pushNamed('/comecar');
                },
              )),
          Expanded(flex: 15, child: const AppBarImage()),
          Expanded(
            flex: 85,
            child: listTransacoes(),
          )
        ],
      ),
    );
  }

  Widget listTransacoes() {
    return FutureBuilder(
        future: cancelamentoTefController.carregaTransacoes(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            default:
              List<TransacaoCartao> transacoes =
                  snapshot.data as List<TransacaoCartao>;
              print(transacoes);
              return listaTransacoes(transacoes, context);
          }
        });
  }

  Widget listaTransacoes(List<TransacaoCartao> transacoes, BuildContext context) {
    return Container(
      width: 400,
      child: DataTable(
          border: TableBorder.all(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          columns: [
            DataColumn(label: Text("DATA"), numeric: true),
            DataColumn(
              label: Text("VALOR"),
              numeric: true,
            ),
            DataColumn(label: Text("CANCELAR"), numeric: true)
          ],
          rows: transacoes
              .map(
                (transacaoCartao) => DataRow(
                  cells: [
                    DataCell(
                      Text(transacaoCartao.data.toString()),
                    ),
                    DataCell(
                      Text(transacaoCartao.valor.toString()),
                    ),
                    DataCell(
                      TextButton(child:Text("Cancelar") ,onPressed: (){
                        _cancelarTEF(transacoes,context);
                      })
                      ,
                    ),
                  ],
                ),
              )
              .toList()),
    );

  }
  _cancelarTEF(List<TransacaoCartao> transacoes, BuildContext context) async {
    transacaoTefController.comunicaWebSocket(context);
    for(TransacaoCartao transacaoCartao in transacoes)
    transacaoTefController.cancelarTransacao(transacaoCartao.valor!,
        "CREDITO",transacaoCartao.id!);
    print(transacoes);
    print("AQUIIIIIIIIIIIIIIII");
  }

}
