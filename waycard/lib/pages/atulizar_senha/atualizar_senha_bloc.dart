import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class AtualizarSenhaBloc extends BlocBase {
  StreamController<bool> _novaSenhaController = StreamController.broadcast();

  StreamController<bool> _senhaAtualController = StreamController.broadcast();

  StreamController<bool> _confirmacaoNovaSenhaController = StreamController
      .broadcast();

  get novaSenhaStream => _novaSenhaController.stream;

  get senhaAtualStream => _senhaAtualController.stream;

  get confirmacaoNovaSenhaStream => _confirmacaoNovaSenhaController.stream;

  void changeNovaSenha(bool value) => _novaSenhaController.sink.add(value);

  void changeSenhaAtual(bool value) => _senhaAtualController.sink.add(value);

  void changeConfirmacaoNovaSenha(bool value) =>
      _confirmacaoNovaSenhaController.sink.add(value);

  @override
  void dispose() {
    _novaSenhaController.close();
    _senhaAtualController.close();
    _confirmacaoNovaSenhaController.close();
    super.dispose();
  }
}