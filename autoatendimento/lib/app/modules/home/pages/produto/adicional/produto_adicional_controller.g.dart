// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_adicional_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoAdicionalController on ProdutoAdicionalBase, Store {
  late final _$radiovalueAtom =
      Atom(name: 'ProdutoAdicionalBase.radiovalue', context: context);

  @override
  int get radiovalue {
    _$radiovalueAtom.reportRead();
    return super.radiovalue;
  }

  @override
  set radiovalue(int value) {
    _$radiovalueAtom.reportWrite(value, super.radiovalue, () {
      super.radiovalue = value;
    });
  }

  late final _$ProdutoAdicionalBaseActionController =
      ActionController(name: 'ProdutoAdicionalBase', context: context);

  @override
  dynamic changeProdutoCarrinho(ProdutoCarrinho value) {
    final _$actionInfo = _$ProdutoAdicionalBaseActionController.startAction(
        name: 'ProdutoAdicionalBase.changeProdutoCarrinho');
    try {
      return super.changeProdutoCarrinho(value);
    } finally {
      _$ProdutoAdicionalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selecaoRadio(int n) {
    final _$actionInfo = _$ProdutoAdicionalBaseActionController.startAction(
        name: 'ProdutoAdicionalBase.selecaoRadio');
    try {
      return super.selecaoRadio(n);
    } finally {
      _$ProdutoAdicionalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
radiovalue: ${radiovalue}
    ''';
  }
}
