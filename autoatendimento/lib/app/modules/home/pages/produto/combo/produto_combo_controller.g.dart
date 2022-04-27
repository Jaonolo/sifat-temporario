// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_combo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoComboController on ProdutoComboBase, Store {
  late final _$menuAtom = Atom(name: 'ProdutoComboBase.menu', context: context);

  @override
  NotaItem? get menu {
    _$menuAtom.reportRead();
    return super.menu;
  }

  @override
  set menu(NotaItem? value) {
    _$menuAtom.reportWrite(value, super.menu, () {
      super.menu = value;
    });
  }

  late final _$ProdutoComboBaseActionController =
      ActionController(name: 'ProdutoComboBase', context: context);

  @override
  dynamic setarCarrinhoOriginal(ProdutoCarrinho original) {
    final _$actionInfo = _$ProdutoComboBaseActionController.startAction(
        name: 'ProdutoComboBase.setarCarrinhoOriginal');
    try {
      return super.setarCarrinhoOriginal(original);
    } finally {
      _$ProdutoComboBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeNotaItemMenu() {
    final _$actionInfo = _$ProdutoComboBaseActionController.startAction(
        name: 'ProdutoComboBase._changeNotaItemMenu');
    try {
      return super._changeNotaItemMenu();
    } finally {
      _$ProdutoComboBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
menu: ${menu}
    ''';
  }
}
