import 'package:autoatendimento/app/modules/home/pages/tef/cancelamento_tef/cancelamento_tef_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/tef/transacao_tef/transacao_tef_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_seta_voltar.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import '../../../../../utils/font_utils.dart';
import '../../../widgets/botao_primario.dart';

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
              flex: 10,
              child: Row(
                children: [
                  BotaoSetaVoltar(function: () {
                    Modular.to.pushNamed('/administrativo_tef');
                  }),
                  Expanded(child: Container()),
                  Expanded(flex: 15, child: const AppBarImage()),
                  Expanded(child: Container())
                ],
              )),
          Expanded(
            flex: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: listTransacoes(),
            ),
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
              return listaTransacoes(transacoes, context);
          }
        });
  }

  Widget listaTransacoes(List<TransacaoCartao> transacoes, BuildContext context) {
    return Container(
      child: DataTable(
                  border: TableBorder.all(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          columns: [
            DataColumn(label: Text("DATA"), numeric: true),
            DataColumn(label: Text("NSU"), numeric: true),
            DataColumn(label: Text("VALOR"),numeric: true),
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
                      Text(transacaoCartao.nsu.toString()),
                    ),
                    DataCell(
                      Text(transacaoCartao.valor.toString()),
                    ),
                    DataCell(
                      TextButton(child:Text("Cancelar") ,onPressed: (){
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) =>  _cancelarTEF(context , transacaoCartao));

                      })
                      ,
                    ),
                  ],
                ),
              )
              .toList()),
    );

  }

  Widget _cancelarTEF(BuildContext context, TransacaoCartao transacaoCartao) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: Center(
        child: Text(
          "Selecione o tipo de cancelamento",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: FontUtils.h2(context),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [

            btnTipoCancelamento( "1 - Cancelamento de Cartao de Debito" ,context, transacaoCartao, "DEBITO"),
            btnTipoCancelamento( "2 - Cancelamento de Cartao de Credito" ,context, transacaoCartao, "CREDITO"),
            btnTipoCancelamento( "10 - Cancelamento Carteira Digital" ,context, transacaoCartao, "CARTEIRA_DIGITAL"),

          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                width: FontUtils.h1(context) * 4.5,
                child: BotaoPrimario(
                  descricao: "Cancelar",
                  function: () {
                    Modular.to.pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget btnTipoCancelamento(String descricao, BuildContext context, TransacaoCartao transacaoCartao, String tipo){
    return SizedBox(
      width: FontUtils.h1(context) * 8.40,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BotaoPrimario(
          descricao: descricao,
          function: () {
            Modular.to.pushNamed("/transacao");
            transacaoTefController.comunicaWebSocket(context);
            transacaoTefController.cancelarTransacao(transacaoCartao, tipo,
            );
          },
        ),
      ),
    );
  }

}
