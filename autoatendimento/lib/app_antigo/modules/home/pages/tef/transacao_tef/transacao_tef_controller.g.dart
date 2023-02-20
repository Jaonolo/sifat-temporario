// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'transacao_tef_controller.dart';
//
// // **************************************************************************
// // StoreGenerator
// // **************************************************************************
//
// // ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers
//
// mixin _$TransacaoTefController on TransacaoTefBase, Store {
//   late final _$bufferSitefAtom =
//       Atom(name: 'TransacaoTefBase.bufferSitef', context: context);
//
//   @override
//   String? get bufferSitef {
//     _$bufferSitefAtom.reportRead();
//     return super.bufferSitef;
//   }
//
//   @override
//   set bufferSitef(String? value) {
//     _$bufferSitefAtom.reportWrite(value, super.bufferSitef, () {
//       super.bufferSitef = value;
//     });
//   }
//
//   late final _$permiteCancelarAtom =
//       Atom(name: 'TransacaoTefBase.permiteCancelar', context: context);
//
//   @override
//   bool get permiteCancelar {
//     _$permiteCancelarAtom.reportRead();
//     return super.permiteCancelar;
//   }
//
//   @override
//   set permiteCancelar(bool value) {
//     _$permiteCancelarAtom.reportWrite(value, super.permiteCancelar, () {
//       super.permiteCancelar = value;
//     });
//   }
//
//   late final _$comunicaWebSocketAsyncAction =
//       AsyncAction('TransacaoTefBase.comunicaWebSocket', context: context);
//
//   @override
//   Future<void> comunicaWebSocket(BuildContext context) {
//     return _$comunicaWebSocketAsyncAction
//         .run(() => super.comunicaWebSocket(context));
//   }
//
//   late final _$TransacaoTefBaseActionController =
//       ActionController(name: 'TransacaoTefBase', context: context);
//
//   @override
//   dynamic atualizaBuffer(String value) {
//     final _$actionInfo = _$TransacaoTefBaseActionController.startAction(
//         name: 'TransacaoTefBase.atualizaBuffer');
//     try {
//       return super.atualizaBuffer(value);
//     } finally {
//       _$TransacaoTefBaseActionController.endAction(_$actionInfo);
//     }
//   }
//
//   @override
//   dynamic atualizaPermiteCancelar(bool value) {
//     final _$actionInfo = _$TransacaoTefBaseActionController.startAction(
//         name: 'TransacaoTefBase.atualizaPermiteCancelar');
//     try {
//       return super.atualizaPermiteCancelar(value);
//     } finally {
//       _$TransacaoTefBaseActionController.endAction(_$actionInfo);
//     }
//   }
//
//   @override
//   String toString() {
//     return '''
// bufferSitef: ${bufferSitef},
// permiteCancelar: ${permiteCancelar}
//     ''';
//   }
// }
