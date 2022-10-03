// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venda_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VendaController on VendaBase, Store {
  late final _$notaAtom = Atom(name: 'VendaBase.nota', context: context);

  @override
  Nota get nota {
    _$notaAtom.reportRead();
    return super.nota;
  }

  @override
  set nota(Nota value) {
    _$notaAtom.reportWrite(value, super.nota, () {
      super.nota = value;
    });
  }

  late final _$itensLancadosAtom =
      Atom(name: 'VendaBase.itensLancados', context: context);

  @override
  ObservableList<ProdutoCarrinho> get itensLancados {
    _$itensLancadosAtom.reportRead();
    return super.itensLancados;
  }

  @override
  set itensLancados(ObservableList<ProdutoCarrinho> value) {
    _$itensLancadosAtom.reportWrite(value, super.itensLancados, () {
      super.itensLancados = value;
    });
  }

  late final _$adicionarProdutoCarrinhoAsyncAction =
      AsyncAction('VendaBase.adicionarProdutoCarrinho', context: context);

  @override
  Future<void> adicionarProdutoCarrinho(ProdutoCarrinho value) {
    return _$adicionarProdutoCarrinhoAsyncAction
        .run(() => super.adicionarProdutoCarrinho(value));
  }

  late final _$VendaBaseActionController =
      ActionController(name: 'VendaBase', context: context);

  @override
  void novaNota() {
    final _$actionInfo =
        _$VendaBaseActionController.startAction(name: 'VendaBase.novaNota');
    try {
      return super.novaNota();
    } finally {
      _$VendaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic descartarNota() {
    final _$actionInfo = _$VendaBaseActionController.startAction(
        name: 'VendaBase.descartarNota');
    try {
      return super.descartarNota();
    } finally {
      _$VendaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerProdutoCarrinho(int index) {
    final _$actionInfo = _$VendaBaseActionController.startAction(
        name: 'VendaBase.removerProdutoCarrinho');
    try {
      return super.removerProdutoCarrinho(index);
    } finally {
      _$VendaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nota: ${nota},
itensLancados: ${itensLancados}
    ''';
  }
}
