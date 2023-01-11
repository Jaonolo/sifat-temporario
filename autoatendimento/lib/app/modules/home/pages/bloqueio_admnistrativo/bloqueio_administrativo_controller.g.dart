// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloqueio_administrativo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BloqueioAdministrativoController on BloqueioAdministrativoBase, Store {
  late final _$senhaAtom =
      Atom(name: 'BloqueioAdministrativoBase.senha', context: context);

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$BloqueioAdministrativoBaseActionController =
      ActionController(name: 'BloqueioAdministrativoBase', context: context);

  @override
  void formatTyped(String value) {
    final _$actionInfo = _$BloqueioAdministrativoBaseActionController
        .startAction(name: 'BloqueioAdministrativoBase.formatTyped');
    try {
      return super.formatTyped(value);
    } finally {
      _$BloqueioAdministrativoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
senha: ${senha}
    ''';
  }
}
