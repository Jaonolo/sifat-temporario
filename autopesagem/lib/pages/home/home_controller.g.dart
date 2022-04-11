// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$pesoAtom = Atom(name: 'HomeControllerBase.peso');

  @override
  BigDecimal get peso {
    _$pesoAtom.reportRead();
    return super.peso;
  }

  @override
  set peso(BigDecimal value) {
    _$pesoAtom.reportWrite(value, super.peso, () {
      super.peso = value;
    });
  }

  final _$valorTotalAtom = Atom(name: 'HomeControllerBase.valorTotal');

  @override
  BigDecimal get valorTotal {
    _$valorTotalAtom.reportRead();
    return super.valorTotal;
  }

  @override
  set valorTotal(BigDecimal value) {
    _$valorTotalAtom.reportWrite(value, super.valorTotal, () {
      super.valorTotal = value;
    });
  }

  final _$controleBalancaAtom =
  Atom(name: 'HomeControllerBase.controleBalanca');

  @override
  bool get controleBalanca {
    _$controleBalancaAtom.reportRead();
    return super.controleBalanca;
  }

  @override
  set controleBalanca(bool value) {
    _$controleBalancaAtom.reportWrite(value, super.controleBalanca, () {
      super.controleBalanca = value;
    });
  }

  final _$atualizaDadosAsyncAction =
  AsyncAction('HomeControllerBase.atualizaDados');

  @override
  Future<void> atualizaDados(ResponsePws retornoLeitura, BuildContext context) {
    return _$atualizaDadosAsyncAction
        .run(() => super.atualizaDados(retornoLeitura, context));
  }

  @override
  String toString() {
    return '''
peso: ${peso},
valorTotal: ${valorTotal},
controleBalanca: ${controleBalanca}
    ''';
  }
}
