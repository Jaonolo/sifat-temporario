// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'home_controller.dart';
//
// // **************************************************************************
// // StoreGenerator
// // **************************************************************************
//
// // ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers
//
// mixin _$HomeController on HomeBase, Store {
//   late final _$habilitarCarrinhoAtom =
//       Atom(name: 'HomeBase.habilitarCarrinho', context: context);
//
//   @override
//   bool get habilitarCarrinho {
//     _$habilitarCarrinhoAtom.reportRead();
//     return super.habilitarCarrinho;
//   }
//
//   @override
//   set habilitarCarrinho(bool value) {
//     _$habilitarCarrinhoAtom.reportWrite(value, super.habilitarCarrinho, () {
//       super.habilitarCarrinho = value;
//     });
//   }
//
//   late final _$apareceCarrinhoAtom =
//       Atom(name: 'HomeBase.apareceCarrinho', context: context);
//
//   @override
//   bool get apareceCarrinho {
//     _$apareceCarrinhoAtom.reportRead();
//     return super.apareceCarrinho;
//   }
//
//   @override
//   set apareceCarrinho(bool value) {
//     _$apareceCarrinhoAtom.reportWrite(value, super.apareceCarrinho, () {
//       super.apareceCarrinho = value;
//     });
//   }
//
//   late final _$menuSelecionadoAtom =
//       Atom(name: 'HomeBase.menuSelecionado', context: context);
//
//   @override
//   CardapioMenu get menuSelecionado {
//     _$menuSelecionadoAtom.reportRead();
//     return super.menuSelecionado;
//   }
//
//   @override
//   set menuSelecionado(CardapioMenu value) {
//     _$menuSelecionadoAtom.reportWrite(value, super.menuSelecionado, () {
//       super.menuSelecionado = value;
//     });
//   }
//
//   late final _$palcoAtom = Atom(name: 'HomeBase.palco', context: context);
//
//   @override
//   ObservableList<Widget> get palco {
//     _$palcoAtom.reportRead();
//     return super.palco;
//   }
//
//   @override
//   set palco(ObservableList<Widget> value) {
//     _$palcoAtom.reportWrite(value, super.palco, () {
//       super.palco = value;
//     });
//   }
//
//   late final _$HomeBaseActionController =
//       ActionController(name: 'HomeBase', context: context);
//
//   @override
//   dynamic changeMenuSelecionado(CardapioMenu value) {
//     final _$actionInfo = _$HomeBaseActionController.startAction(
//         name: 'HomeBase.changeMenuSelecionado');
//     try {
//       return super.changeMenuSelecionado(value);
//     } finally {
//       _$HomeBaseActionController.endAction(_$actionInfo);
//     }
//   }
//
//   @override
//   dynamic addPalco(Widget value) {
//     final _$actionInfo =
//         _$HomeBaseActionController.startAction(name: 'HomeBase.addPalco');
//     try {
//       return super.addPalco(value);
//     } finally {
//       _$HomeBaseActionController.endAction(_$actionInfo);
//     }
//   }
//
//   @override
//   dynamic removePalco() {
//     final _$actionInfo =
//         _$HomeBaseActionController.startAction(name: 'HomeBase.removePalco');
//     try {
//       return super.removePalco();
//     } finally {
//       _$HomeBaseActionController.endAction(_$actionInfo);
//     }
//   }
//
//   @override
//   void onMostrarCarrinho() {
//     final _$actionInfo = _$HomeBaseActionController.startAction(
//         name: 'HomeBase.onMostrarCarrinho');
//     try {
//       return super.onMostrarCarrinho();
//     } finally {
//       _$HomeBaseActionController.endAction(_$actionInfo);
//     }
//   }
//
//   @override
//   void recomecar() {
//     final _$actionInfo =
//         _$HomeBaseActionController.startAction(name: 'HomeBase.recomecar');
//     try {
//       return super.recomecar();
//     } finally {
//       _$HomeBaseActionController.endAction(_$actionInfo);
//     }
//   }
//
//   @override
//   String toString() {
//     return '''
// habilitarCarrinho: ${habilitarCarrinho},
// apareceCarrinho: ${apareceCarrinho},
// menuSelecionado: ${menuSelecionado},
// palco: ${palco}
//     ''';
//   }
// }
