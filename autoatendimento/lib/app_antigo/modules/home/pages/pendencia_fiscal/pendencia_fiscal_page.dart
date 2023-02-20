// import 'package:autoatendimento/app/modules/home/pages/pendencia_fiscal/pendencia_fiscal_controller.dart';
// import 'package:autoatendimento/app/modules/home/widgets/app_bar_image.dart';
// import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
// import 'package:autoatendimento/app/modules/home/widgets/botao_secundario.dart';
// import 'package:autoatendimento/app/utils/autoatendimento_utils.dart';
// import 'package:autoatendimento/app/utils/style_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:models/model/models.dart';
//
// import '../../../../theme/default_theme.dart';
// import '../../../../utils/dialog_auto.dart';
// import '../../../../utils/font_utils.dart';
// import '../../widgets/botao_seta_voltar.dart';
//
// class PendenciaFiscalPage extends StatefulWidget {
//   late BuildContext context;
//   PendenciaFiscalController pendenciaFiscalController = Modular.get();
//
//   @override
//   State<PendenciaFiscalPage> createState() => _PendenciaFiscalPageState();
// }
//
// class _PendenciaFiscalPageState extends State<PendenciaFiscalPage> {
//   initialize(BuildContext context) async {
//     await existePendencias();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     initialize(context);
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         image: StyleUtils.fundoTransparencia(),
//       ),
//       child: Column(
//         children: [
//           Expanded(
//               flex: 10,
//               child: Row(
//                 children: [
//                   BotaoSetaVoltar(function: () {
//                     widget.pendenciaFiscalController.pendencias = [];
//                     Modular.to.pushNamed('/configuracao');
//                   }),
//                   Expanded(child: Container()),
//                   Expanded(flex: 15, child: const AppBarImage()),
//                   Expanded(child: Container())
//                 ],
//               )),
//           Expanded(
//             flex: 80,
//             child: listPendencias(),
//           ),
//           Row(
//             children: [
//               Expanded(flex: 40, child: SizedBox()),
//               Expanded(
//                   flex: 20,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: BotaoPrimario(
//                         largura: FontUtils.h2(context) * 20,
//                         altura: 0.08,
//                         descricao: "Ver Mais + ",
//                         function: () {
//                           setState(() {
//                             listPendencias;
//                           });
//                         }),
//                   )),
//               Expanded(flex: 40, child: SizedBox())
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget existePendencias() {
//     return FutureBuilder(
//         future: widget.pendenciaFiscalController.existePendencia(),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//             case ConnectionState.waiting:
//               return Center(child: CircularProgressIndicator());
//
//             default:
//               return SizedBox();
//           }
//         });
//   }
//
//   Widget listPendencias() {
//     return FutureBuilder(
//         future: widget.pendenciaFiscalController.carregaPendencias(),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//             case ConnectionState.waiting:
//               return Center(child: CircularProgressIndicator());
//
//             default:
//               return listaTransacoes(
//                   widget.pendenciaFiscalController.pendencias);
//           }
//         });
//   }
//
//   Widget listaTransacoes(List<Pendencia> pendencias) {
//     return Container(
//       child: ListView.builder(
//         padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         itemCount: 1,
//         itemBuilder: (context, index) => DataTable(
//             columnSpacing: 13.0,
//             border: TableBorder.all(
//                 color: Colors.black, borderRadius: BorderRadius.circular(10)),
//             columns: [
//               dataColumnPersonalizado("DATA"),
//               dataColumnPersonalizado("NÚMERO DA VENDA"),
//               dataColumnPersonalizado(
//                   "${widget.pendenciaFiscalController.lblTotal}")
//             ],
//             rows: pendencias
//                 .map((pendencia) => DataRow(cells: [
//                       dataCellPersoalizadoString(
//                           "${pendencia.data!.day.toString()}/${pendencia.data!.month.toString()}/${pendencia.data!.year.toString()}"),
//                       dataCellPersoalizadoString(pendencia.numero!.toString()),
//                       DataCell(Center(
//                         child: BotaoSecundario(
//                           largura: 0.08,
//                           colorText: DefaultTheme.accentColor,
//                           descricao: "Emitir",
//                           function: ()  async {
//                            await widget.pendenciaFiscalController
//                                 .carregaNotaParaEmissao(pendencia, context);
//                            await Future.delayed(Duration(seconds: 10) ,() =>{
//                              setState(() {
//                                listPendencias;
//                              })});},
//                           context: context,
//                         ),
//                       ))
//                     ]))
//                 .toList()),
//       ),
//     );
//   }
//
//   DataCell dataCellPersoalizadoString(String dados) {
//     return DataCell(
//       Center(
//           child: Text(
//         dados,
//         textAlign: TextAlign.center,
//       )),
//     );
//   }
//
//   DataColumn dataColumnPersonalizado(String cabecalho) {
//     return DataColumn(
//         label: Expanded(
//             child: Center(
//                 child: Text(
//           cabecalho,
//           textAlign: TextAlign.center,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ))),
//         numeric: true);
//   }
// }
