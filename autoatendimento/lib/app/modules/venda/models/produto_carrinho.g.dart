// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_carrinho.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoCarrinho on _ProdutoCarrinhoBase, Store {
  final _$notaItemAtom = Atom(name: '_ProdutoCarrinhoBase.notaItem');

  @override
  NotaItem get notaItem {
    _$notaItemAtom.reportRead();
    return super.notaItem;
  }

  @override
  set notaItem(NotaItem value) {
    _$notaItemAtom.reportWrite(value, super.notaItem, () {
      super.notaItem = value;
    });
  }

  final _$_ProdutoCarrinhoBaseActionController =
  ActionController(name: '_ProdutoCarrinhoBase');

  @override
  void adicionar() {
    final _$actionInfo = _$_ProdutoCarrinhoBaseActionController.startAction(
        name: '_ProdutoCarrinhoBase.adicionar');
    try {
      return super.adicionar();
    } finally {
      _$_ProdutoCarrinhoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remover({Function? ultimoPedido}) {
    final _$actionInfo = _$_ProdutoCarrinhoBaseActionController.startAction(
        name: '_ProdutoCarrinhoBase.remover');
    try {
      return super.remover(ultimoPedido: ultimoPedido);
    } finally {
      _$_ProdutoCarrinhoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notaItem: ${notaItem}
    ''';
  }
}
