// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutoController on ProdutoControllerBase, Store {
  late final _$tipoBotaoNavegacaoMenusAtom = Atom(
      name: 'ProdutoControllerBase.tipoBotaoNavegacaoMenus', context: context);

  @override
  TipoBotaoNavegacaoMenu get tipoBotaoNavegacaoMenus {
    _$tipoBotaoNavegacaoMenusAtom.reportRead();
    return super.tipoBotaoNavegacaoMenus;
  }

  @override
  set tipoBotaoNavegacaoMenus(TipoBotaoNavegacaoMenu value) {
    _$tipoBotaoNavegacaoMenusAtom
        .reportWrite(value, super.tipoBotaoNavegacaoMenus, () {
      super.tipoBotaoNavegacaoMenus = value;
    });
  }

  late final _$produtoCarrinhoAtom =
      Atom(name: 'ProdutoControllerBase.produtoCarrinho', context: context);

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
      Atom(name: 'ProdutoControllerBase.produtoMenu', context: context);

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
      Atom(name: 'ProdutoControllerBase.proximoMenu', context: context);

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
      Atom(name: 'ProdutoControllerBase.anteriorMenu', context: context);

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

  late final _$menuAtom =
      Atom(name: 'ProdutoControllerBase.menu', context: context);

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

  late final _$radiovalueAtom =
      Atom(name: 'ProdutoControllerBase.radiovalue', context: context);

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

  late final _$liberaBotaoMenusAtom =
      Atom(name: 'ProdutoControllerBase.liberaBotaoMenus', context: context);

  @override
  bool get liberaBotaoMenus {
    _$liberaBotaoMenusAtom.reportRead();
    return super.liberaBotaoMenus;
  }

  @override
  set liberaBotaoMenus(bool value) {
    _$liberaBotaoMenusAtom.reportWrite(value, super.liberaBotaoMenus, () {
      super.liberaBotaoMenus = value;
    });
  }

  late final _$atualizaMenusAsyncAction =
      AsyncAction('ProdutoControllerBase.atualizaMenus', context: context);

  @override
  Future<void> atualizaMenus(int index) {
    return _$atualizaMenusAsyncAction.run(() => super.atualizaMenus(index));
  }

  late final _$ProdutoControllerBaseActionController =
      ActionController(name: 'ProdutoControllerBase', context: context);

  @override
  void onLiberaBotaoMenus() {
    final _$actionInfo = _$ProdutoControllerBaseActionController.startAction(
        name: 'ProdutoControllerBase.onLiberaBotaoMenus');
    try {
      return super.onLiberaBotaoMenus();
    } finally {
      _$ProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeProdutoCarrinho(ProdutoCarrinho value) {
    final _$actionInfo = _$ProdutoControllerBaseActionController.startAction(
        name: 'ProdutoControllerBase.changeProdutoCarrinho');
    try {
      return super.changeProdutoCarrinho(value);
    } finally {
      _$ProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selecaoRadio(int n) {
    final _$actionInfo = _$ProdutoControllerBaseActionController.startAction(
        name: 'ProdutoControllerBase.selecaoRadio');
    try {
      return super.selecaoRadio(n);
    } finally {
      _$ProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void atualizaBotaoNavegacaoMenus(
      {bool revisao = false, bool escolheuCompomenteExtra = false}) {
    final _$actionInfo = _$ProdutoControllerBaseActionController.startAction(
        name: 'ProdutoControllerBase.atualizaBotaoNavegacaoMenus');
    try {
      return super.atualizaBotaoNavegacaoMenus(
          revisao: revisao, escolheuCompomenteExtra: escolheuCompomenteExtra);
    } finally {
      _$ProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoBotaoNavegacaoMenus: ${tipoBotaoNavegacaoMenus},
produtoCarrinho: ${produtoCarrinho},
produtoMenu: ${produtoMenu},
proximoMenu: ${proximoMenu},
anteriorMenu: ${anteriorMenu},
menu: ${menu},
radiovalue: ${radiovalue},
liberaBotaoMenus: ${liberaBotaoMenus}
    ''';
  }
}
