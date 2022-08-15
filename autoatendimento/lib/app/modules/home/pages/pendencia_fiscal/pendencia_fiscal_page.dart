import 'package:autoatendimento/app/modules/home/pages/pendencia_fiscal/pendencia_fiscal_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';

import '../../../../utils/font_utils.dart';
import '../../widgets/botao_seta_voltar.dart';

class PendenciaFiscalPage extends StatefulWidget {
  late BuildContext context;
  PendenciaFiscalController pendenciaFiscalController = Modular.get();

  @override
  State<PendenciaFiscalPage> createState() => _PendenciaFiscalPageState();
}


class _PendenciaFiscalPageState extends State<PendenciaFiscalPage> {

  initialize(BuildContext context) async {
    await existePendencias();
  }

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: StyleUtils.fundoTransparencia(),
      ),
      child: Column(
        children: [
          Expanded(flex: 15, child:
          Row(
            children: [
              BotaoSetaVoltar(
                  function: () {
                    widget.pendenciaFiscalController.pendencias = [];
                Modular.to.pushNamed('/configuracao');
              }),
              Expanded(child: Container()),

              Expanded(flex: 15, child: const AppBarImage()),
              Expanded(child: Container())
            ],
          )),
          Expanded(
            flex: 85,
            child: listPendencias(),
          ),
          Expanded(
              flex: 10,
              child:
              Scaffold(
                bottomSheet:
              BotaoPrimario(
                  largura: FontUtils.h2(context) * 20,
                  borderRadius: 10.0,
                  iconData: Icons.arrow_forward,
                  descricao: "Mais Pendencias",
                  function: (){
                  setState(() {

                  listPendencias;
                  });
                  }
              ))
        )],
      ),
    );
  }
  Widget existePendencias() {
    return FutureBuilder(
        future: widget.pendenciaFiscalController.existePendencia(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            default:
             return SizedBox();
          }
        });
  }

  Widget listPendencias() {
    return FutureBuilder(
        future: widget.pendenciaFiscalController.carregaPendencias(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            default:
              return listaTransacoes(
                  widget.pendenciaFiscalController.pendencias);
          }
        });
  }

  Widget listaTransacoes(List<Pendencia> pendencias) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(20,10,20,0),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) => DataTable(
            border: TableBorder.all(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            columns: [

              DataColumn(label: Text("DATA", textAlign: TextAlign.center,), numeric: true),
              DataColumn(label: Text("NÚMERO VENDA", textAlign: TextAlign.center,), numeric: false),
              DataColumn(label: Text(widget.pendenciaFiscalController.lblTotal, textAlign: TextAlign.center,), numeric: false)
            ],
            rows: pendencias
                .map((pendencia) => DataRow(cells: [
                      DataCell(
                        Text(pendencia.data!.toString(), textAlign: TextAlign.center,),
                      ),
                      DataCell(
                        Text(pendencia.numero!.toString(), textAlign: TextAlign.center,),
                      ),
                      DataCell(BotaoPrimario(
                        descricao: "Emitir",
                        function: ()=> {
                        widget.pendenciaFiscalController.carregaNotaParaEmissao(pendencia, context)
                      }
                      ))
                    ]))
                .toList()),
      ),
    );
  }
}
