// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_adicional_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoAdicionalController on ProdutoAdicionalBase, Store {
  late final _$tipoBotaoMenusAtom =
      Atom(name: 'ProdutoAdicionalBase.tipoBotaoMenus', context: context);

  @override
  TipoBotaoMenus get tipoBotaoMenus {
    _$tipoBotaoMenusAtom.reportRead();
    return super.tipoBotaoMenus;
  }

  @override
  set tipoBotaoMenus(TipoBotaoMenus value) {
    _$tipoBotaoMenusAtom.reportWrite(value, super.tipoBotaoMenus, () {
      super.tipoBotaoMenus = value;
    });
  }

  late final _$produtoCarrinhoAtom =
      Atom(name: 'ProdutoAdicionalBase.produtoCarrinho', context: context);

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

  late final _$produtoMenuAtom =
      Atom(name: 'ProdutoAdicionalBase.produtoMenu', context: context);

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

  late final _$proximoMenuAtom =
      Atom(name: 'ProdutoAdicionalBase.proximoMenu', context: context);

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

  late final _$anteriorMenuAtom =
      Atom(name: 'ProdutoAdicionalBase.anteriorMenu', context: context);

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

  late final _$atualizaMenusAsyncAction =
      AsyncAction('ProdutoAdicionalBase.atualizaMenus', context: context);

  @override
  Future<void> atualizaMenus(int index) {
    return _$atualizaMenusAsyncAction.run(() => super.atualizaMenus(index));
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
  void atualizaTipoBotaoMenus(
      {bool revisao = false, bool escolheuCompomenteExtra = false}) {
    final _$actionInfo = _$ProdutoAdicionalBaseActionController.startAction(
        name: 'ProdutoAdicionalBase.atualizaTipoBotaoMenus');
    try {
      return super.atualizaTipoBotaoMenus(
          revisao: revisao, escolheuCompomenteExtra: escolheuCompomenteExtra);
    } finally {
      _$ProdutoAdicionalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoBotaoMenus: ${tipoBotaoMenus},
produtoCarrinho: ${produtoCarrinho},
produtoMenu: ${produtoMenu},
proximoMenu: ${proximoMenu},
anteriorMenu: ${anteriorMenu},
radiovalue: ${radiovalue}
    ''';
  }
}
