// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on SplashBase, Store {
  late final _$statusAtom = Atom(name: 'SplashBase.status', context: context);

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$botaoDetalhesErroAtom =
      Atom(name: 'SplashBase.botaoDetalhesErro', context: context);

  @override
  bool get botaoDetalhesErro {
    _$botaoDetalhesErroAtom.reportRead();
    return super.botaoDetalhesErro;
  }

  @override
  set botaoDetalhesErro(bool value) {
    _$botaoDetalhesErroAtom.reportWrite(value, super.botaoDetalhesErro, () {
      super.botaoDetalhesErro = value;
    });
  }

  late final _$SplashBaseActionController =
      ActionController(name: 'SplashBase', context: context);

  @override
  void changeStatus(String value) {
    final _$actionInfo = _$SplashBaseActionController.startAction(
        name: 'SplashBase.changeStatus');
    try {
      return super.changeStatus(value);
    } finally {
      _$SplashBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBotaoDetalhesErro(bool value, dynamic e) {
    final _$actionInfo = _$SplashBaseActionController.startAction(
        name: 'SplashBase.changeBotaoDetalhesErro');
    try {
      return super.changeBotaoDetalhesErro(value, e);
    } finally {
      _$SplashBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
botaoDetalhesErro: ${botaoDetalhesErro}
    ''';
  }
}
