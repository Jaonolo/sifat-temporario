// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_combo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoComboController on ProdutoComboBase, Store {
  late final _$tipoBotaoMenusAtom =
      Atom(name: 'ProdutoComboBase.tipoBotaoMenus', context: context);

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
      Atom(name: 'ProdutoComboBase.produtoCarrinho', context: context);

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
      Atom(name: 'ProdutoComboBase.produtoMenu', context: context);

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
      Atom(name: 'ProdutoComboBase.proximoMenu', context: context);

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
      Atom(name: 'ProdutoComboBase.anteriorMenu', context: context);

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
  void atualizaTipoBotaoMenus(
      {bool revisao = false, bool escolheuCompomenteExtra = false}) {
    final _$actionInfo = _$ProdutoComboBaseActionController.startAction(
        name: 'ProdutoComboBase.atualizaTipoBotaoMenus');
    try {
      return super.atualizaTipoBotaoMenus(
          revisao: revisao, escolheuCompomenteExtra: escolheuCompomenteExtra);
    } finally {
      _$ProdutoComboBaseActionController.endAction(_$actionInfo);
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
menu: ${menu}
    ''';
  }
}
