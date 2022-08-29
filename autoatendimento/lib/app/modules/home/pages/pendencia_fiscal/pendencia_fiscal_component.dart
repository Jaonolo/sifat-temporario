// import 'package:autoatendimento/app/modules/home/pages/pendencia_fiscal/pendencia_fiscal_controller.dart';
// import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
// import 'package:autoatendimento/app/utils/style_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:mobx/mobx.dart';
// import 'package:models/model/models.dart';
//
// class PendenciaFiscalComponent {
//   late BuildContext context;
//   PendenciaFiscalController pendenciaFiscalController = Modular.get();
//
//   initialize(BuildContext context) {
//     this.context = context;
//   }
//
//   Widget body() {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         image: StyleUtils.fundoTransparencia(),
//       ),
//       child: Column(
//         children: [
//           Expanded(flex: 15, child: const AppBarImage()),
//           Expanded(
//             flex: 85,
//             child: listPendencias(),
//           ),
//           Expanded(
//               flex: 10,
//               child: TextButton(
//                 onPressed: () {
//                   listPendencias();
//                 },
//                 child: Text("BUSCA TRANSACOES"),
//               ))
//         ],
//       ),
//     );
//   }
//
//   Widget listPendencias() {
//     return FutureBuilder(
//         future: pendenciaFiscalController.carregaPendencias(),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//             case ConnectionState.waiting:
//               return Center(child: CircularProgressIndicator());
//
//             default:
//               return listaTransacoes(pendenciaFiscalController.pendencias);
//           }
//         });
//   }
//
//   Widget listaTransacoes(List<Pendencia> pendencias) {
//     return Observer(builder: (_) {
//       return SingleChildScrollView(
//           child: ListView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         itemCount: 1,
//         itemBuilder: (context, index) => DataTable(
//             border: TableBorder.all(
//                 color: Colors.black, borderRadius: BorderRadius.circular(10)),
//             columns: [
//               DataColumn(label: Text("DATA"), numeric: true),
//               DataColumn(label: Text("NÚMERO VENDA"), numeric: false),
//               DataColumn(label: Text("EMITIR"), numeric: false)
//             ],
//             rows: pendencias
//                 .map((pendencias) => DataRow(cells: [
//                       DataCell(
//                         Text(pendencias.data!.toString()),
//                       ),
//                       DataCell(
//                         Text(pendencias.numero!.toString()),
//                       ),
//                       DataCell(TextButton(
//                         child: Text("EMITIR"),
//                         onPressed: () {},
//                       ))
//                     ]))
//                 .toList()),
//       ));
//     });
//   }
//
// }
