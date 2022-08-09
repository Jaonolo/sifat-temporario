import 'package:autoatendimento/app/modules/home/pages/pendencia_fiscal/pendencia_fiscal_component.dart';
import 'package:autoatendimento/app/modules/home/pages/pendencia_fiscal/pendencia_fiscal_controller.dart';
import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
import 'package:autoatendimento/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';

class PendenciaFiscalPage extends StatefulWidget {
  late BuildContext context;
  PendenciaFiscalController pendenciaFiscalController = Modular.get();


  @override
  State<PendenciaFiscalPage> createState() => _PendenciaFiscalPageState();
}


class _PendenciaFiscalPageState extends State<PendenciaFiscalPage> {

  initialize(BuildContext context) async {
    widget.pendenciaFiscalController.pendencias = ObservableList();
    await existePendencias();
  }

  @override
  Widget build(BuildContext context) {
    initialize(context);
    return b();
  }


  Widget b(){
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: StyleUtils.fundoTransparencia(),
      ),
      child: Column(
        children: [
          Expanded(flex: 15, child: const AppBarImage()),
          Expanded(
            flex: 85,
            child: listPendencias(),
          ),
          Expanded(
              flex: 10,
              child: TextButton(
                onPressed: () {
                  setState(() {

                    listPendencias;
                  });
                },
                child: Text("BUSCA TRANSACOES"),
              ))
        ],
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
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) => DataTable(
            border: TableBorder.all(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            columns: [
              DataColumn(label: Text("DATA"), numeric: true),
              DataColumn(label: Text("NÚMERO VENDA"), numeric: false),
              DataColumn(label: Text(widget.pendenciaFiscalController.lblTotal), numeric: false)
            ],
            rows: pendencias
                .map((pendencias) => DataRow(cells: [
                      DataCell(
                        Text(pendencias.data!.toString()),
                      ),
                      DataCell(
                        Text(pendencias.numero!.toString()),
                      ),
                      DataCell(TextButton(
                        child: Text("EMITIR"),
                        onPressed: () {},
                      ))
                    ]))
                .toList()),
      ),
    );
  }
}
