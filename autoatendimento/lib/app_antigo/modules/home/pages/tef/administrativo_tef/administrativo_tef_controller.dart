// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:mobx/mobx.dart';
//
// import '../transacao_tef/transacao_tef_controller.dart';
//
// part 'administrativo_tef_controller.g.dart';
//
// class AdministrativoTefController = AdministrativoTefBase with _$AdministrativoTefController;
//
// abstract class AdministrativoTefBase with Store {
//
//   TransacaoTefController transacaoTefController = Modular.get();
//
//   void cancelamentoTef() {
//     Modular.to.pushNamed("/cancelamento_tef");
//   }
//
//   void reimpressaoTef(BuildContext context){
//     // REIMPRESSÃO NÃO FUNCIONANDO
//     Modular.to.pushNamed("/transacao");
//     transacaoTefController.comunicaWebSocket(context);
//     transacaoTefController.reimprimirTransacao();
//   }
// }