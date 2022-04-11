// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_adicional_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoAdicionalController on ProdutoAdicionalBase, Store {
  final _$produtoCarrinhoAtom =
  Atom(name: 'ProdutoAdicionalBase.produtoCarrinho');

  @override
  ProdutoCarrinho get produtoCarrinho {
    _$produtoCarrinhoAtom.reportRead();
    return super.produtoCarrinho;
  }

  @override
  set produtoCarrinho(ProdutoCarrinho value) {
    _$produtoCarrinhoAtom.reportWrite(value, super.produtoCarrinho, () {
      super.produtoCarrinho = value;
    });
  }

  final _$produtoMenuAtom = Atom(name: 'ProdutoAdicionalBase.produtoMenu');

  @override
  ProdutoMenu? get produtoMenu {
    _$produtoMenuAtom.reportRead();
    return super.produtoMenu;
  }

  @override
  set produtoMenu(ProdutoMenu? value) {
    _$produtoMenuAtom.reportWrite(value, super.produtoMenu, () {
      super.produtoMenu = value;
    });
  }

  final _$proximoMenuAtom = Atom(name: 'ProdutoAdicionalBase.proximoMenu');

  @override
  ProdutoMenu? get proximoMenu {
    _$proximoMenuAtom.reportRead();
    return super.proximoMenu;
  }

  @override
  set proximoMenu(ProdutoMenu? value) {
    _$proximoMenuAtom.reportWrite(value, super.proximoMenu, () {
      super.proximoMenu = value;
    });
  }

  final _$anteriorMenuAtom = Atom(name: 'ProdutoAdicionalBase.anteriorMenu');

  @override
  ProdutoMenu? get anteriorMenu {
    _$anteriorMenuAtom.reportRead();
    return super.anteriorMenu;
  }

  @override
  set anteriorMenu(ProdutoMenu? value) {
    _$anteriorMenuAtom.reportWrite(value, super.anteriorMenu, () {
      super.anteriorMenu = value;
    });
  }

  final _$radiovalueAtom = Atom(name: 'ProdutoAdicionalBase.radiovalue');

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

  final _$atualizaMenusAsyncAction =
  AsyncAction('ProdutoAdicionalBase.atualizaMenus');

  @override
  Future<void> atualizaMenus(int index) {
    return _$atualizaMenusAsyncAction.run(() => super.atualizaMenus(index));
  }

  final _$ProdutoAdicionalBaseActionController =
  ActionController(name: 'ProdutoAdicionalBase');

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
produtoCarrinho: ${produtoCarrinho},
produtoMenu: ${produtoMenu},
proximoMenu: ${proximoMenu},
anteriorMenu: ${anteriorMenu},
radiovalue: ${radiovalue}
    ''';
  }
}
