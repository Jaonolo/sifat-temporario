// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SessaoController on SessaoBase, Store {
  late final _$carregandoAtom =
      Atom(name: 'SessaoBase.carregando', context: context);

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  late final _$buscarSessoesAsyncAction =
      AsyncAction('SessaoBase.buscarSessoes', context: context);

  @override
  Future<void> buscarSessoes() {
    return _$buscarSessoesAsyncAction.run(() => super.buscarSessoes());
  }

  late final _$encerrarSessaoAsyncAction =
      AsyncAction('SessaoBase.encerrarSessao', context: context);

  @override
  Future<void> encerrarSessao(DadosSessaoDTO dto) {
    return _$encerrarSessaoAsyncAction.run(() => super.encerrarSessao(dto));
  }

  @override
  String toString() {
    return '''
carregando: ${carregando}
    ''';
  }
}
