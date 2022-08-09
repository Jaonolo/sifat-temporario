// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pendencia_fiscal_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PendenciaFiscalController on PendenciaFiscalBase, Store {
  late final _$pendenciasAtom =
      Atom(name: 'PendenciaFiscalBase.pendencias', context: context);

  @override
  ObservableList<Pendencia> get pendencias {
    _$pendenciasAtom.reportRead();
    return super.pendencias;
  }

  @override
  set pendencias(ObservableList<Pendencia> value) {
    _$pendenciasAtom.reportWrite(value, super.pendencias, () {
      super.pendencias = value;
    });
  }

  late final _$adicionarPendenciasAsyncAction =
      AsyncAction('PendenciaFiscalBase.adicionarPendencias', context: context);

  @override
  Future<void> adicionarPendencias(List<Pendencia> pendencia) {
    return _$adicionarPendenciasAsyncAction
        .run(() => super.adicionarPendencias(pendencia));
  }

  late final _$carregaPendenciasAsyncAction =
      AsyncAction('PendenciaFiscalBase.carregaPendencias', context: context);

  @override
  Future<List<Pendencia>> carregaPendencias() {
    return _$carregaPendenciasAsyncAction.run(() => super.carregaPendencias());
  }

  @override
  String toString() {
    return '''
pendencias: ${pendencias}
    ''';
  }
}
